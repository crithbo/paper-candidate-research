# Source30 Divergence Seed Pool

- Assignment: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE30-RQ-PRODUCTION-V1`, S6.
- Generated offline before evidence lookup: `YES`; security-scope check: `PASS`.

| Engine | Seed IDs | Perspective |
|---|---|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | S30-01, S30-07 | compiler/backend engineer |
| `PROBLEM_REFRAMING` | S30-02 | hardware architect |
| `CONSTRAINT_MANIPULATION` | S30-03 | operator |
| `NEGATION_OR_INVERSION` | S30-04 | theorist |
| `ABSTRACTION_LADDER` | S30-05 | compiler/backend engineer |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | S30-06 | maintainer |
| `JANUSIAN_TENSION` | S30-08 | measurement reviewer |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | S30-09 | end user |

### Seeds

- `S30-01` — ARM MVE tail-predication treats lane-mask conversion and low-overhead-loop lowering as two local phases. A fixed multiblock loop might admit a target-specific region construction that keeps MVE VPT/LOB state legal. If successful, the narrow result is an ABI-neutral MVE legality/cost frontier, not a generic scheduler. `KEEP_FOR_CONVERGENCE`.
- `S30-02` — AArch64 MOPS expansion may couple memory-operation shape and alignment/fault constraints. A native plan could be formal only if the ISA leaves alternatives beyond ordinary instruction selection. `KEEP_FOR_CONVERGENCE`.
- `S30-03` — A fixed accelerator kernel can make native cooperative-matrix layout plus fragment lifetime a finite state object. Risk: active SPIR-V/GPU overlap and generic layout search. `KEEP_FOR_CONVERGENCE`.
- `S30-04` — Reversing LoongArch address-materialization choices may expose a code-size/relocation legality region. Risk: reviewed linker/layout identity. `KEEP_FOR_CONVERGENCE`.
- `S30-05` — AArch64 SVE predicate state may couple tuple spill and call boundaries. Risk: Source29 SME-adjacent identity and ordinary RA. `KEEP_FOR_CONVERGENCE`.
- `S30-06` — RISC-V RVV segmented memory legality could couple LMUL and spill forms. Risk: Source29 RVV configuration absorption. `ACTIVE_OR_STOP_IDENTITY`.
- `S30-07` — A target NPU command stream could jointly construct DMA/fence state under a fixed model. Risk: generic schedule and paper-owned constructor. `KEEP_FOR_CONVERGENCE`.
- `S30-08` — The tension between MVE VPT legality and multiblock loop CFG may yield a finite refusal characterization with a constructive fallback. `VARIANT` of S30-01.
- `S30-09` — WebAssembly multivalue local placement is a possible whole-function constructor. Risk: historic Wasm identity. `ACTIVE_OR_STOP_IDENTITY`.

## Pre-evidence clustering

| Cluster | Seeds | Representative / disposition |
|---|---|---|
| MVE low-overhead loops | S30-01, S30-08 | S30-01 selected |
| ISA lowering | S30-02, S30-04, S30-05 | S30-02, S30-04 selected as controls |
| Accelerator state | S30-03, S30-07 | S30-03 selected as locator only |
| Cooling/repeated | S30-06, S30-09 | excluded before locator |

No outcome-aware backfill: selected locators were fixed before evidence lookup. Eight engines and seven perspectives were used; coverage advisory `PASS`.
