# CASE-C — executor result

Assignment: `BACKTEST-EXECUTOR-L1-20260814-DIVERGENCE-SEED-FRONTEND-V1-R1`  
Cutoff: `2022-07-08`  
Disposition: **PROPOSE_STAGE0**

## Divergence seed pool (non-evidentiary)

| ID | Engine / rotated perspective | Cautious conclusion if true |
|---|---|---|
| S1 | Abstraction ladder / compiler | A graph IR may need an explicit layout-and-transfer legality contract that survives operator lowering. |
| S2 | Constraint manipulation / portability | The same graph can require different legal layout transitions on targets with different memories and primitives. |
| S3 | Combination / optimization | Operator schedules and graph layout choices may need joint optimization because one boundary conversion can erase a local kernel win. |
| S4 | Reversal / cost | A portable schedule should be rejected when charged conversions or fallback execution outweigh local speedups. |
| S5 | Adjacent possible / verification | A finite small graph could witness semantic equivalence and all inserted conversions for a target pair. |
| S6 | Contradiction / falsification | If the strongest supplied end-to-end stack already carries and globally optimizes the same layout/transfer contract, the residual is absent. |

## Evidence-gated coverage locators

| Locator | Supplied evidence | What it establishes | Seed disposition |
|---|---|---|---|
| L1 | `sources/E01.pdf`, abstract and §1–2 | A heterogeneous ML library combines symbolic and imperative interfaces, execution models, automatic differentiation, and multiple device settings. | Rules out a generic mixed-interface framework claim. |
| L2 | `sources/E02.pdf`, abstract and §1–2 | A stateful dataflow graph maps computations across heterogeneous devices and represents data/control dependencies. | Fixes the graph-level portability comparator. |
| L3 | `sources/E03.pdf`, abstract and §1 | An end-to-end compiler already provides graph- and operator-level optimization, target intrinsics, automated schedule search, fusion, and code generation. | Is the strongest contrary coverage; rules out a generic portable compiler or per-operator tuner. |

## Question Card

| Field | Frozen executor formulation |
|---|---|
| Exact object / natural scenario | A fixed ML dataflow graph being lowered for two heterogeneous backends, with identical tensor results and graph data/control-dependency semantics. |
| Opportunity | The supplied evidence establishes graph optimization and target-specific operator schedule search, but does not directly establish that it jointly carries a graph-wide explicit contract for layout transitions, transfer insertion, and fallback costs through lowering. |
| Atomic action and mechanism | Construct a graph-wide legal layout/transfer plan: annotate boundary representations, insert only semantics-preserving conversions/transfers, and co-optimize them with concrete operator schedules under a charged cost ledger. |
| Information condition / comparator | Input is graph shapes/dtypes/dependencies, target primitives and memory spaces, and allowed layouts. Comparator is the strongest supplied end-to-end graph-and-operator stack under identical graph outputs, targets, and compilation scope. |
| Endpoint and full cost | Semantic equivalence plus compiled execution cost including kernels, layout conversions, copies/transfers, temporary storage, launch/synchronization, compilation/search cost, and fallback execution. |
| Boundary / contrary evidence | Not a new frontend, library wrapper, backend selector, altered numerics, or target swap. The residual disappears if L3’s action already exposes and globally optimizes the same explicit contract. |
| Minimal falsifier | A two-operator graph with incompatible preferred layouts on two target memory spaces for which all legal annotations either alter outputs or match the comparator’s fully charged plan. |
| Finite closure path | `FINITE`: enumerate allowed layouts and conversion edges for the small graph, verify operator and graph equivalence, calculate the ledger, then compare against the same-scope strongest stack. No compile, build, or experiment was performed. |
| Contribution type / dependencies | `N2`; a later independent current-union review and frozen IR/measurement contract are required. |

## Decision and accounting

L3 is treated as substantial contrary evidence, so the proposal is deliberately narrower than “portable compilation.” The retained action constructs and globally charges a concrete legality-preserving layout/transfer plan; it is not an interface wrapper or selector. The same graph and semantics are held fixed, and its direct-comparator failure condition is explicit. L1–L3 account for S1–S6 and leave a finite witness route, supporting only a conditional Stage 0 proposal.
