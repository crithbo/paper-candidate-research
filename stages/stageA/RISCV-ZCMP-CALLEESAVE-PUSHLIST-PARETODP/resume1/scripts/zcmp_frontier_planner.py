#!/usr/bin/env python3
"""Bounded exact Zcmp call-interface frontier constructor.

The planner operates before register allocation on a deliberately bounded MIR
class: one scalar GPR call cut in one block, with named virtual registers live
across that call.  It enumerates identity-preserving assignments to the native
ordered Zcmp CSR prefix or to ordinary native stack spills, retains the exact
RV32 Zcmp list/adjust and CFA obligations, and can materialize each action as
pre-RA MIR for the stock LLVM continuation.  It does not patch LLVM or emitted
objects.
"""

from __future__ import annotations

import argparse
import itertools
import json
import re
from dataclasses import asdict, dataclass
from pathlib import Path


CSR_REGS = ("$x8", "$x9", "$x18", "$x19", "$x20", "$x21",
            "$x22", "$x23", "$x24", "$x25", "$x26", "$x27")


@dataclass(frozen=True)
class Plan:
    assignment: tuple[tuple[str, str], ...]
    csr_count: int
    rlist: str
    frame_bytes: int
    spill_values: tuple[str, ...]
    static_spill_bytes: int
    dynamic_spill_ops: int
    cfi: tuple[str, ...]

    @property
    def cost(self) -> tuple[int, int, int]:
        return (self.static_spill_bytes, self.frame_bytes,
                self.dynamic_spill_ops)


def _sort_vreg(v: str) -> tuple[int, str]:
    m = re.fullmatch(r"%(\d+)", v)
    return (int(m.group(1)) if m else 1 << 30, v)


def _align16(n: int) -> int:
    return (n + 15) & ~15


def _rlist(k: int) -> str:
    if k == 0:
        return "{ra}"
    if k == 1:
        return "{ra,s0}"
    if k == 12:
        return "{ra,s0-s11}"
    return f"{{ra,s0-s{k - 1}}}"


def _make_plan(items: tuple[str, ...], locs: tuple[str, ...]) -> Plan:
    used = [loc for loc in locs if loc != "spill"]
    used_indices = sorted(CSR_REGS.index(loc) for loc in used)
    if used_indices != list(range(len(used_indices))):
        raise ValueError("non-prefix CSR assignment")
    k = len(used_indices)
    spills = tuple(v for v, loc in zip(items, locs) if loc == "spill")
    base = _align16((k + 1) * 4)  # ra plus the fixed CSR prefix.
    required = base + 4 * len(spills)
    legal = tuple(base + 16 * i for i in range(4))
    frame = next((x for x in legal if x >= required), None)
    if frame is None:
        raise ValueError("spill slots exceed the one-instruction stack-adjust class")
    cfi = [f"CFA=sp+{frame}", f"ra@-{4 * (k + 1)}"]
    cfi.extend(f"s{i}@-{4 * (k - i)}" for i in range(k))
    return Plan(
        assignment=tuple(zip(items, locs)),
        csr_count=k,
        rlist=_rlist(k),
        frame_bytes=frame,
        spill_values=spills,
        static_spill_bytes=8 * len(spills),
        dynamic_spill_ops=2 * len(spills),
        cfi=tuple(cfi),
    )


def enumerate_dp(items: tuple[str, ...]) -> list[Plan]:
    """Identity-preserving DP over the finite native action grammar."""
    states: set[tuple[str, ...]] = {()}
    for _item in items:
        nxt: set[tuple[str, ...]] = set()
        for partial in states:
            used = set(partial) - {"spill"}
            nxt.add(partial + ("spill",))
            for reg in CSR_REGS[: len(items)]:
                if reg not in used:
                    nxt.add(partial + (reg,))
        states = nxt
    plans: list[Plan] = []
    for locs in states:
        used_indices = sorted(CSR_REGS.index(x) for x in locs if x != "spill")
        if used_indices != list(range(len(used_indices))):
            continue
        try:
            plans.append(_make_plan(items, locs))
        except ValueError:
            continue
    return sorted(plans, key=lambda p: (p.cost, p.assignment))


