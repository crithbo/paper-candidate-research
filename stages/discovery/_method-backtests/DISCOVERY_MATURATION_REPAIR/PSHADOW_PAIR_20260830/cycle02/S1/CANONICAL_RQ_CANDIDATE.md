# S1-RQ-01

- Discovery lane / assignment: `DISCOVERY_S1_BOUNDARY_CONTRADICTION` / `DMR-V1-PSHADOW-CYCLE-02-S1`
- Divergence seed: `S1-SEED-01`
- Tentative public object: `huggingface/optimum-quanto` current main quantized tensor path.
- Stable semantic envelope: same quantized tensor numerical interpretation across freeze, persistence and backend dispatch.
- Primary RQ: Does the current optimum-quanto implementation expose one auditable freeze-to-serialization-to-kernel-dispatch numerical contract whose state can change a backend-lowering decision without changing quantization semantics?
- Contribution type hypothesis: `COMPILER_TOOL`.
- Counterfactual consequence: a backend engineer would select a legal lowering from frozen contract state, not infer meaning from an unfrozen runtime representation.
- Primary source route: official repository README and current quantization/freeze/dispatch source.
- Transport-only fallback: official repository source tree.
- Alternative explanation / null: current objects already serialize enough quantization state and dispatch from it; no separate target-specific action remains.
- Selected for evidence lookup: `YES`.
