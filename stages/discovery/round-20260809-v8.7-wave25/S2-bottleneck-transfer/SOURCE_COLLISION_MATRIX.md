# Source and collision matrix — DISCOVERY-S2-20260809-V8.7-WAVE25

| Genealogy source | Exact final object / function | Fair strongest executable union | Atomic action proposed after subtraction | Current-source / collision evidence | Disposition |
| --- | --- | --- | --- | --- | --- |
| HyCache, ATC 2025 | Not frozen: no non-excluded open-source system simultaneously fixes a particular natural preprocessing DAG, cache semantics, and final training input | HyCache’s partial multi-stage memory/storage caching, plus native cache interfaces of any mapped object | joint placement/admission after caching makes metadata dominant | A fixed action would be an eviction/admission selector, or would alter the preprocessing/cache semantics.  Neither supplies a union-external N1/N2 action. | DROP — controller or same-object gate failure. |
| ByteCheckpoint, NSDI 2025 | `torch.distributed.checkpoint` native save/load of an identical distributed model state, including resharded load | PyTorch DCP default and custom `SavePlanner`/`LoadPlanner`, global/local plans, `ReadItem`, storage reader/writer, async save; ByteCheckpoint as same-function external system subtractor | topology-aware persistent layout jointly optimized with load reads | Official DCP main documentation already exposes global save planning, load-time resharding, arbitrary planners and storage layers, async staging/upload, and plan-caching/configuration paths.  A policy inside those extension hooks is an opaque custom planner; a different persistent representation no longer has a demonstrated same-object DCP contract. | DROP — direct action-space absorption or object/guarantee ambiguity. |
| VTC, OSDI 2026 | Not frozen: a specific DNN graph compiled and executed under one native compiler/runtime contract | VTC virtual-tensor creation/data-movement elimination plus that compiler’s existing lowering mechanisms | virtual mapping/code-generation action after physical transfer is eliminated | No source-grounded mapping to a non-excluded current system provides a fair current executable union and native verifier/runtime before changing compiler semantics. | DROP — no finite same-object fidelity route. |

## v8.7 evidence ledger — PyTorch DCP

- Frozen tag/commit/date: official PyTorch `v2.13.0` / `cf30153`, released
  2026-07-08; corresponding official `main` DCP documentation observed
  2026-08-09.  This is an affirmative current-source snapshot, not an absence
  claim.
- Current symbols/interfaces: `SavePlanner`, `LoadPlanner`, `SavePlan`,
  `LoadPlan`, `ReadItem`, `create_local_plan`, `create_global_plan`,
  `finish_plan`, `async_save`, `FileSystemWriter`, and storage reader/writer
  protocols.
- Defaults checked: DCP is in-place and multi-file; FileSystemWriter defaults
  are one file per rank, synchronized files, one thread, 10,000,000-byte copy
  ahead, no staged-state cache; the default global load plan currently changes
  no local plans.
- Non-default paths checked: planner subclasses, custom storage, global save
  plans, async checkpointer choices, plan caching, alternate readers/writers,
  and safetensors integration.
- Contrary evidence: DCP itself applies load-time resharding and accepts global
  planning/custom extension points.  This prevents an honest claim that the
  essential residual action or interface is currently absent.

## Admission conclusion

No candidate has a valid action-gap certificate.  Therefore no topic brief,
`FIDELITY_CLOSURE_PLAN`, or finite Stage-A killer is supplied: inventing any
would breach the same-object and non-controller gates rather than reflect a
missing implementation task.
