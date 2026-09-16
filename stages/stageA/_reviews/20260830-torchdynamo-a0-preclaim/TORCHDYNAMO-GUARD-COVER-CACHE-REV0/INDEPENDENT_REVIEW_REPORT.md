# TORCHDYNAMO-GUARD-COVER-CACHE-REV0 A0 Pre-Claim Fidelity Review

## Gate outcome

- Assignment: `STAGEA-GATE-20260830-TORCHDYNAMO-A0-PRECLAIM`
- Reviewer lane: `STAGEA_GATE`
- Model route: temporary `gpt-5.6-sol / high`
- Decision: `BOUNDED_A0_ENGINEERING_CORRECTION_REQUIRED__A1_START_REJECTED`
- Correction accounting recommendation: `A0_ENGINEERING_CORRECTION_BATCH_2_OF_2`
- Scientific verdict: `NOT_EVALUATED__PRECLAIM_FIDELITY_ONLY`
- Evidence ceiling: `STATIC_PACKET_AND_NONCLAIM_SCHEMA_CONTROL_ONLY__NO_SCIENTIFIC_INFERENCE`
- Topic formal state recommendation: unchanged `STAGEA_ACTIVE`; MAINLINE remains the only state writer.
- Scientific revision effect: none. This is an engineering-contract closure, not a scientific revision or method redesign.

## Executive reason

The packet has a correct high-level contract skeleton: the PyTorch artifact and six hook files are hash-pinned, the restricted quotient and compatibility dimensions match the Stage 0 revision contract, all 1,792 cell identifiers are deterministic and unique, logical retirement is separated from physical reclamation, and the hidden-result firewall remained intact. However, the frozen owner artifacts do not yet bind those declarations to an executable A1 action/checker/baseline/full-cost DAG. The readiness ledger itself records `legality_equivalence_object_identity_witness: false` and `exact_argv_cwd_env_output_schema: false`. The only owner-side executable source files are packet generation, artifact extraction, and a non-claim schema control; no candidate A1 runner or compatibility/full-cost collector is frozen. A1 therefore cannot be authorized without treating labels and field counts as implementation evidence.

## Independent checks

### 1. Artifact and hook integrity — static PASS

- Frozen artifact: `torch 2.13.0+cpu`, commit `cf30153c4c131c8164ee7798e5022d810682e2cb`.
- Wheel SHA-256 independently matches `024C6CC0C1B085F2F91F20A3DC27B0471D021C31CE84B81BE3AFDC39F791FD9D`.
- All six pinned hook/source hashes independently match the freeze record.
- The pinned source exposes `_ExtraState.invalidate`, `reset_code`, `ExtraState.move_to_front`, `ExtraState.move_to_back`, `CacheEntry.invalidate`, and the current recompile-limit machinery.
- This establishes a real logical-retirement locus. It does not itself establish candidate legality or equivalence for a selected entry.

### 2. Solver orientation/options/timeout/certificate — partial, blocking

- Orientation is correct: `A covers B` is encoded as `B implies A`, tested through `B AND NOT A`.
- SymPy `1.14.0`, `use_lra_theory=true`, `all_models=false`, and a nominal two-second budget are frozen.
- The non-claim control receipt reports two UNSAT replays linked by the declared replay hashes.
- Blocking defects:
  1. `SOLVER_CERTIFICATES.json` remains stamped `solver_result: UNEXECUTED_PRECONTROL`; the result is split into a separate receipt rather than sealed as one self-contained replay/certificate record.
  2. The control reconstructs predicates from the symbol name and hard-coded branches rather than parsing/verifying the frozen normalized predicates and symbol-source map.
  3. It trusts the stored replay hash instead of recomputing and comparing it.
  4. `use_lra_theory` is passed, but the frozen `all_models=false` option is not explicitly consumed by the replay call.
  5. The two-second timeout is checked only after the solver returns; no deadline interrupts a hung/unsupported solve. This cannot implement the frozen `unknown_timeout_unsupported -> INCOMPARABLE` rule.

### 3. Restricted non-shape quotient — schema PASS, executable binding missing

- The nine packet fields exactly match `RESTRICTED_QUOTIENT_AND_COMPATIBILITY.yaml`.
- The packet does not freeze an evaluator that extracts these fields from real Dynamo entries, reports unknown/non-equal dimensions, and prevents shape comparison before exact non-shape equality. A list-and-count control is not an object-identity witness.

### 4. Compatibility oracle — schema PASS, executable binding missing

