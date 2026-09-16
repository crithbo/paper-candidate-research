# Source112 S1 offline seed pool

All seeds pre-checked against base + Source109 + Source110 + Source111 denylist; no exact/contains selected.

| Seed | denylist | Sketch |
|---|---|---|
| S112-01 | DISTINCT | OpenVLA action chunk normalization/unnormalization may create a source-visible semantic boundary between policy output and benchmark action evaluator. |
| S112-02 | DISTINCT | Spec-VLA speculative action verification may require a fixed verifier/action-state contract; seek a static canonical benchmark endpoint only. |
| S112-03 | RELATED_ONLY: VLA action object distinct from prior VLLM speculation/caching | π0-FAST action tokenizer/chunk contract may expose a finite equivalence oracle. |
| S112-04 | DISTINCT | Open X-Embodiment episode action timestamps may conflict with a VLA action-chunk evaluator's assumed horizon. |
| S112-05 | DISTINCT | LIBERO benchmark action success may not distinguish a named action-chunk semantic error from control noise; retain only with canonical trace oracle. |
| S112-06 | DISTINCT | A public VLA speculative verifier may classify an accepted chunk without preserving a fixed observation/action alignment; require exact artifact claim. |

Selected pre-evidence RQs: S112-01..06. No replacement after lookup.
