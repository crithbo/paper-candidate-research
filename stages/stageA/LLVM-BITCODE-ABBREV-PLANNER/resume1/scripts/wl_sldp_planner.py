#!/usr/bin/env python3
"""WL-SLDP: width-ladder scoped/local dynamic planning for native LLVM bitcode.

This implementation operates on the frozen expanded record trace.  It emits
only ordinary LLVM bitstream grammar operations and unchanged records.  The
bounded Stage-A executable domain is deliberately fail-closed: only leaf
blocks whose size may change without invalidating frozen absolute-offset record
values are eligible.  All other bytes are re-emitted with the parsed B0 grammar.

Arms:
  B0  native writer bytes (identity)
  B1  exact current-grammar subset/assignment oracle
  B2  greedy planner over the full bounded template universe
  WL  width-ladder exhaustive leaf frontiers + global definition-budget DP

The candidate is not an external compressor or a post-hoc byte codec.  Every
selected action maps to DEFINE_ABBREV placement, native abbreviation operands,
application-ID assignment, fixed block CodeLen, record assignment/fallback,
and legal writer order.
"""

from __future__ import annotations

import argparse
import copy
import dataclasses
import hashlib
import importlib.util
import itertools
import json
import math
import pathlib
import sys
import time
import tracemalloc
from collections import Counter, defaultdict
from typing import Any, Iterable, Optional