def enumerate_oracle(items: tuple[str, ...]) -> list[Plan]:
    """Independent Cartesian tiny oracle used only for equivalence tests."""
    choices = ("spill",) + CSR_REGS[: len(items)]
    plans: list[Plan] = []
    for locs in itertools.product(choices, repeat=len(items)):
        regs = [x for x in locs if x != "spill"]
        if len(regs) != len(set(regs)):
            continue
        used_indices = sorted(CSR_REGS.index(x) for x in regs)
        if used_indices != list(range(len(used_indices))):
            continue
        try:
            plans.append(_make_plan(items, locs))
        except ValueError:
            continue
    return sorted(plans, key=lambda p: (p.cost, p.assignment))


def pareto(plans: list[Plan]) -> list[Plan]:
    out: list[Plan] = []
    for p in plans:
        dominated = any(
            all(a <= b for a, b in zip(q.cost, p.cost))
            and any(a < b for a, b in zip(q.cost, p.cost))
            for q in plans
        )
        if not dominated:
            out.append(p)
    return out


def discover_one_call_interface(text: str) -> tuple[str, ...]:
    body_match = re.search(r"(?ms)^body:\s*\|\s*\n(.*?)^\.\.\.\s*$", text)
    if not body_match:
        raise ValueError("MIR body not found")
    lines = body_match.group(1).splitlines()
    calls = [i for i, line in enumerate(lines) if "PseudoCALL" in line]
    if len(calls) != 1:
        raise ValueError(f"bounded class requires exactly one PseudoCALL, got {len(calls)}")
    call_i = calls[0]
    defs: set[str] = set()
    for line in lines[:call_i]:
        m = re.match(r"\s*(%[A-Za-z0-9_.]+)(?::[A-Za-z0-9_]+)?\s*=", line)
        if m:
            defs.add(m.group(1))
    uses_after: set[str] = set()
    for line in lines[call_i + 1:]:
        uses_after.update(re.findall(r"%[A-Za-z0-9_.]+", line))
    items = tuple(sorted(defs & uses_after, key=_sort_vreg))
    if not items:
        raise ValueError("no scalar virtual register is live across the call")
    return items


def materialize(text: str, plan: Plan) -> str:
    """Materialize one native action in pre-RA MIR; LLVM handles continuation."""
    mapping = dict(plan.assignment)
    max_id = max((int(x) for x in re.findall(r"\bid:\s*(\d+)", text)), default=-1)
    spill_new: dict[str, str] = {}
    for value in plan.spill_values:
        max_id += 1
        spill_new[value] = f"%{max_id}"

    # Preserve physical live-ins while removing dead virtual live-in aliases.
    for value, loc in mapping.items():
        if loc != "spill":
            text = text.replace(f"virtual-reg: '{value}'", "virtual-reg: ''")

    body_match = re.search(r"(?ms)^body:\s*\|\s*\n(.*?)^\.\.\.\s*$", text)
    if not body_match:
        raise ValueError("MIR body not found")
    body_lines = body_match.group(1).splitlines()
    call_i = next(i for i, line in enumerate(body_lines) if "PseudoCALL" in line)
    down_i = max(i for i, line in enumerate(body_lines[:call_i + 1])
                 if "ADJCALLSTACKDOWN" in line)
    up_i = next(i for i, line in enumerate(body_lines[call_i:], start=call_i)
                if "ADJCALLSTACKUP" in line)

    for value, loc in mapping.items():
        if loc == "spill":
            continue
        pat = re.compile(re.escape(value) + r"(?::[A-Za-z0-9_]+)?")
        body_lines = [pat.sub(loc, line) for line in body_lines]

    stack_entries: list[str] = []
    stores: list[str] = []
    loads: list[str] = []
    for stack_id, value in enumerate(plan.spill_values):
        new = spill_new[value]
        stack_entries.append(f"  - {{ id: {stack_id}, size: 4, alignment: 4 }}")
        stores.append(f"    SW {value}, %stack.{stack_id}, 0 :: (store (s32) into %stack.{stack_id})")
        loads.append(f"    {new}:gpr = LW %stack.{stack_id}, 0 :: (load (s32) from %stack.{stack_id})")

    if stores:
        body_lines[down_i:down_i] = stores
        # Insertion before DOWN shifts call and UP by len(stores).
        up_i += len(stores)
        body_lines[up_i + 1:up_i + 1] = loads
        replace_from = up_i + 1 + len(loads)
        for value, new in spill_new.items():
            pat = re.compile(re.escape(value) + r"(?::[A-Za-z0-9_]+)?")
            for i in range(replace_from, len(body_lines)):
                body_lines[i] = pat.sub(new, body_lines[i])

    new_body = "\n".join(body_lines) + "\n"
    text = text[:body_match.start(1)] + new_body + text[body_match.end(1):]

    if spill_new:
        additions = "".join(
            f"  - {{ id: {new[1:]}, class: gpr, preferred-register: '', flags: [  ] }}\n"
            for new in spill_new.values()
        )
        text = text.replace("liveins:\n", additions + "liveins:\n", 1)
        if "stack:           []" in text:
            text = text.replace("stack:           []", "stack:\n" + "\n".join(stack_entries), 1)
        elif "stack: []" in text:
            text = text.replace("stack: []", "stack:\n" + "\n".join(stack_entries), 1)
        else:
            raise ValueError("non-empty pre-existing stack is outside the bounded materializer")
    return text


