# CRFEPOCH-HBMPIM-LLM-GEMV-REV0 — independent current-collision ledger

Review date: 2026-08-24  
Scope: the frozen `PIMSimulator dev` HBM2-PIM GEMV command/CRF/PC/mode protocol on the public UniNDP Llama2 shape carrier. This ledger does not treat the Discovery conclusion as evidence.

## Primary current sources inspected

| Source | Current locator | What it establishes | Coverage class |
|---|---|---|---|
| PIMSimulator | `SAITPublic/PIMSimulator`, `dev`, `src/tests/PIMKernel.cpp` lines 113–139, 205–223, 338–411; <https://github.com/SAITPublic/PIMSimulator> | `executeGemv()` enters HAB, calls `programCrf`, switches to HAB_PIM (documented PC reset), emits GEMV transactions, returns to HAB/SB and parks out. `programCrf()` writes at most four 8-command bursts. | Exact deployment baseline |
| PIMSimulator command generator | `src/tests/PIMCmdGen.h` lines 99–149; <https://github.com/SAITPublic/PIMSimulator/blob/dev/src/tests/PIMCmdGen.h> | Non-tree GEMV emits MAC, JUMP, MAC, JUMP, NOP, EXIT: six CRF commands irrespective of tensor size; dimension-dependent values are jump operands. | Current same-object action audit |
| UniNDP | pinned public commit `c8b21684358441d29fc81fa0866d07cec20582ed`; local frozen source tree | Supplies `hbm-pim` backend, Llama2 7B/13B workload CSVs and instruction/DRAM/row-change accounting. Full frozen-tree search found no `CRF`, `programCrf`, or `HAB_PIM` token. | Direct subtractor, not same protocol |
| UniNDP end-to-end aggregation | `script/combine_e2e.py` lines 10–48 | It explicitly assumes no operator fusion and sums per-operator latency, repeating non-final Llama2 operators 32 times for 7B and 40 times for 13B. | Natural-carrier and baseline boundary |
| DCC | ISCA 2026 repository, `src/hbmpim_trace_gen/gen_trace_HBMPIM_GEMV.py`; <https://github.com/SPIN-Research-Group/DCC/blob/main/src/hbmpim_trace_gen/gen_trace_HBMPIM_GEMV.py> | Generates HBM3-PIM traces with `PIM_ACC_RESET`, loads, MACs, write-backs and barriers. Current inspected generator has no `CRF`, `PROGRAM`, or `PIM_MODE` action. | Strong methodological/direct subtractor, not same protocol |
| PIMCOMP | Sun et al., IEEE TCAD 44(5), 1745–1759 (2025), DOI `10.1109/TCAD.2024.3496847`; <https://arxiv.org/abs/2411.09159> | End-to-end PIM compiler with pseudo-instruction, mapping and dataflow scheduling abstractions. | Methodological adjacent |

## Eight-predicate direct-coverage audit

| Predicate | PIMSimulator stock | UniNDP | DCC | Result |
|---|---|---|---|---|
| Same object/function/protocol | Same stock protocol, but no epoch action | HBM-PIM abstraction, not stock CRF/PC/mode | HBM3-PIM trace model, not stock HBM2 protocol | No prior covers candidate action |
| Same scenario/carrier | Baseline GEMV, not Llama graph scheduling | Public Llama2 shape carrier | ML/LLM PIM kernels, different carrier/configuration | Partial only |
| Same or weaker information | N/A baseline | Static mapping/scheduling information | Static code/data-layout information | Partial only |
| Atomic CRF-resident epoch action | Absent | Absent in pinned source | Absent in inspected current GEMV generator | Not covered |
| Same legality/quality guarantee | Stock semantics only | Different ISA/status model | Different HBM3 trace semantics | Not covered |
| Same full-cost boundary | Includes stock transactions but no comparison | Commands/DRAM/row-change accounting | Trace/data-rearrangement cost | Partial only |
| Comparable platform/version/config | Exact baseline | Related HBM-PIM, different contract | HBM3-PIM/AttAcc route | Not comparable enough |
| Sufficient source depth | Yes for named stock path | Yes for pinned source/token audit | Sufficient for named current generator, not a claim about uninspected files | No direct fatal |

## Independent collision disposition

- `DIRECT_FATAL`: **not established**. DCC and UniNDP do not satisfy the same protocol/action/guarantee predicates.
- `DIRECT_SUBTRACT`: UniNDP’s mapping/scheduling/search and DCC’s code/data co-optimization substantially narrow any broad PIM compiler claim.
- `DEPLOYMENT_BASELINE`: stock `PIMKernel::executeGemv()`.
- `METHODOLOGICAL_ADJACENT`: PIMCOMP and DCC’s HBM3-specific trace generator.
- `SEARCH_BOUNDED_OPEN`: closed for the named current source loci; no source-based absence claim is made beyond them.

## Decisive independent finding

The candidate’s asserted 32-entry CRF constraint is inactive for the frozen non-tree GEMV mechanism: the generated program is six commands. Retaining that fixed program and keeping HAB active across an already-adjacent equal-template run only hoists a stock prologue/epilogue. UniNDP’s Llama aggregation establishes repeated operators but deliberately treats them as independent latency summands; it does not supply a dependency-aware new scheduling problem. Turning the idea into a cache, reordering, or graph-wide scheduling problem would change the frozen atomic action and/or information contract. Therefore the residual is not a nontrivial N2 paper kernel even though it is not directly absorbed by DCC or UniNDP.
