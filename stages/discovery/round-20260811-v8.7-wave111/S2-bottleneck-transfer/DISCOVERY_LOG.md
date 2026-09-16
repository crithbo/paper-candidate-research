# Discovery log — S2 checkpoint / verification bottleneck deep funnel

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE111-ENDTOEND-CHECKPOINT-VERIFICATION-BOTTLENECK-DEEP`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method and assignment-local search ordering

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.

This assignment uses an ordering-only prefilter: before candidate-grade deep review, a row must name a preliminary same-object action-divergence witness. The witness must state a whole checkpoint/verification/materialization construction unavailable to the current union without changing restart, integrity, visibility or reader/checker semantics. This prefilter does not alter canonical v8.7 admission or DROP decisions and creates no brief quota.

## R5-P0 funnel ledger

| Event | Family | Preliminary same-object action-divergence witness | Outcome |
|---|---|---|---|
| raw-01 | DMTCP process-image checkpoint/restart | only page/image deduplication and compression/path selection named; no whole process-state construction | `NOT_ADMITTED_UNFROZEN` |
| raw-02 | CRIU dump/restore and lazy-pages transfer | only dump/restore flags, page-server and migration scheduling named; full kernel-object restoration action absent | `NOT_ADMITTED_UNFROZEN` |
| raw-03 | LLNL SCR multi-level MPI checkpoint | cache-level/replication path selection, not a new restart-equivalent checkpoint construction | `NOT_ADMITTED_UNFROZEN` |
| raw-04 | etcd snapshot/compaction verification | snapshot/compaction/cache action changes revision/history behavior or is native policy | `STRUCTURAL_DROP` |
| raw-05 | Kubernetes container checkpoint via CRI/CRIU | wrapper over CRIU and runtime policy, no independent same-container action | `STRUCTURAL_DROP` |
| raw-06 | QEMU live migration dirty-page checkpoint | registry/Wave52 virtualization boundary overlap | `EXCLUDED` |
| raw-07 | Spark/Flink checkpoint materialization | active/reviewed streaming checkpoint families | `EXCLUDED` |
| raw-08 | PyTorch distributed checkpoint | Wave102 PyTorch active object family overlap | `EXCLUDED` |
| raw-09 | VPIC HPC restart dump verification | application-specific format/checker not a general same-object residual; finite construction unfrozen | `NOT_ADMITTED_UNFROZEN` |
| raw-10 | object-store incremental checkpoint manifests | Wave92 metadata/catalog overlap | `EXCLUDED` |

Counts: `raw_row_events=10`; `repeat_rescreen_events=4`; `unique_opportunity_families=6`; `preliminary_action_divergence_witnesses=0`; `candidate_grade_deep_reviews=0`; `grounded_briefs=0`.

## Source-backed raw audit

### DMTCP

**Exact object:** a restarted process tree retaining DMTCP’s process/socket/file state semantics. **Full denominator:** stop/dump image, page/data materialization, metadata/verification, transfer/persistence, restore and first correct observation. Current upstream already makes checkpoint/restart and plugins/paths the native operation. The residual can be image data movement and verification, but the only candidate action found was configuring compression/dedup/path policy. A whole equivalent state-construction and bounded reader/checker plan was not frozen, so it cannot enter deep review.

**Natural route:** DMTCP upstream test programs. **Potential 72h falsifier, if promoted:** checkpoint/restart a fixed upstream test; reject changed socket/file/process observation or an action expressible as current option/plugin choice.

### CRIU and Kubernetes checkpointing

**Exact object:** restored process/container with current namespaces, cgroups, file/TCP/lock and restore semantics. **Full denominator:** freeze/dump, image/page movement, image validation, restore and correct resumed behavior. First-party CRIU/container-runtime mechanisms provide dump/restore and page/lazy restoration paths. Kubernetes wrappers do not create a new action: they call the current runtime/CRIU operation. Any action that changes image contents or restore semantics fails same-object. No whole union-external protocol was frozen.

**Natural route:** CRIU test-suite process trees. **Potential 72h falsifier:** fixed process with a supported resource; reject if resumed behavior differs or proposed step is flag/runtime selection.

### SCR

**Exact object:** MPI application restart with the same checkpoint/restart state. SCR’s official upstream documents caching checkpoint data on compute-node storage to reduce shared-filesystem pressure and improve bandwidth. That is credible bottleneck-transfer evidence: once shared I/O is reduced, cache/replication/verification/materialization becomes visible. Yet the preliminary action is cache-level or replication placement selection. No different complete checkpoint encoding/restart construction retaining failure/recovery semantics was frozen.

**Natural route:** SCR `examples/test_api` and upstream MPI test inputs. **Potential 72h falsifier:** fixed MPI checkpoint/restart; reject divergent restarted state or a proposal reducible to configured storage level/replica policy.

### etcd and VPIC

etcd snapshot/history compaction is a revision/visibility controller: a changed retained-history rule changes what reads can legally observe. VPIC’s restart dump is an application-level carrier; an alternative layout was not specified with its reader/checker and physical-state guarantee. Neither obtains a preliminary whole-action witness.

## Outcome and evidence integrity

The prefilter deliberately blocked repetition of known complete current unions from candidate-grade deep review. This is not a scientific DROP based on missing implementation, result, resource, download, hardware or AI readiness. It is an honest `NOT_ADMITTED_UNFROZEN` outcome where the required atomic action could not be named, or a structural wrapper/semantics failure. No experiment, benchmark, data download, automation, Stage0/A/B or shared-control mutation occurred.

`PROPOSE_STAGE0: []`; lane returns `IDLE_REUSABLE_AWAITING_MAINLINE`.
