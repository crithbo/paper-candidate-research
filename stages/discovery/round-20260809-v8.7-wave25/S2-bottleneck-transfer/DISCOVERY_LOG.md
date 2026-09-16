# Discovery log — DISCOVERY-S2-20260809-V8.7-WAVE25

## Method and scope

- Cutoff: 2026-08-09.  Used production v2/v8.1, v8.6 fidelity-closure
  admission, v8.7 current-upstream-reality check, and
  contribution-first/baseline-residual-first subtraction.  The TLS-blocked
  two-axis v8.2r2 method was not used.
- Started from 2025–2026 primary contributions, then mapped a surviving
  residual to a current open-source exact object.  It did not begin from an
  issue list or a preselected repository.
- Excluded objects currently active, blocked, or terminal in the registry and
  plan before object mapping (including Parquet, LLVM bitcode, Git, RocksDB,
  CVC5, PB, COH, O4, EGraph, and the ongoing S1/S6 assignments).
- No artifact download, implementation, experiment, or benchmark was run.

## Contribution genealogy and residual subtraction

| 2025–2026 contribution lineage | Bottleneck transfer examined | Candidate exact object after mapping | Current strongest union | Result |
| --- | --- | --- | --- | --- |
| HyCache: GPU speed leaves CPU input preprocessing as the bottleneck; it jointly places partial intermediate results in memory and storage | cache placement may transfer cost to admission/metadata | No fixed non-excluded upstream object with the same multi-stage preprocessing semantics survived | HyCache’s own multi-stage hybrid cache plus native pipeline cache interfaces | DROP: an alleged next step is cache admission/eviction selection, i.e. controller/ordinary tuning, or changes preprocessing semantics. |
| ByteCheckpoint: checkpoint I/O optimization and parallelism-agnostic representation make load-time resharding central | write/layout improvement transfers the burden to metadata/read-plan construction and topology-aware load | `torch.distributed.checkpoint` (DCP) save/load of native sharded model state | DCP `SavePlanner`/`LoadPlanner`, global plans, `ReadItem`, async save, storage readers/writers, and existing load-time resharding; ByteCheckpoint is the strongest external same-function system subtractor | DROP: a proposed layout–load policy is either already an arbitrary custom planner/storage extension, or must introduce a distinct checkpoint representation.  The first is an opaque planner/controller, the second is not a proven union-external same-object action under the frozen DCP object. |
| VTC: virtual tensors eliminate data movement across the full data-movement-operator spectrum | removed physical movement can shift costs to mapping/code generation/runtime materialization | No current non-excluded compiler/runtime exact object with a source-grounded common semantic contract was fixed | VTC virtual-tensor construction and current compiler layout/fusion/data-movement mechanisms | DROP: no same-object strongest executable union and finite native fidelity route were established; a cross-compiler comparison would be unfair. |

## Current-source reality check

The DCP line received a current affirmative source check frozen at official
PyTorch release tag `v2.13.0` / commit `cf30153` (released 2026-07-08), with
the corresponding official main documentation observed 2026-08-09, rather than
an absence claim.  It documents: native save/load across ranks; load-time
resharding; `SavePlanner` and `LoadPlanner`; `create_local_plan`,
`create_global_plan`, and `finish_plan`; `SavePlan`/`LoadPlan` and `ReadItem`;
asynchronous staging/upload; `FileSystemWriter` configuration; and default
planner options.  Relevant defaults/non-default paths were considered:

- default `FileSystemWriter(single_file_per_rank=True, sync_files=True,
  thread_count=1, per_thread_copy_ahead=10000000, cache_staged_state_dict=False)`;
- non-default `SavePlanner`/`LoadPlanner` subclasses, global planning, async
  checkpointer modes, plan caching, storage-reader/writer choices, and
  HuggingFace/safetensors readers/writers.

This is affirmative counterevidence against portraying load resharding,
global planning, async staging, or storage-planner composition as absent.
No implementation-absence action gap is carried forward, so no current commit
is used to manufacture an absence-based residual.

## Decision

`COMPLETE_ZERO_PROPOSALS`.

The zero result is scientific and structural.  It does **not** rely on the
absence of a downloaded artifact, implementation, result, trace, checker, or
AI readiness.  Each concrete lineage failed a hard admission gate before a
brief could honestly freeze an action-gap certificate: direct/current-union
absorption, controller boundary, or failure to fix a same-object executable
union with a finite fidelity route.

## First-party and primary sources

- Jha et al., [HyCache: Hybrid Caching for Accelerating DNN Input Preprocessing Pipelines](https://www.usenix.org/system/files/atc25-jha.pdf), USENIX ATC 2025.
- Wan et al., [ByteCheckpoint: A Unified Checkpointing System for Large Foundation Model Development](https://www.usenix.org/conference/nsdi25/presentation/wan-borui), NSDI 2025.
- Hu et al., [VTC: DNN Compilation with Virtual Tensors for Data Movement Elimination](https://www.usenix.org/conference/osdi26/presentation/hu-muyan), OSDI 2026.
- PyTorch, [Distributed Checkpoint current main documentation](https://docs.pytorch.org/docs/main/distributed.checkpoint.html), observed 2026-08-09.
- PyTorch, [asynchronous DCP documentation](https://docs.pytorch.org/tutorials/recipes/distributed_async_checkpoint_recipe.html), observed 2026-08-09.
