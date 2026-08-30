# Pre-claim contract fidelity gate

- Assignment: `STAGEA-L3-20260811-LLVM-BITCODE-ABBREV-PLANNER-RESUME1-V8.7`
- Gate status: **PASS**
- Gate closed before natural claim-bearing execution: **yes**
- Pass time boundary: after the smoke-arm verification artifact and before any
  natural corpus archive/source acquisition.
- Scientific revision consumed: **no**

## 1. Frozen atomic-action mapping — PASS

`ATOMIC_ACTION_MAP.md` maps every WL-SLDP decision to ordinary raw LLVM
bitstream actions.  The implementation emits native `DEFINE_ABBREV`, reuses or
capacity-neutrally changes BLOCKINFO scope, selects a legal definition order,
assigns unchanged records to native application IDs or ID 3 fallback, and
computes the block-fixed `CodeLen` step.  `VSTOFFSET`/`FNENTRY` values are never
patched.  The mutable natural domain is fail-closed to offset-safe suffix
leaves.

The native scope witness moved a live FNENTRY grammar from immediate VST scope
to the existing block-14 BLOCKINFO group, retained ID 8, preserved BLOCKINFO at
34 words, and saved 8 bytes.  It passed the unmodified native tools, expanded
trace equality, and canonical decoded-IR equality.  This is a legality witness,
not natural evidence.

## 2. Native codec/reader/format parity — PASS

- Writer/reader/toolchain: LLVM 22.1.8 at exact commit
  `ca7933e47d3a3451d81e72ac174dcb5aa28b59d1`.
- Current-source absence audit only: LLVM main
  `a1194be1baefa99d20a09bd04b16056be0ab7225`.
- Input/output format: one ordinary raw `BC C0 DE` LLVM bitcode file.
- Smoke arms B0/B1/B2/WL: respectively 1736/1728/1728/1728 bytes.
- Every arm passed the frozen trace parser, `llvm-bcanalyzer`, `llvm-dis`,
  `opt -passes=verify`, normalized decoded-IR equality, and three measured
  native read processes.  Evidence: `results/planner_smoke/verification.json`.

The paused failed-offset rewrite remains
`CODEC_OR_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING`; it supports neither PASS
nor STOP.

## 3. Comparator semantic parity — PASS

- B0 is the executable pinned native writer output.
- B1 is an exact current-grammar subset/scope/assignment oracle, including the
  current-grammar capacity-neutral scope move.
- B2 starts from the required Blob grammars and greedily adds actions from the
  same bounded universe, uses the same exact net-bit evaluator, scope action,
  definition limits, trace, and verifier.
- WL-SLDP enumerates each bounded leaf's width-ladder frontier and performs a
  global definition-budget dynamic-program convolution.
- B3 is a separate tiny exhaustive ceiling only.  It enumerated 206
  subset/order cases and all record assignments; its 160-bit optimum equals
  WL-SLDP's 160-bit result.  It is not a natural or scalable baseline.
- BCDB/external compression remains a negative control/subtractor and is not a
  raw-native comparator.

## 4. Common denominator and full cost — PASS

All executable arms use whole-file raw bytes including definitions, BLOCKINFO,
block headers/lengths, record IDs and payloads, Blob padding, END codes, and
alignment.  `verify_native_arms.py` applies one reader/checker/canonicalization
path to all arms and records wall time, child CPU time, peak working set, first
fresh-process read, repeated warm-process reads, failures, and fallbacks.
Planner wall time and Python allocation peak are recorded by each `plan.json`;
the bounded corpus driver will additionally measure the planner process RSS/CPU.
No byte ratio omits the definition or file denominator.

## 5. Small legality/equivalence witnesses — PASS

1. `results/witness/ID_WIDTH_STEP_WITNESS.json`: four definitions end at ID 7
   with CodeLen 3; five end at ID 8 with CodeLen 4.  Both ordinary native files
   pass native parse/disassemble/verify, preserve the expanded trace, and decode
   to identical canonical IR.
2. `results/scope_witness/NATIVE_SCOPE_WITNESS.json`: live immediate-to-
   BLOCKINFO scope change with stable absolute offsets and native acceptance.
3. `results/witness/TINY_EXACT_CEILING.json`: independent B3 exact-cost match.

## Gate boundary

The gate establishes format/contract fidelity only.  It does not establish a
natural benefit, algorithmic residual, paper contribution, or Stage A PASS.
Only runs made after this recorded PASS may bear the bounded Stage A scientific
conclusion.
