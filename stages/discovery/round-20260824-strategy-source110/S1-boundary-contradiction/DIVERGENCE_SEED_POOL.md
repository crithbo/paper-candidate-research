# Source110 S1 divergence seed pool

- Assignment: `DISCOVERY-S1-20260824-SOURCE110-EDGE-CPU-RUNTIME-COMPILER-V1`; generated offline before lookup: `6/12` seeds.
- Mandatory denylist checks: base `1AC56E95A1859818EFB3E4DB853B1B4DF13D081F3AB7C780E381CA553A0FFB01`; addendum `B241D197785FC2A21F984B46C0CB93ADEB231861EBFCACF5D547C59E4C1697F4`.

### S110-01
- Denylist before lookup: `DISTINCT` — OpenVINO GenAI KV/attention semantics, not a listed TensorRT/ORT/FlashInfer identity.
- Engine/perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `COMPILER_OR_BACKEND_ENGINEER`.
- Sketch: OpenVINO GenAI's stateful KV handling may treat a model conversion constraint as a semantic requirement. Ask whether a current conversion/attention eligibility condition excludes a same-output public low-bit model for code-generation-only reasons, including conversion and CPU execution cost.
- Falsifier/risk: current support path already covers it, or the action is generic model conversion.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S110-02
- Denylist before lookup: `RELATED_ONLY` — shares low-bit surface with prior repackaging but distinct object=`OpenVINO GenAI stateful pipeline`, action=`KV semantics-preserving eligibility`, endpoint=`public GenAI contract`.
- Engine/perspective: `CONSTRAINT_MANIPULATION` / `HARDWARE_ARCHITECT`.
- Sketch: A low-bit KV/attention configuration may require a particular state layout; test whether a documented layout condition is stronger than the kernel semantic need. New format, repacking or generic quantization is excluded.
- Falsifier/risk: existing support matrix makes it a configuration knob.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S110-03
- Denylist before lookup: `DISTINCT` — OpenVINO stateful variable/cache ownership differs from vLLM/SGLang session identities.
- Engine/perspective: `NEGATION_OR_INVERSION` / `MAINTAINER`.
- Sketch: Audit whether an exact OpenVINO GenAI cache reset/reuse claim has a finite oracle across alternating requests; only a documented ownership contract and native carrier can support replication-negative work.
- Falsifier/risk: existing state tests cover it or it becomes generic cache checking.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S110-04
- Denylist before lookup: `DISTINCT` — OpenVINO GenAI benchmark artifact validity differs from generic cold/warm replication.
- Engine/perspective: `PROBLEM_REFRAMING` / `MEASUREMENT_REVIEWER`.
- Sketch: Determine if a versioned OpenVINO GenAI performance claim omits conversion, prompt processing or cache-state cost in a way that reverses its own stated deployment decision.
- Falsifier/risk: no exact public claim/harness or accounting already complete.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S110-05
- Denylist before lookup: `DISTINCT` — OpenVINO CPU attention/KV graph lowering is distinct from OpenXLA/MLIR lane and prior compile-cache identities.
- Engine/perspective: `ABSTRACTION_LADDER` / `THEORIST`.
- Sketch: A stateful attention graph may admit a finite shape/layout certificate that preserves CPU fused lowering under variable sequence steps. It survives only if not equivalent to existing shape specialization or CPU threading configuration.
- Falsifier/risk: current compiler already recognizes property or no native public oracle.
- Disposition: `KEEP_FOR_CONVERGENCE`.

### S110-06
- Denylist before lookup: `RELATED_ONLY` — fallback motif differs by exact object=`OpenVINO GenAI stateful LLM pipeline`, action=`stateful-op recognition`, endpoint=`semantic conversion support`, not PyTorch dynamic-shape recompile.
- Engine/perspective: `JANUSIAN_TENSION` / `COMPILER_OR_BACKEND_ENGINEER`.
- Sketch: Separate an OpenVINO fallback caused by unsupported stateful semantics from one caused by conversion recognition, then permit a fixed same-function lowering only for the latter.
- Falsifier/risk: generic graph transformation or current supported option.
- Disposition: `KEEP_FOR_CONVERGENCE`.

## Convergence

Selected pre-evidence RQs: S110-01→RQ-S110-01, S110-02→RQ-S110-02, S110-03→RQ-S110-03, S110-04→RQ-S110-04, S110-05→RQ-S110-05. S110-06 is contained by S110-01/05. No exact/contains seed and no replacement.
