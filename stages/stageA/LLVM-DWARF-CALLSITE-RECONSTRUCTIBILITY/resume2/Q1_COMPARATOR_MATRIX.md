# Q1 comparator matrix

## Frozen comparison identity

- LLVM commit: `e72ba6cf366a3180cbf5a8690d9e50665880ab76`
- Target/mode: `x86_64-unknown-linux-gnu` SysV, `-O2 -g`, instruction references and LiveDebugValues.
- Same object: identical optimized LLVM MachineIR/ABI/executable behavior; the candidate may only retain an argument value across a bounded debug-critical call cut through a legal target-specific allocation-time register/CSR/CFI plan.
- Guarantee: exact Pareto frontier only for the frozen bounded call-cut class.
- Natural denominator: all 30 result-blind selected call sites from the frozen LLVM compiler-rt builtins set; failures remain in the denominator.

## Comparator coverage

| Arm | Native / same-object | Frozen action coverage | Result | Interpretation |
|---|---:|---:|---:|---|
| Current LLVM default and the complete frozen current-union grid | Yes | 3,072 legal configurations over the registered current controls | 3,072/3,072 succeeded, 14 unique objects, 0 reconstructible arms on the frozen witness | Hash-verified resume1 result, reused read-only; not rerun in resume2. |
| Frozen candidate bounded call-cut planner | Yes | Allocation-time value retention plus legal native CSR/CFI plan | 1/30 accepted gain; p50=0 and p90=0 | One real positive does not form the pre-registered nontrivial natural boundary. |
| Executable paired subset | Yes | Same candidate and baseline on mapper-applicable sites | 1/18 gain; 17/18 zero gain | Even after exposing the executable subset, p50=0 and p90=0. |
| Small witness / exact bounded ceiling | Yes | Legality, equivalence and exact bounded-plan witness only | PASS upstream | Supports contract fidelity, not a natural-corpus PASS by itself. |
| Byte-identical alloc-section control | No, over-constrained relative to the legal atomic action | Forbids the instruction/relocation change the action is meant to make | Invalidated non-evidence | Retained only to document why byte identity is not the behavior comparator. |

## Full-cost parity

All executable natural pairs use the same frozen input, exact LLVM writer and native DWARF/unwind readers. The ledger includes planner time, writer CPU/wall/RSS, reader CPU/wall/RSS, object/text/debug/relocation/`.eh_frame` bytes and the executed behavior replay for the sole positive. The replay wall time under Blinkenlights is labeled control-only; native cycles remain unobserved and are not imputed.

## Owner Q1/Q2 assessment

The exact native action is not directly absorbed by the 3,072-arm current union, and one legal natural positive exists. However, the frozen killer requires a nontrivial natural boundary. Only 1/30 denominator sites (1/18 executable pairs) improves and both paired p50 and p90 reconstructibility gains are zero. The owner therefore assesses `BELOW_Q2_STOP`; this is a bounded Stage A recommendation awaiting an independent Stage A gate, not a final project disposition.
