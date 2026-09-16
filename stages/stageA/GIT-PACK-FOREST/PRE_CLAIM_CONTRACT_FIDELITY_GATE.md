# PRE_CLAIM_CONTRACT_FIDELITY_GATE

- Assignment: `STAGEA-L3-20260809-GIT-PACK-FOREST-INITIAL`
- Gate state before the final claim-bearing pilot: `PASS_NATIVE_GIT_CODEC_AND_FULL_COST`
- Claim-bearing observations before gate PASS: `NONE`

## Atomic-action mapping

| Frozen atomic action | Concrete implementation | Fail-closed check |
|---|---|---|
| Enumerate useful same-type natural-object delta actions | `scripts/run_pilot.py::build_candidate_graph` | Actual Git 2.55 delta byte cost must beat the full-object representation; cap 64 objects / 6 incoming actions. |
| Select one global bounded-depth forest over the complete manifest (unselected objects are explicit roots) | `scripts/run_pilot.py::joint_constructor` | Base must precede child; depth must be at most 8; root fallback is explicit. |
| Couple forest choice to a locality-aware legal write order | `scripts/run_pilot.py::joint_constructor` | Parent costs depend on current positions and the next legal order depends on selected parent/child unlocks; iterate to fixed point or eight iterations. |
| Emit the frozen self-contained Git representation | `scripts/git_pack_lib.py::custom_pack_bytes` | Pack v2, SHA-1, REF_DELTA, no thin/filter/external base, zlib level 6. |
| Preserve Git 2.55 native delta semantics | `scripts/git_pack_lib.py::make_git_2_55_delta` | Official `diff-delta.c` tables are hash locked and natural Git-pack deltas must match byte for byte. |
| Verify exact object identity and accessibility | `scripts/run_pilot.py::validate_pack` | `index-pack --verify --strict`, `fsck --strict`, every canonical type/size/SHA-256, fixed cold/warm object sample. |

## Comparator semantics

The union is a set of individually realizable Git 2.55 configurations, never a fictional simultaneous configuration. Every Git method receives the identical frozen commit closure, pack v2/SHA-1, non-thin/unfiltered/self-contained output, and zlib level 6. The deterministic full-object/prior constructor and classical Edmonds maximum-weight branching plus depth repair use the same native delta writer and legal base-before-child family order. The five-node exact enumeration is a ceiling only. PPC/JSS, MinHash and generic clustered-delta-graph results remain subtractors when they change the Git contract.

## Denominator and full cost

Residual coverage uses exactly `candidate selected useful delta edges` as numerator/denominator support; conservative union coverage can only reduce the claimed residual. Pack-size comparisons use pack plus index bytes for the identical manifest. Construction wall/CPU, peak RSS, graph/precompute/optimization, strict verification, fixed cold/warm random-object access, reconstruction span, immutable failure attempts and workspace bytes are collected separately and never omitted from a Pareto claim.

## Native codec preflight

- Official Git source tag: `v2.55.0`, commit `e9019fcafe0040228b8631c30f97ae1adb61bcdc`.
- `diff-delta.c` SHA-256: `A7318C006CDED6394DAB8DA932C4BFCAACB8CD44BAEF61F96B790199E8768F9A`.
- Parity artifact: `results/GIT_DELTA_CODEC_PARITY.json`.
- Required result: byte-exact equality on natural delta edges emitted by Git 2.55.
- Observed result: `38/38` byte-exact natural edges across 19 repositories; gate parity PASS.

## Retained non-claim control

`results/initial/` and `work/runs/` use the earlier Git-format-compatible but non-native delta program. They are frozen as `CODEC_OR_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING` and cannot support PASS or STOP.

## Small witness

`results/PRECLAIM_WITNESS_NATIVE_CODEC.json` proves one natural reachable edge has native byte-exact delta and zlib parity, base-before-child legality, depth 1 within the bound of 8, the frozen residual denominator, pack/index construction, `115/115` full canonical equality, strict index/fsck success, and fixed cold/warm access measurement. Its final pack/index hashes are recorded in that artifact.

## Full-cost instrumentation re-audit

The first `native-initial` and `native-replay` runs correctly captured Git child-process PeakWorkingSet, but their Python construction field was a `tracemalloc` allocation peak rather than OS peak RSS. Under the updated gate they are retained as `FULL_COST_INSTRUMENTATION_CONTROL__NON_CLAIM_BEARING`. No PASS or STOP is accepted from those runs. The repaired implementation uses Windows `GetProcessMemoryInfo(...).PeakWorkingSetSize` for the Python driver and keeps `tracemalloc` as a separately named diagnostic. The gate returns to PASS only after a new preflight records a nonzero driver RSS.

The subsequent `claim-initial` and `claim-replay` runs captured OS RSS but formal method construction time omitted the custom pack's `index-pack` creation step even though index bytes were present. They are retained as `INDEX_CONSTRUCTION_COST_CONTROL__NON_CLAIM_BEARING`. The repaired `custom_pack_method` now adds index construction wall time and child CPU to end-to-end construction, takes the maximum of driver/index PeakWorkingSet, and exposes the index subcost separately. The final small witness independently records this exact index step.

A toolchain audit then found that those `final-*` runs used Python zlib 1.3.1 while the frozen Git 2.55 build uses zlib 1.3.2. The codec and level were identical, but compressor-version output can affect delta cost and therefore action selection. The `final-*` runs are retained as `COMPRESSOR_VERSION_CONTROL__NON_CLAIM_BEARING`. The repaired writer and cost model call the exact `zlib1.dll` shipped with frozen MinGit. Only `codec-final-initial` and `codec-final-replay` may carry scientific inference after byte-exact native zlib parity passes.

## Gate decision

`PASS_NATIVE_GIT_CODEC_AND_FULL_COST`. RSS and index-cost preflights remain passed. `results/GIT_NATIVE_CODEC_PARITY.json` proves `38/38` byte-exact Git 2.55 `diff-delta` streams and `38/38` byte-exact frozen Git zlib 1.3.2 level-6 streams on natural edges; `results/PRECLAIM_WITNESS_NATIVE_CODEC.json` covers the final writer on the complete 115-object witness. The zlib DLL SHA-256 is `93E9243A44C29200EEACAF9658EFE2558581770E4B11CA4B500E18E424A6E3B5`. Claim-bearing execution is authorized only in `work/codec-final-initial/` and `work/codec-final-replay/`; every earlier output remains non-claim-bearing control.
