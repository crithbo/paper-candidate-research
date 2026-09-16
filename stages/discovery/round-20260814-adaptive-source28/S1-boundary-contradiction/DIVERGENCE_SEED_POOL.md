# Source28 offline divergence seed pool

Assignment: `DISCOVERY-S1-20260814-ADAPTIVE-SOURCE28-RQ-PRODUCTION-V1`; generated before evidence lookup. Seeds are non-evidentiary.

| ID | Engine / perspective | Sketch and cautious conclusion-first test | Risk | Disposition |
|---|---|---|---|---|
| S01 | `PROBLEM_REFRAMING` / compiler engineer | RISC-V BF16 instructions make a reduced-precision arithmetic contract visible across frontend, ABI and target selection. A cautious paper claim would require a target-specific construction that preserves specified conversion/rounding observations, not just `-march` selection. | ordinary instruction selection | selected for RQ |
| S02 | `JANUSIAN_TENSION` / hardware architect | A SPIR-V physical-storage-buffer pointer is both a typed IR value and a device-address ABI promise. A contribution would have to retain the same module/ABI validity while changing a compiler-runtime construction. | may be generic lowering or active GPU tool surface | selected for RQ |
| S03 | `CONSTRAINT_MANIPULATION` / maintainer | A Wasm tail-call producer avoids a frame while a consumer stack/unwind interface preserves observations. A valid contribution needs a single engine/ABI and must not repeat earlier async/Wasm-GC work. | historical Wasm surface risk | backlog |
| S04 | `BISOCIATION_STRUCTURAL_TRANSFER` / operator | Device global variable initialization crosses host producer, code object and runtime visibility boundaries. A valid endpoint is a same-program object constructor, not an initialization mode flag. | current GPU/runtime surface may be saturated | backlog |
| S05 | `NEGATION_OR_INVERSION` / theorist | A non-default ABI feature is often a consumer contract rather than a producer optimization; invert the question by seeking required state that source-lowering assumes away. | needs exact target and carrier | backlog |
| S06 | `ABSTRACTION_LADDER` / measurement reviewer | Public compiler regression tests may characterize a stable divergence between static ABI metadata and reader behavior. This only becomes N3 with a versioned corpus and independent consequence. | measurement route not yet anchored | backlog |
| S07 | `ADJACENT_POSSIBLE_OR_BOUNDARY` / end user | GPU executable formats may carry memory-layout commitments that later runtime APIs cannot reconstruct. | format/serializer saturation risk | excluded |
| S08 | `COMPOSE_DECOMPOSE_SIMPLIFY` / compiler engineer | Post-link form relaxation may invalidate early cost choices in an uncommon target backend. | target-RA lineage saturated | excluded |

Coverage: seven engines and seven perspective roles. S01 and S02 preserve distinct object, action, carrier and falsifier surfaces; no score, quota, or evidence outcome was used in selection.