- The 16 declared fields cover output structure/value policy, dtype/shape/stride, aliasing and mutations, Python/runtime state, graph-break/fallback behavior, autograd/saved tensors/recompute, backward behavior, and downstream compilation/cache context.
- No frozen checker path/hash, per-field extraction rule, concrete output schema, or fail-closed per-cell result vocabulary is bound to those 16 dimensions.
- The current control validates only `len(compatibility_oracle) == 16`; it never compares candidate/native compile units. This fails the required replayable legality/equivalence witness.

### 5. Result-independent streams and 1,792 cells — static PASS with execution gap

- Independent parsing confirms `2 models x 2 frames x 7 signatures x 16 policies x 2 temperatures x 2 process-control arms = 1,792` cells.
- All 1,792 IDs are unique. Independent recomputation of the ordered ID-list digest matches `636BABDB0722ACD31F5B5295927DF07C08B0EFCCAC5CE80BC6A74657FA731175`.
- Positive overlap, fully static, dynamic/disjoint, generalized-kernel, ownership-unknown/shared, and checkpoint-recompute strata are frozen before results.
- The signatures remain semantic labels rather than exact input/guard producers with concrete values, path/hash/argv/schema. Consequently the same cell IDs cannot yet be instantiated reproducibly by an A1 runner.

### 6. Ownership split — static PASS

- The seven-layer reference graph and four ownership statuses match the Stage 0 contract.
- Logical retirement is correctly separated from physical reclamation.
- Physical deletion is allowed only for `SOLE_OWNER_PROVED`; shared, external, and unknown ownership must retain artifacts and remain in the denominator.
- The current packet does not claim physical bytes from logical invalidation. No scientific or memory-saving inference was made.

### 7. Native baselines and full cost — taxonomy PASS, runnable contract missing

- Fifteen named native/simple/offline comparator policies are present, and the offline oracle is not represented as a deployable online policy.
- The ten full-cost dimensions match the Stage 0 contract.
- The packet does not bind exact PyTorch flags/config values, accumulated/per-call limit grids, baseline argv/environment, collector paths, units, missing-value rules, or per-cell producer-consumer dependencies. Field names and policy labels do not establish fairness or complete costing.

### 8. Hidden-result firewall — PASS

- Owner records consistently report zero claim cells executed, no effect-field visibility, no scientific inference, and no scientific revision consumption.
- The independent review did not run Torch, SymPy, the packet generator, the universe, any trace, candidate/native policies, or any claim/control executable. Only frozen bytes, hashes, source text, and data schemas were read.

## Single bounded same-object correction route

Use the one remaining ordinary A0 engineering correction batch to seal one executable preclaim bundle without changing the object, stream, information contract, guarantee, endpoint, denominator, baseline union, or full-cost dimensions:

1. Freeze a candidate A1 runner/action implementation path and hash that performs solver-certified cover selection and calls the exact pinned `ExtraState.invalidate(CacheEntry, deleted_guard_manager)` logical-retirement locus; include a small non-claim legality/object-identity witness proving the selected entry retires while other entries/bucket accounting remain valid.
2. Freeze the four canonical case identities (`2 models x 2 frames`) and concrete ordered signature/input/guard producers, including checkpoint/recompute material, with path/hash/schema and exact producer argv.
3. Freeze a compatibility checker that extracts and compares every mandatory quotient/oracle dimension from real compile units, emits the full frozen status vocabulary, and maps unknown/unobservable data to `INCOMPARABLE` or the specified failure status.
4. Replace the split solver declaration/receipt with a self-contained replay record: consume normalized predicates and symbol-source maps, recompute the replay hash, explicitly apply every option, and enforce a real two-second deadline whose timeout/unsupported outcome is `INCOMPARABLE`.
5. Bind every native/simple/offline baseline to exact flags/config/argv and the identical model/frame/signature/order/temperature/control inputs. Preserve the offline oracle's nondeployable classification.
6. Bind all ten full-cost dimensions to exact collectors, units, per-cell schema, unavailable-value handling, and producer-consumer dependencies; retain all failures and ownership-unknown cells in the denominator.
7. Freeze exact `argv`, `cwd`, process-local environment, output roots, and schemas for the candidate, checkers, baselines, and collectors. Run only a separately authorized non-claim wiring/schema control under the result firewall, then return to an independent preclaim gate.

This is one atomic packet-completion correction, not permission for multiple partial retries. If it cannot close within `A0_ENGINEERING_CORRECTION_BATCH_2_OF_2`, the next disposition must be an execution/policy hold under the cumulative budget; it must not silently create a third A0 correction, scientific revision, or A1 claim run.

## Stop statement

`A1_DECISIVE_PILOT` is not authorized by this review. No claim execution, scientific-effect read, owner modification, resource action, second revision, Stage B action, cleanup, or shared-state transition was performed.
