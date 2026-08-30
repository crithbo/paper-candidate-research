# Discovery log — Source12 bounded SFrame closure

## Assignment and result

`DISCOVERY-S6-20260814-ADAPTIVE-SOURCE12` closes exactly one inherited near-miss:
`SFRAME_PRODUCER_CONSUMER__FIXED_ELF_CODE_UNWIND_QUERY_SEMANTICS__TARGET_SPECIFIC_FRAME_RECORD_CONSTRUCTION`.

Result: **COMPLETE_ZERO_PROPOSALS**. This is a bounded structural rejection of this
exact route, not a claim that SFrame implementation work or unwind performance is
uninteresting. Per contract, this object must not be extended again by this lane.

## Neutral snapshot (frozen 2026-08-14)

* Producer: GNU `as`, AMD64 ELF, CFI input, `--gsframe=yes` and `--gsframe-3`.
* Consumer/checker: upstream `libsframe` decoder/prober, with `readelf --sframe`
  as structural decoder. Query: `(PC -> CFA, FP, RA recovery rule)`.
* Fixed object: identical code bytes, function boundaries, CFI-derived CFA/FP/RA
  rules, AMD64 ABI, relocation/load addresses, and every consumer query result.
  Reordering code, changing CFI semantics, or a custom reader is excluded.

The official assembler manual says `--gsframe` creates `.sframe` from CFI and has
explicit yes/no and V3 paths [S1]. The current V3 spec fixes section/header/FDE/FRE
grammar; its FDE has function start, size, and frame-row start [S2]. It identifies
PC-sorted FDEs as an optional format property; GNU ld typically sets that flag [S2].

## Current producer/consumer union

| Component | Current action/configuration union | Limit |
|---|---|---|
| GNU `as` | CFI-derived rows; `--gsframe=yes/no`; `--gsframe-3`; configure-time default [S1] | No global target-specific planning interface over different semantic CFI histories. |
| GNU `ld` | Merge/link SFrame sections; conventional PC-sorted FDE index [S2] | No documented target-specific optimization objective beyond compliant merge/order. |
| libsframe / readelf | Decode/probe standardized header, FDE index and FRE records [S2,S3] | Consumer, not an optimization producer. |

Reality check: docs expose yes/no/version switches, the spec defines legal reader
grammar, and the upstream support announcement names `as`, `ld`, `readelf`,
`objdump`, `libsframe`, and a small backtracer [S3]. No absence claim rests on a
missing switch.

## Two legal plans and divergence test

For a fixed AMD64 ELF whose CFI state changes once inside a function:

* Plan A: emit the CFI-derived FDE/FRE records; GNU ld places FDE index entries in
  PC order and sets `SFRAME_F_FDE_SORTED`.
* Plan B: retain identical FDE/FRE meanings but permute the FDE index and clear the
  optional sorted flag. The V3 grammar permits unsorted entries; the consumer uses
  the non-binary lookup path.

This is a reader-accepted, same-object two-plan divergence, but only a generic
representation/order difference. It neither changes CFA/FP/RA semantics nor gives a
target-specific state, dependency, or constraint. Any proposed algorithm reduces to
generic serialization ordering or record packing; it cannot be promoted honestly as
a target-specific frame-record N1/N2 contribution.

## Collision, cost, and finite falsifier

The official support series is the closest direct subtractor: it supplies SFrame as
a simpler CFI-derived representation with `as` generation, `ld` merge, `readelf` /
`objdump`, libsframe, and a backtracer [S3]. The V3 spec exposes the same
FDE/FRE/index space [S2]. No primary source found supports a separate
target-specific global frame-record planning problem after subtraction.

Natural closure route: version-pinned CFI-bearing x86-64 GNU/binutils or LLVM
Test-Suite objects. Oracle: decoded `(PC,CFA,FP,RA)` maps plus ELF load/relocation
identity. Full cost: assembler/linker CPU, wall time, RSS, temporary bytes, ELF and
`.sframe` bytes, decoder/query CPU/RSS, and lookup latency.

**72-hour falsifier:** produce a stock-consumer-accepted same-map pair whose
difference is a target-specific, non-generic global frame action and whose algorithm
has an exact/FPT/approximation/Pareto guarantee not reducible to FDE/FRE ordering.
The present finite witness does not satisfy that predicate.

## Sources

* [S1] GNU Binutils, “Using as — Overview”, current docs, 2026-08-14:
  https://sourceware.org/binutils/docs/as/Overview.html
* [S2] GNU Binutils, “The SFrame Format”, current V3 specification, 2026-08-14:
  https://sourceware.org/binutils/docs/sframe-spec.html
* [S3] GNU Binutils, “Definition and support for SFrame unwind format”, 2022:
  https://sourceware.org/pipermail/binutils/2022-September/123165.html
* [S4] GNU Binutils upstream V3 gas documentation/source patch, 2026:
  https://sourceware.org/pipermail/binutils/2026-January/147229.html
