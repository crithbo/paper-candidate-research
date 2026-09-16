# Independent Stage A Gate Review

## Review identity

- assignment: `STAGEA-G1-20260811-LLVM-BITCODE-ABBREV-PLANNER-RESUME1-CLOSING-V8.7`
- topic: `LLVM-BITCODE-ABBREV-PLANNER`
- role: independent Stage A gate reviewer
- decision: `CONFIRM_STOP`
- confidence: `0.99`
- quality disposition: `BELOW_Q2_STOP`
- Stage B authorized: `false`
- `stageb_user_approval_id`: `null`

## Decision

The frozen mechanism is stopped on scientific evidence, not on readiness or resource grounds. On the exact LLVM 22.1.8 object and the frozen bounded action domain, the executable B2 comparator reproduces the candidate output byte-for-byte on all 100 natural modules. Every one of the 63 modules on which the candidate improves over native B0 is absorbed by B2; strongest-union residual is `0/63`, with residual p50 and p90 both `0 B`. This is the preregistered STOP kernel.

The negative result is limited to the frozen mechanism. It is not a general impossibility claim for LLVM bitcode abbreviation planning, unrestricted grammars, other LLVM versions, or other corpora.

## Input integrity and continuity

- owner `HASH_MANIFEST.sha256`: `A2A75508E6C63E771F769A09D631B2D82166FF16C6C93EE4FBD07EC68CDF58BF`
- independently parsed and recomputed: `5292/5292 PASS`, `0` missing or mismatched, `408075895` bytes hashed
- owner `handoff.yaml`: `78AB97EBB6A8646B2F9949B9E104BCA8C53228DDFDC01C5603537192A5771099`
- owner `STAGEA_REPORT.md`: `01A8D517FE1DD91967E9A26311C9CC4AF3F2D85F952E553457FDB342FB27B1FB`
- pause checkpoint: `86328446A6FD2E4B36972C90A33E39B845E266203129F1145AABF1833CD93C0D`
- resume experiment contract: `FDF56F3B0D31E63F66BB9AD44FFCF0696A8ED81213CFF425E5DAF208EF7CD476`
- pre-claim fidelity gate: `46B2E5416F41282FE80DD5F45F2FA906A0D7FDFB8D5847D577956417B6E08ADF`

The pause package recorded no natural claim-bearing observation and no consumed scientific revision. Resume1 froze and passed its fidelity gate before the natural corpus run. No object, comparator, success rule, or evidence-bearing action was introduced after observing the natural results.

## Fidelity finding

`PRE_CLAIM_CONTRACT_FIDELITY_GATE = PASS` is independently sustained.

The object is an LLVM 22.1.8 module transformed into ordinary native raw LLVM bitcode, accepted by the unmodified native reader, with canonical decoded IR and expanded semantic record trace preserved. B0, B1, B2, and WL share the same record input, legality checks, writer, reader, native verification path, and exact bit accounting. The frozen ledger includes abbreviation definition bits, induced application-ID and CodeLen width steps, record encodings, blob alignment, block termination/alignment, and the permitted VST scope action.

Small witnesses cover the decisive discontinuities: the abbreviation-ID width step, native scope legality, and a 206-case tiny exact ceiling whose optimum equals WL at 160 bits. The earlier all-unabbreviated offset-breaking rewrite remains a control failure only and contributes no scientific inference.

## Independent recomputation

From the frozen machine-readable outputs and materialized arms:

| Check | Independent result |
|---|---:|
| natural modules / unique input hashes | `100 / 100` |
| arms | `400` |
| strict module pass | `100/100` |
| total B0 bytes | `484840` |
| total B1 bytes | `484604` |
| total B2 bytes | `484520` |
| total WL bytes | `484520` |
| WL improvements over B0 | `63/100` |
| aggregate WL saving over B0 | `320 B` |
| saving distribution | `0 B:37, 4 B:48, 8 B:13, 12 B:2` |
| B2 versus WL CSV differences | `0/100` |
| B2 versus WL materialized byte/hash differences | `0/100` |
| strongest-union residual among improving modules | `0/63` |
| residual p50 / p90 | `0 B / 0 B` |
| arm verification failures | `0/400` |
| read-trial failures | `0` across 5 trials per arm |
| actual-size, recorded-plan-hash mismatches | `0 / 0` |
| frozen planner-bound violations | `0` |

The four corpus strata also match the freeze: O0/g0 `24`, O0/gline `26`, O2/g0 `25`, O2/gline `25`.

## Strongest-baseline attack

B2 is a real, executable same-object comparator rather than a best-of post-hoc envelope. Static inspection of `wl_sldp_planner.py` (`56BB9C0FC40D2FE484DAE29AF59E2A5C8D2ED473B4AEF2AF77E68357711F4164`) finds that B2:

1. consumes only the same expanded record information available to WL;
2. draws from the same deterministic grammar universe and applies the same legality and scope rules;
3. obeys the same caps: at most 10 universe actions per leaf, 6 selected per leaf, and 12 per module;
4. evaluates each greedy action with the same exact native bit ledger used by WL; and
5. emits ordinary native bitcode that passes the same checks.

The candidate uses exact residue-mod-32 assignment DP, per-leaf subset frontiers, and a global definition-budget convolution; B2 uses a simpler greedy positive-net action sequence. That algorithmic difference is fair and exactly the risk under review. B2 is therefore a realistic current strong planner within the frozen bounded domain, not an oracle unavailable to deployment.

The capacity-neutral VST scope choice does not rescue a hidden candidate residual: scope selection, local-plan size, and selected-plan shape agree between B2 and WL on all 100 modules. The 24 scope-selected modules contain no observed WL-only combined action.

## Full-cost and STOP kernel

Because B2 and WL materialize identical bytes on every natural module, all output-size, decode object, legality, and reader-path dimensions are tied. Candidate planning complexity cannot create a positive full-cost residual when its output benefit is already zero relative to B2. The owner also completed planning and repeated reader measurements; no resource failure or missing claim-bearing dimension is being converted into STOP.

The preregistered killer condition is met directly: all candidate benefits over B0 are absorbed by the same-object strongest union. `REVISE_ONCE` is not warranted because no isolated construction defect or finite missing control remains; a revision would have to change the action domain, mechanism, or research question.

## Claim ceiling and boundary

Supported conclusion:

`LLVM_22_1_8__FROZEN_BOUNDED_GRAMMAR_AND_SCOPE_DOMAIN__100_NATURAL_MODULES__B2_FULL_ABSORPTION__NO_WL_RESIDUAL`

Not supported:

- no theorem or universal impossibility for LLVM bitcode planning;
- no statement about LLVM versions other than 22.1.8;
- no statement about unrestricted grammar generation, broader scope moves, offset-repairing transformations, or a different action budget;
- no population estimate beyond the frozen 100-module corpus;
- no claim that abbreviation planning as a general research area is exhausted.

Structural potential outside this frozen object may exist, but this candidate's current paper mechanism does not retain Tier B evidence after same-object absorption.

## Authority boundary

This review recommends that mainline register the narrow scientific STOP. It does not modify shared state, start Stage B, create a project, or authorize any further experiment. Final lane state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
