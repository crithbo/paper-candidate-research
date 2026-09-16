# Claim Matrix

| ID | Proposed/static statement | Evidence status | Allowed claim ceiling | Disposition |
|---|---|---|---|---|
| C1 | Frozen LLVM's local VXRM pass uses 0–3/Unknown state and forward/backward placement. | Official pinned source | Static source fact | CONFIRMED |
| C2 | Current pass invalidates VXRM state at calls, inline asm and direct modifiers. | Official pinned source and `vxrm-insert.ll::test3` | Static source/test fact | CONFIRMED |
| C3 | psABI non-preservation does not force an internal callee to clobber actual VXRM state. | ABI semantics + ISA action semantics | Narrow legal inference; never an external ABI promise | CONFIRMED_BOUNDARY |
| C4 | The frozen RNE→internal-RNE→RNE carrier admits Plan L with three writes and Plan S with one write. | Complete static IR/action trace; in-tree anchors | Native-legality proposition pending future replay | CONFIRMED_STATIC_ONLY |
| C5 | Plan S is not emitted by the current call-Unknown mechanism while preserving the frozen call. | Pinned pass logic | Current-action divergence only | CONFIRMED_STATIC_ONLY |
| C6 | Plan S is a complete full-cost Pareto point. | Two action coordinates improve; compile CPU/RSS/composition cost unknown | Hypothesis only | NOT_ESTABLISHED |
| C7 | Five-state interprocedural composition yields an RVV-specific N2 algorithm. | Recurrence erases target labels and remains generic min-plus dataflow | No positive claim allowed | REFUTED_FOR_Q2 |
| C8 | A bounded quotient preserves all LLVM future native actions and full cost. | VXRM-only state insufficient; exact product becomes identity-like | No positive claim allowed | NOT_CLOSED |
| C9 | Natural RVV workloads benefit. | No implementation/experiment, as required by E1 | No empirical claim | OPEN_NOT_FATAL_BY_ITSELF |
| C10 | No direct latest collision exists. | Bounded search only | `SEARCH_BOUNDED_OPEN`; no absence assertion | OPEN |

## Gate mapping

| Mandatory closure | Result | Decisive reason |
|---|---|---|
| Pinned same-object witness/action catalogue | PASS | Exact IR/action trace and current tests/source anchor it. |
| Two complete native-legal plans | PASS_STATIC | Physical VXRM state and internal direct-call semantics support both; replay remains Stage A work. |
| Four-state plus UNKNOWN transfer | PASS | Complete table is finite and ABI-bounded. |
| Current-union-external full-cost Pareto point | FAIL | Action delta is clear, complete compile/composition full cost is not certified. |
| Future-action/legality/full-cost preserving quotient | FAIL | Either generic `(PC,VXRM)` product or identity-like full LLVM state. |
| Target-specific exact/FPT/certified recurrence | FAIL | Exact recurrence is generic weighted transducer/min-plus dataflow. |
| Non-generic N2 | FAIL | Removing RVV names leaves the same algorithm and guarantee. |
| Finite Stage A killer | PASS_AS_PLAN_ONLY | Finite but cannot cure the structural N2 failure. |

## Final claim ceiling

The packet may state that a narrow LLVM VXRM call-boundary action gap and a two-plan static witness exist. It may not state a Tier-B algorithmic contribution, complete Pareto guarantee, natural benefit, implementation result or novelty absence. The failure sentinel is scientific and based on generic reduction/formal insufficiency, not missing implementation or retrieval.