def load_codec(path: pathlib.Path) -> Any:
    spec = importlib.util.spec_from_file_location("frozen_bitstream_lab", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load frozen codec {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def abbrev_key(abbrev: Any) -> str:
    return json.dumps(abbrev.as_json(), sort_keys=True, separators=(",", ":"))


def app_code_width(abbrev_count: int) -> int:
    """Smallest fixed native CodeLen representing every installed app ID."""
    if abbrev_count == 0:
        return 2
    highest_id = 3 + abbrev_count
    return max(2, highest_id.bit_length())


def char6_encodable(codec: Any, value: int) -> bool:
    try:
        codec.encode_char6(value)
        return True
    except codec.FormatError:
        return False


def choose_scalar_op(codec: Any, values: list[int]) -> Any:
    if not values:
        raise ValueError("empty scalar population")
    if len(set(values)) == 1:
        return codec.AbbrevOp(literal=values[0])
    candidates: list[tuple[int, int, Any]] = []
    fixed_width = max(1, max(values).bit_length())
    candidates.append((fixed_width * len(values), 0,
                       codec.AbbrevOp(encoding=codec.FIXED, data=fixed_width)))
    for rank, width in enumerate((4, 5, 6, 8), 1):
        bits = 0
        payload = width - 1
        for value in values:
            groups = max(1, math.ceil(max(1, value.bit_length()) / payload))
            bits += groups * width
        candidates.append((bits, rank, codec.AbbrevOp(encoding=codec.VBR, data=width)))
    if all(char6_encodable(codec, value) for value in values):
        candidates.append((6 * len(values), 9, codec.AbbrevOp(encoding=codec.CHAR6)))
    return min(candidates, key=lambda row: (row[0], row[1]))[2]


def abbrev_matches(codec: Any, abbrev: Any, record: Any) -> bool:
    values = [record.code] + list(record.values)
    value_index = 0
    saw_blob = False
    i = 0
    while i < len(abbrev.ops):
        op = abbrev.ops[i]
        if op.encoding == codec.BLOB:
            if i != len(abbrev.ops) - 1 or record.blob is None:
                return False
            saw_blob = True
            i += 1
            continue
        if op.encoding == codec.ARRAY:
            if i + 1 != len(abbrev.ops) - 1:
                return False
            element = abbrev.ops[i + 1]
            while value_index < len(values):
                if not scalar_matches(codec, element, values[value_index]):
                    return False
                value_index += 1
            i += 2
            continue
        if value_index >= len(values) or not scalar_matches(codec, op, values[value_index]):
            return False
        value_index += 1
        i += 1
    return value_index == len(values) and saw_blob == (record.blob is not None)


def scalar_matches(codec: Any, op: Any, value: int) -> bool:
    if op.literal is not None:
        return value == op.literal
    if op.encoding == codec.FIXED:
        return value < (1 << int(op.data))
    if op.encoding == codec.VBR:
        return value >= 0
    if op.encoding == codec.CHAR6:
        return char6_encodable(codec, value)
    return False


def generate_templates(codec: Any, records: list[Any]) -> list[Any]:
    """Deterministic transparent grammar constructor, no opaque solver."""
    generated: list[Any] = []
    groups: dict[tuple[int, bool, int], list[Any]] = defaultdict(list)
    code_groups: dict[tuple[int, bool], list[Any]] = defaultdict(list)
    for record in records:
        groups[(record.code, record.blob is not None, len(record.values))].append(record)
        code_groups[(record.code, record.blob is not None)].append(record)

    for (code, has_blob, length), group in sorted(groups.items()):
        if has_blob:
            value_ops = [
                choose_scalar_op(codec, [r.values[pos] for r in group])
                for pos in range(length)
            ]
            generated.append(codec.Abbrev(
                [codec.AbbrevOp(literal=code)] + value_ops
                + [codec.AbbrevOp(encoding=codec.BLOB)]
            ))
            continue
        if len(group) < 2:
            continue
        ops = [codec.AbbrevOp(literal=code)]
        for pos in range(length):
            ops.append(choose_scalar_op(codec, [r.values[pos] for r in group]))
        generated.append(codec.Abbrev(ops))

    for (code, has_blob), group in sorted(code_groups.items()):
        if has_blob or len(group) < 2:
            continue
        flattened = [value for record in group for value in record.values]
        if not flattened:
            continue
        element = choose_scalar_op(codec, flattened)
        generated.append(codec.Abbrev([
            codec.AbbrevOp(literal=code),
            codec.AbbrevOp(encoding=codec.ARRAY),
            element,
        ]))

    unique: dict[str, Any] = {}
    for abbrev in generated:
        unique.setdefault(abbrev_key(abbrev), abbrev)
    return [unique[key] for key in sorted(unique)]


def emit_delta(codec: Any, record: Any, width: int, abbrev_id: int,
               abbrev: Optional[Any], start_mod: int) -> int:
    writer = codec.BitWriter()
    if start_mod:
        writer.emit(0, start_mod)
    start = writer.bitpos
    codec.emit_record(writer, width, record, abbrev_id, abbrev)
    return writer.bitpos - start


@dataclasses.dataclass
class BlockPlan:
    path: tuple[int, ...]
    block_id: int
    mode: str
    selected: list[Any]
    assignments: list[int]
    code_width: int
    body_bits: int
    definition_count: int
    original_body_bits: int
    original_local_count: int
    universe_keys: list[str]
    current_keys: list[str]
    selected_keys: list[str]
    novel_selected_keys: list[str]
    first_use_order: list[str]

    def json(self) -> dict[str, Any]:
        row = dataclasses.asdict(self)
        row["path"] = list(self.path)
        row.pop("selected")
        return row


def first_use_order(codec: Any, selected: Iterable[Any], records: list[Any]) -> list[Any]:
    def first(abbrev: Any) -> tuple[int, str]:
        for index, record in enumerate(records):
            if abbrev_matches(codec, abbrev, record):
                return index, abbrev_key(abbrev)
        return len(records) + 1, abbrev_key(abbrev)
    return sorted(selected, key=first)


def evaluate_selection(codec: Any, path: tuple[int, ...], block: Any,
                       selected: Iterable[Any], universe_keys: list[str],
                       current_keys: list[str], mode: str) -> Optional[BlockPlan]:
    records = [x for x in block.items if isinstance(x, codec.Record)]
    if any(isinstance(x, codec.Block) for x in block.items):
        raise ValueError("planner leaf frontier received a non-leaf block")
    ordered = first_use_order(codec, selected, records)
    active = list(block.inherited_abbrevs) + ordered
    width = app_code_width(len(active))

    prefix_writer = codec.BitWriter()
    for abbrev in ordered:
        codec.emit_abbrev(prefix_writer, width, abbrev)
    prefix_bits = prefix_writer.bitpos

    # Exact assignment DP.  A state is the least bit count at one native
    # 32-bit alignment residue; blob alignment is therefore exact.
    states: dict[int, tuple[int, list[int]]] = {
        prefix_bits % 32: (prefix_bits, [])
    }
    for record in records:
        choices: list[tuple[int, Optional[Any]]] = []
        if record.blob is None:
            choices.append((codec.UNABBREV_RECORD, None))
        for index, abbrev in enumerate(active):
            if abbrev_matches(codec, abbrev, record):
                choices.append((codec.FIRST_APPLICATION_ABBREV + index, abbrev))
        if not choices:
            return None
        next_states: dict[int, tuple[int, list[int]]] = {}
        for _, (bits, assignments) in states.items():
            for abbrev_id, abbrev in choices:
                delta = emit_delta(codec, record, width, abbrev_id, abbrev, bits % 32)
                new_bits = bits + delta
                residue = new_bits % 32
                prior = next_states.get(residue)
                candidate = (new_bits, assignments + [abbrev_id])
                if prior is None or (candidate[0], candidate[1]) < (prior[0], prior[1]):
                    next_states[residue] = candidate
        states = next_states

    best: Optional[tuple[int, list[int]]] = None
    for bits, assignments in states.values():
        ended = bits + width
        aligned = (ended + 31) & ~31
        candidate = (aligned, assignments)
        if best is None or (candidate[0], candidate[1]) < (best[0], best[1]):
            best = candidate
    if best is None:
        return None
    original_defs = [x for x in block.items if isinstance(x, codec.Define)]
    selected_keys = [abbrev_key(a) for a in ordered]
    return BlockPlan(
        path=path,
        block_id=block.block_id,
        mode=mode,
        selected=ordered,
        assignments=best[1],
        code_width=width,
        body_bits=best[0],
        definition_count=len(ordered),
        original_body_bits=block.declared_words * 32,
        original_local_count=len(original_defs),
        universe_keys=universe_keys,
        current_keys=current_keys,
        selected_keys=selected_keys,
        novel_selected_keys=[key for key in selected_keys if key not in set(current_keys)],
        first_use_order=selected_keys,
    )


def block_universe(codec: Any, block: Any, cap: int) -> tuple[list[Any], list[Any], set[str]]:
    records = [x for x in block.items if isinstance(x, codec.Record)]
    current = [x.abbrev for x in block.items if isinstance(x, codec.Define)]
    generated = generate_templates(codec, records)
    unique: dict[str, Any] = {}
    for abbrev in current + generated:
        unique.setdefault(abbrev_key(abbrev), abbrev)

    def rank(abbrev: Any) -> tuple[int, int, str]:
        matches = sum(abbrev_matches(codec, abbrev, r) for r in records)
        blob = any(r.blob is not None and abbrev_matches(codec, abbrev, r) for r in records)
        return (0 if blob else 1, -matches, abbrev_key(abbrev))

    ordered = sorted(unique.values(), key=rank)
    mandatory: set[str] = set()
    for record in records:
        if record.blob is None:
            continue
        matches = [a for a in ordered if abbrev_matches(codec, a, record)]
        if not matches:
            raise RuntimeError("no legal native Blob grammar in candidate universe")
        mandatory.add(abbrev_key(matches[0]))
    mandatory_abbrevs = [a for a in ordered if abbrev_key(a) in mandatory]
    others = [a for a in ordered if abbrev_key(a) not in mandatory]
    bounded = (mandatory_abbrevs + others)[:max(cap, len(mandatory_abbrevs))]
    return bounded, current, mandatory


def exact_frontier(codec: Any, path: tuple[int, ...], block: Any,
                   universe: list[Any], current: list[Any], mandatory: set[str],
                   max_defs: int, mode: str) -> dict[int, BlockPlan]:
    keys = [abbrev_key(a) for a in universe]
    current_keys = [abbrev_key(a) for a in current]
    mandatory_indices = {i for i, key in enumerate(keys) if key in mandatory}
    optional_indices = [i for i in range(len(universe)) if i not in mandatory_indices]
    frontier: dict[int, BlockPlan] = {}
    for optional_count in range(0, min(len(optional_indices), max_defs - len(mandatory_indices)) + 1):
        for chosen_optional in itertools.combinations(optional_indices, optional_count):
            indices = sorted(mandatory_indices | set(chosen_optional))
            selected = [universe[i] for i in indices]
            plan = evaluate_selection(codec, path, block, selected, keys, current_keys, mode)
            if plan is None:
                continue
            old = frontier.get(plan.definition_count)
            if old is None or (plan.body_bits, plan.selected_keys) < (old.body_bits, old.selected_keys):
                frontier[plan.definition_count] = plan
    return frontier


def greedy_plan(codec: Any, path: tuple[int, ...], block: Any,
                universe: list[Any], current: list[Any], mandatory: set[str],
                max_defs: int) -> Optional[BlockPlan]:
    keys = [abbrev_key(a) for a in universe]
    current_keys = [abbrev_key(a) for a in current]
    selected = [a for a in universe if abbrev_key(a) in mandatory]
    remaining = [a for a in universe if abbrev_key(a) not in mandatory]
    best = evaluate_selection(codec, path, block, selected, keys, current_keys, "B2_GREEDY")
    if best is None:
        return None
    while remaining and len(selected) < max_defs:
        trials: list[tuple[int, str, Any, BlockPlan]] = []
        for abbrev in remaining:
            plan = evaluate_selection(
                codec, path, block, selected + [abbrev], keys, current_keys, "B2_GREEDY"
            )
            if plan is not None:
                trials.append((plan.body_bits, abbrev_key(abbrev), abbrev, plan))
        if not trials:
            break
        _, _, chosen, trial = min(trials, key=lambda row: (row[0], row[1]))
        if trial.body_bits >= best.body_bits:
            break
        selected.append(chosen)
        remaining = [a for a in remaining if abbrev_key(a) != abbrev_key(chosen)]
        best = trial
    return best


def get_block(blocks: list[Any], path: tuple[int, ...]) -> Any:
    current: Any = blocks[path[0]]
    for item_index in path[1:]:
        current = current.items[item_index]
    return current


def eligible_leaf_paths(codec: Any, blocks: list[Any]) -> list[tuple[int, ...]]:
    """Frozen fail-closed offset-safe executable domain."""
    result: list[tuple[int, ...]] = []
    module_top = next((i for i, b in enumerate(blocks) if b.block_id == 8), None)
    if module_top is not None:
        module = blocks[module_top]
        direct_children = [
            (i, item) for i, item in enumerate(module.items)
            if isinstance(item, codec.Block) and item.block_id != codec.BLOCKINFO_BLOCK_ID
        ]
        # A final module-level VST may shrink: its start (the offset target) is
        # unchanged and no later in-module target is shifted.
        if direct_children:
            item_index, child = direct_children[-1]
            if child.block_id == 14 and not any(isinstance(x, codec.Block) for x in child.items):
                result.append((module_top, item_index))
    if module_top is not None:
        for index in range(module_top + 1, len(blocks)):
            block = blocks[index]
            if block.block_id != codec.BLOCKINFO_BLOCK_ID and not any(
                isinstance(x, codec.Block) for x in block.items
            ):
                result.append((index,))
    return result


def choose_global(frontiers: list[dict[int, BlockPlan]], budget: int) -> dict[tuple[int, ...], BlockPlan]:
    # Forest DP: each leaf supplies its exact width-ladder frontier; convolution
    # couples them under one global local-definition budget.
    states: dict[int, tuple[int, dict[tuple[int, ...], BlockPlan]]] = {0: (0, {})}
    for frontier in frontiers:
        next_states: dict[int, tuple[int, dict[tuple[int, ...], BlockPlan]]] = {}
        for used, (bits, plans) in states.items():
            for defs, plan in frontier.items():
                total_defs = used + defs
                if total_defs > budget:
                    continue
                candidate = (bits + plan.body_bits, {**plans, plan.path: plan})
                prior = next_states.get(total_defs)
                tie = sorted((list(p), v.selected_keys) for p, v in candidate[1].items())
                prior_tie = (
                    sorted((list(p), v.selected_keys) for p, v in prior[1].items())
                    if prior is not None else None
                )
                if prior is None or candidate[0] < prior[0] or (
                    candidate[0] == prior[0] and tie < prior_tie
                ):
                    next_states[total_defs] = candidate
        states = next_states
    if not states:
        return {}
    _, (_, plans) = min(states.items(), key=lambda row: (row[1][0], row[0]))
    return plans


def emit_planned_block(codec: Any, child: Any, block: Any, plan: BlockPlan) -> None:
    active = list(block.inherited_abbrevs) + plan.selected
    for abbrev in plan.selected:
        codec.emit_abbrev(child, plan.code_width, abbrev)
    records = [x for x in block.items if isinstance(x, codec.Record)]
    if len(records) != len(plan.assignments):
        raise RuntimeError("assignment length mismatch")
    for record, abbrev_id in zip(records, plan.assignments):
        abbrev = None
        if abbrev_id != codec.UNABBREV_RECORD:
            index = abbrev_id - codec.FIRST_APPLICATION_ABBREV
            abbrev = active[index]
        codec.emit_record(child, plan.code_width, record, abbrev_id, abbrev)
    child.emit(codec.END_BLOCK, plan.code_width)


def emit_tree(codec: Any, parent: Any, parent_width: int, block: Any,
              path: tuple[int, ...], plans: dict[tuple[int, ...], BlockPlan]) -> None:
    plan = plans.get(path)
    child = codec.BitWriter()
    if plan is not None:
        emit_planned_block(codec, child, block, plan)
        code_width = plan.code_width
    else:
        active = list(block.inherited_abbrevs)
        for item_index, item in enumerate(block.items):
            if isinstance(item, codec.Define):
                codec.emit_abbrev(child, block.code_width, item.abbrev)
                if block.block_id != codec.BLOCKINFO_BLOCK_ID:
                    active.append(item.abbrev)
            elif isinstance(item, codec.Block):
                emit_tree(codec, child, block.code_width, item, path + (item_index,), plans)
            elif isinstance(item, codec.Record):
                abbrev = None
                if item.abbrev_id != codec.UNABBREV_RECORD:
                    abbrev = active[item.abbrev_id - codec.FIRST_APPLICATION_ABBREV]
                codec.emit_record(child, block.code_width, item, item.abbrev_id, abbrev)
            else:
                raise codec.FormatError(f"unexpected item {type(item)}")
        child.emit(codec.END_BLOCK, block.code_width)
        code_width = block.code_width
    child_bytes = child.bytes()
    parent.emit(codec.ENTER_SUBBLOCK, parent_width)
    parent.vbr(block.block_id, 8)
    parent.vbr(code_width, 4)
    parent.align32()
    parent.emit(len(child_bytes) // 4, 32)
    parent.align32()
    parent.append_aligned(child_bytes)


def reemit(codec: Any, blocks: list[Any], plans: dict[tuple[int, ...], BlockPlan]) -> bytes:
    writer = codec.BitWriter()
    writer.buf.extend(b"BC\xc0\xde")
    for index, block in enumerate(blocks):
        emit_tree(codec, writer, 2, block, (index,), plans)
    return writer.bytes()


def capacity_neutral_vst_scope(codec: Any, blocks: list[Any]) -> tuple[Optional[bytes], dict[str, Any]]:
    """Try one transparent BLOCKINFO/local placement action, fail closed.

    The ordinary writer's final module VST grammar is moved from immediate
    scope to the existing block-14 BLOCKINFO group.  Capacity comes only from
    a provably unused final block-12 grammar; count and all earlier IDs remain
    fixed, and the BLOCKINFO word length must remain byte-exact.  This is the
    natural-run implementation of the scope action validated by the witness.
    """
    trial = copy.deepcopy(blocks)
    modules = [b for b in trial if b.block_id == 8]
    if len(modules) != 1:
        return None, {"feasible": False, "reason": "module_count"}
    module = modules[0]
    infos = [
        x for x in module.items
        if isinstance(x, codec.Block) and x.block_id == codec.BLOCKINFO_BLOCK_ID
    ]
    vsts = [
        x for x in module.items
        if isinstance(x, codec.Block) and x.block_id == 14
    ]
    if len(infos) != 1 or not vsts:
        return None, {"feasible": False, "reason": "missing_blockinfo_or_vst"}
    info = infos[0]
    final_vst = vsts[-1]
    final_defs = [x for x in final_vst.items if isinstance(x, codec.Define)]
    if len(final_defs) != 1:
        return None, {"feasible": False, "reason": "final_vst_local_definition_count"}
    moved = final_defs[0]
    old_inherited = len(final_vst.inherited_abbrevs)
    if moved.assigned_id != codec.FIRST_APPLICATION_ABBREV + old_inherited:
        return None, {"feasible": False, "reason": "nonterminal_local_id"}
    for vst in vsts[:-1]:
        if any(isinstance(x, codec.Define) for x in vst.items):
            return None, {"feasible": False, "reason": "earlier_vst_has_local_definition"}
        if any(
            isinstance(x, codec.Record)
            and x.abbrev_id >= codec.FIRST_APPLICATION_ABBREV + old_inherited
            for x in vst.items
        ):
            return None, {"feasible": False, "reason": "earlier_vst_uses_new_id_range"}

    block12_used = {
        x.abbrev_id
        for block in module.items if isinstance(block, codec.Block) and block.block_id == 12
        for x in block.items if isinstance(x, codec.Record)
    }
    long_last = next((
        x for x in info.items
        if isinstance(x, codec.Define) and x.blockinfo_target == 12
        and x.assigned_id == 21 and x.end_bit - x.start_bit == 79
        and x.assigned_id not in block12_used
    ), None)
    short_unused = next((
        x for x in info.items
        if isinstance(x, codec.Define) and x.blockinfo_target == 12
        and x.end_bit - x.start_bit == 47
        and x.assigned_id not in block12_used
    ), None)
    if long_last is None or short_unused is None:
        return None, {"feasible": False, "reason": "no_capacity_neutral_unused_slot"}

    info.items[info.items.index(long_last)] = codec.Define(
        copy.deepcopy(short_unused.abbrev), long_last.assigned_id, 0, 0, 12
    )
    last_target_index = max(
        i for i, x in enumerate(info.items)
        if isinstance(x, codec.Define) and x.blockinfo_target == 14
    )
    info.items.insert(last_target_index + 1, codec.Define(
        copy.deepcopy(moved.abbrev), moved.assigned_id, 0, 0, 14
    ))
    for vst in vsts:
        vst.inherited_abbrevs = list(vst.inherited_abbrevs) + [copy.deepcopy(moved.abbrev)]
    final_vst.items = [x for x in final_vst.items if not isinstance(x, codec.Define)]

    output = reemit(codec, trial, {})
    reparsed = codec.Parser(output).parse()
    reparsed_module = next(b for b in reparsed if b.block_id == 8)
    reparsed_info = next(
        x for x in reparsed_module.items
        if isinstance(x, codec.Block) and x.block_id == codec.BLOCKINFO_BLOCK_ID
    )
    if reparsed_info.declared_words != info.declared_words:
        return None, {"feasible": False, "reason": "blockinfo_word_length_changed"}
    return output, {
        "feasible": True,
        "action": "capacity_neutral_move_final_vst_local_to_BLOCKINFO",
        "moved_abbrev": abbrev_key(moved.abbrev),
        "moved_id": moved.assigned_id,
        "capacity_replacement_id": long_last.assigned_id,
        "capacity_replacement_bits_before": 79,
        "capacity_replacement_bits_after": 47,
        "moved_definition_bits_in_BLOCKINFO": 34,
        "blockinfo_net_bits_before_alignment": 2,
        "blockinfo_words_before": info.declared_words,
        "blockinfo_words_after": reparsed_info.declared_words,
    }


def unchanged_plan(codec: Any, path: tuple[int, ...], block: Any, mode: str) -> BlockPlan:
    defs = [x.abbrev for x in block.items if isinstance(x, codec.Define)]
    records = [x for x in block.items if isinstance(x, codec.Record)]
    return BlockPlan(
        path=path, block_id=block.block_id, mode=mode, selected=defs,
        assignments=[r.abbrev_id for r in records], code_width=block.code_width,
        body_bits=block.declared_words * 32, definition_count=len(defs),
        original_body_bits=block.declared_words * 32,
        original_local_count=len(defs), universe_keys=[],
        current_keys=[abbrev_key(a) for a in defs],
        selected_keys=[abbrev_key(a) for a in defs], novel_selected_keys=[],
        first_use_order=[abbrev_key(a) for a in defs],
    )


def select_arm_plans(codec: Any, blocks: list[Any], arm: str, universe_cap: int,
                     per_block_defs: int, global_defs: int) -> tuple[dict[tuple[int, ...], BlockPlan], list[dict[str, Any]]]:
    paths = eligible_leaf_paths(codec, blocks)
    diagnostic: list[dict[str, Any]] = []
    frontiers: list[dict[int, BlockPlan]] = []
    direct: dict[tuple[int, ...], BlockPlan] = {}
    for path in paths:
        block = get_block(blocks, path)
        universe, current, mandatory = block_universe(codec, block, universe_cap)
        original = unchanged_plan(codec, path, block, f"{arm}_UNCHANGED_B0")
        if arm == "B1":
            current_unique = {abbrev_key(a): a for a in current}
            ordered_current = [current_unique[k] for k in sorted(current_unique)]
            current_mandatory = {
                abbrev_key(a) for a in ordered_current
                if any(r.blob is not None and abbrev_matches(codec, a, r)
                       for r in block.items if isinstance(r, codec.Record))
            }
            frontier = exact_frontier(
                codec, path, block, ordered_current, current,
                current_mandatory, per_block_defs, "B1_CURRENT_GRAMMAR_ORACLE"
            )
        elif arm == "B2":
            greedy = greedy_plan(
                codec, path, block, universe, current, mandatory, per_block_defs
            )
            frontier = {greedy.definition_count: greedy} if greedy is not None else {}
        elif arm == "WL":
            frontier = exact_frontier(
                codec, path, block, universe, current, mandatory,
                per_block_defs, "WL_SLDP_WIDTH_LADDER"
            )
        else:
            raise ValueError(arm)
        # The executable candidate is fail-safe: B0 remains an available point,
        # but a planned leaf replaces it only when its exact body is smaller.
        best_planned = min(frontier.values(), key=lambda p: (p.body_bits, p.definition_count), default=None)
        if best_planned is None or original.body_bits <= best_planned.body_bits:
            frontier = {original.definition_count: original}
        else:
            # Keep all nondominated sizes plus B0 only if its count is distinct.
            old = frontier.get(original.definition_count)
            if old is None or original.body_bits < old.body_bits:
                frontier[original.definition_count] = original
        diagnostic.append({
            "path": list(path), "block_id": block.block_id,
            "records": sum(isinstance(x, codec.Record) for x in block.items),
            "inherited_definitions": len(block.inherited_abbrevs),
            "current_local_definitions": len(current),
            "universe_definitions": len(universe),
            "mandatory_blob_definitions": len(mandatory),
            "frontier": {str(k): v.body_bits for k, v in sorted(frontier.items())},
        })
        frontiers.append(frontier)

    if arm in ("B1", "WL"):
        direct = choose_global(frontiers, global_defs)
    else:
        # Greedy is bounded identically; if the independently greedy leaves
        # exceed the global budget, keep smallest-benefit leaves at B0.
        choices = [next(iter(frontier.values())) for frontier in frontiers]
        chosen_defs = sum(p.definition_count for p in choices)
        while chosen_defs > global_defs:
            candidates = [
                (p.original_body_bits - p.body_bits, p.path, p)
                for p in choices if p.mode == "B2_GREEDY"
            ]
            if not candidates:
                break
            _, path, plan = min(candidates, key=lambda row: (row[0], row[1]))
            block = get_block(blocks, path)
            choices = [
                unchanged_plan(codec, path, block, "B2_UNCHANGED_B0") if p.path == path else p
                for p in choices
            ]
            chosen_defs = sum(p.definition_count for p in choices)
        direct = {p.path: p for p in choices}
    return direct, diagnostic


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--codec", required=True, type=pathlib.Path)
    ap.add_argument("--input", required=True, type=pathlib.Path)
    ap.add_argument("--output-dir", required=True, type=pathlib.Path)
    ap.add_argument("--universe-cap", type=int, default=10)
    ap.add_argument("--per-block-defs", type=int, default=6)
    ap.add_argument("--global-defs", type=int, default=12)
    args = ap.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)
    codec = load_codec(args.codec.resolve())
    source_data = args.input.read_bytes()
    parser = codec.Parser(source_data)
    blocks = parser.parse()
    frozen_trace = codec.semantic_document(blocks)["canonical_sha256"]

    tracemalloc.start()
    start = time.perf_counter()
    arm_rows: dict[str, Any] = {}
    outputs: dict[str, bytes] = {"B0": source_data}
    scope_output, scope_diagnostic = capacity_neutral_vst_scope(codec, blocks)
    if scope_output is not None:
        scope_trace = codec.semantic_document(codec.Parser(scope_output).parse())["canonical_sha256"]
        if scope_trace != frozen_trace:
            raise RuntimeError("capacity-neutral scope action changed expanded trace")
    for arm in ("B1", "B2", "WL"):
        arm_start = time.perf_counter()
        plans, diagnostic = select_arm_plans(
            codec, blocks, arm, args.universe_cap,
            args.per_block_defs, args.global_defs,
        )
        local_output = reemit(codec, blocks, plans)
        use_scope = scope_output is not None and len(scope_output) < len(local_output)
        output = scope_output if use_scope else local_output
        output_blocks = codec.Parser(output).parse()
        output_trace = codec.semantic_document(output_blocks)["canonical_sha256"]
        if output_trace != frozen_trace:
            raise RuntimeError(f"{arm} expanded trace mismatch")
        outputs[arm] = output
        arm_rows[arm] = {
            "bytes": len(output),
            "sha256": sha256_bytes(output),
            "trace_sha256": output_trace,
            "planning_wall_seconds": time.perf_counter() - arm_start,
            "local_plan_bytes": len(local_output),
            "selected_scope_action": scope_diagnostic if use_scope else None,
            "plans": [plans[path].json() for path in sorted(plans)],
            "diagnostic": diagnostic,
            "selected_definition_count": sum(p.definition_count for p in plans.values()),
            "selected_novel_definition_count": sum(len(p.novel_selected_keys) for p in plans.values()),
        }
    current, peak = tracemalloc.get_traced_memory()
    tracemalloc.stop()

    for arm, data in outputs.items():
        (args.output_dir / f"{arm}.bc").write_bytes(data)
    result = {
        "schema": "llvm-wl-sldp-module-plan-v1",
        "input": str(args.input.resolve()),
        "input_bytes": len(source_data),
        "input_sha256": sha256_bytes(source_data),
        "frozen_trace_sha256": frozen_trace,
        "eligible_leaf_paths": [list(p) for p in eligible_leaf_paths(codec, blocks)],
        "bounds": {
            "universe_cap": args.universe_cap,
            "per_block_definitions": args.per_block_defs,
            "global_definitions": args.global_defs,
        },
        "B0": {
            "bytes": len(source_data), "sha256": sha256_bytes(source_data),
            "trace_sha256": frozen_trace,
        },
        **arm_rows,
        "planner_total_wall_seconds": time.perf_counter() - start,
        "planner_python_tracemalloc_current_bytes": current,
        "planner_python_tracemalloc_peak_bytes": peak,
        "scope_model": {
            "reused_BLOCKINFO": "all parsed inherited definitions remain available and exact",
            "new_immediate_local": "candidate templates emitted before first record in first-use order",
            "new_BLOCKINFO": scope_diagnostic,
        },
        "offset_safety": (
            "only final direct MODULE VALUE_SYMTAB and leaf top-level blocks after MODULE are mutable"
        ),
    }
    result_path = args.output_dir / "plan.json"
    result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "input": str(args.input), "B0": len(outputs["B0"]),
        "B1": len(outputs["B1"]), "B2": len(outputs["B2"]),
        "WL": len(outputs["WL"]), "trace": frozen_trace,
        "result": str(result_path),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