def cmd_selftest(args: argparse.Namespace) -> None:
    rows = []
    for w in range(args.max_w + 1):
        items = tuple(f"%{i}" for i in range(w))
        dp = enumerate_dp(items)
        oracle = enumerate_oracle(items)
        dp_key = [(p.assignment, p.cost, p.cfi) for p in dp]
        oracle_key = [(p.assignment, p.cost, p.cfi) for p in oracle]
        if dp_key != oracle_key:
            raise AssertionError(f"DP/oracle mismatch at w={w}")
        rows.append({
            "w": w,
            "legal_plans": len(dp),
            "pareto_plans": len(pareto(dp)),
            "exact_match": True,
        })
    payload = {"schema": "zcmp-tiny-oracle-v1", "rows": rows, "pass": True}
    Path(args.out).write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


def cmd_enumerate(args: argparse.Namespace) -> None:
    src = Path(args.input)
    out = Path(args.out_dir)
    out.mkdir(parents=True, exist_ok=True)
    text = src.read_text(encoding="utf-8")
    items = discover_one_call_interface(text)
    if len(items) > args.max_w:
        raise ValueError(f"interface width {len(items)} exceeds frozen bound {args.max_w}")
    plans = enumerate_dp(items)
    frontier = set(p.assignment for p in pareto(plans))
    records = []
    for index, plan in enumerate(plans):
        name = f"plan_{index:04d}.mir"
        (out / name).write_text(materialize(text, plan), encoding="utf-8")
        record = asdict(plan)
        record["mir"] = name
        record["abstract_pareto"] = plan.assignment in frontier
        records.append(record)
    payload = {
        "schema": "zcmp-frontier-plans-v1",
        "input": str(src),
        "interface_values": items,
        "interface_width": len(items),
        "legal_plan_count": len(records),
        "abstract_pareto_count": sum(1 for x in records if x["abstract_pareto"]),
        "plans": records,
    }
    (out / "plans.json").write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    sub = parser.add_subparsers(dest="command", required=True)
    p_test = sub.add_parser("selftest")
    p_test.add_argument("--max-w", type=int, default=4)
    p_test.add_argument("--out", required=True)
    p_test.set_defaults(func=cmd_selftest)
    p_enum = sub.add_parser("enumerate")
    p_enum.add_argument("--input", required=True)
    p_enum.add_argument("--out-dir", required=True)
    p_enum.add_argument("--max-w", type=int, default=4)
    p_enum.set_defaults(func=cmd_enumerate)
    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main()
