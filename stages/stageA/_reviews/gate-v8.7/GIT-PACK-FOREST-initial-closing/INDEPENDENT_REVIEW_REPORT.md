# GIT-PACK-FOREST Stage A Independent Gate Review

- Review lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260809-GIT-PACK-FOREST-INITIAL-CLOSING-V8.7`
- Topic id: `GIT-PACK-FOREST`
- Input freeze SHA-256: owner manifest `FA1742777AE11057C233100F931890D24F29A1AF20FDFB1B76997270386E018B`
- Reviewer non-participation and cross-assignment contamination declaration: reviewer did not participate in owner execution, did not use an earlier assignment as scientific evidence, and read only the assigned minimum upstream and frozen owner package.
- Decision: `CONFIRM_STOP` (canonical state transition recommendation: `STOP`)
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.96`
- Evidence ceiling: `BOUNDED_NATURAL_20_REPOSITORY_GIT_2_55_NEGATIVE__NO_GENERAL_IMPOSSIBILITY_CLAIM`
- Pre-claim contract fidelity gate disposition: `PASS_NATIVE_GIT_CODEC_AND_FULL_COST`
- Candidate action completeness / proxy check: candidate is a real joint forest/order constructor; conservative action-space residual is 0, but only 719/832 and 720/832 candidate edges are directly observed in executed comparators. The remaining coverage is expressibility/proxy evidence, not executed selection absorption.
- Native codec/solver/reader/format parity: Git 2.55 diff-delta `38/38`; frozen zlib 1.3.2 level-6 stream `38/38`; final 115-object witness passed.
- Metric denominator and full-cost dimension completeness: passed for the bounded negative claim, with no cross-unit addition and no unexecuted synthetic pack used as a denominator.
- Candidate Q1 venue family: storage/data-management systems and software-engineering tooling; current bounded mechanism evidence is below the project's Q2 continuation floor.

## Claim and novelty-route consistency

The frozen object is unchanged: for each pinned natural repository commit, the complete reachable SHA-1 object set and canonical object contents are converted into one self-contained, non-thin, unfiltered Git pack v2 plus index. Candidate and comparators consume the same manifests and must reproduce the same canonical objects. The candidate executes a joint delta-forest and family-order construction, and its forest differs from the classic maximum-branching forest on 18/20 repositories. This is not a no-op wrapper.

The proposed N2 contribution, however, requires a useful residual against the current Git/combinatorial comparator family on this exact object. On the frozen 20-repository slice, the candidate produces no preregistered primary benefit in either formal run. That is a scientific negative on the frozen mechanism, not a readiness, scale, or resource failure.

## Baseline fairness audit

The executed comparator set contains ten current Git 2.55 configurations covering reuse/no-reuse, window 20/40/80, depth 50, 64 MiB window memory, name-hash v1/v2, path-walk v1/v2, and a single-ref delta-islands case, plus two deterministic simple constructors and the classic Edmonds-style branching plus Git-family order. Every denominator value comes from a successfully produced and strictly verified pack/index on the same reachable-object set.

The size, cold-access, and warm-access denominators are per-metric minima over individually executable methods. They are an offline strongest-comparator envelope, not a fictional pack assembled from incompatible actions. This is sufficient for the negative statement “the candidate did not beat any executed comparator on that metric.” It must not be rewritten as one deployable Git mode simultaneously attaining all three minima.

JSS and PPC are literature subtractors only. They were not executed and are not used as empirical evidence for STOP.

Current-reality inspection of the frozen Git v2.55.0 source commit `e9019fcafe0040228b8631c30f97ae1adb61bcdc` confirms the tested `--window`, `--window-memory`, `--depth`, `--threads`, `--reuse-object`, `--path-walk`, `--delta-islands`, and `--name-hash-version` interfaces. Source and documentation also confirm that path-walk and delta-islands are incompatible, so the owner correctly runs them as separate executable configurations rather than an invalid joint mode.

## Decisive evidence audit

Independent read-only recomputation from the two frozen formal result trees found:

| Check | codec-final-initial | codec-final-replay |
|---|---:|---:|
| Natural repositories | 20 | 20 |
| Executed methods | 280/280 | 280/280 |
| Repositories passing strict correctness | 20/20 | 20/20 |
| Candidate selected useful edges | 832 | 832 |
| Preregistered conservative outside edges | 0 | 0 |
| Candidate forest differs from classic | 18/20 | 18/20 |
| Primary-benefit repositories | 0/20 | 0/20 |
| Repositories with positive size residual | 0/20 | 0/20 |
| Repositories with cold residual greater than 5% | 0/20 | 0/20 |
| Repositories with warm residual greater than 5% | 0/20 | 0/20 |

The independently recomputed size residual is `(best executable comparator bytes - candidate bytes) / best executable comparator bytes`. Its range is `[-3.5303305475, 0]` in both runs; p50 is `-0.5529550688`, p90 is `-0.0684041968`. Negative therefore means the candidate is larger, not better. There is no direction inversion. The largest cold residual is only `0.0181128017` initially and `0.0132508289` on replay; the largest warm residual is `0.0062413411` initially and is negative on replay. None reaches the preregistered 5% access threshold.

This zero-primary-benefit result is the decisive STOP kernel. It does not depend on treating conservative action-space coverage as executed selection absorption.

## Workload and orthogonal-validation sufficiency

The 20 pinned public repositories comprise 7 source-heavy, 7 renamed/vendored, and 6 low-similarity cases, totaling 7,016 reachable objects and 50,091,889 canonical bytes. This is enough to issue a bounded natural-slice negative for the exact mechanism, especially because the same per-repository size result and zero-primary-benefit count repeat.

It is not enough to claim that all Git repositories, all pack configurations, all codecs, or all global forest/order algorithms are impossible. No conclusion is made about production-scale server operation or a broader page/packing problem.

## Cost, ablation and failure-mode audit

All 560 formal method records include pack and index bytes, construction wall/child CPU/peak RSS, strict verification cost, and cold/warm access cost. For native Git methods, `pack-objects` emits pack and index in one measured construction command; for the 160 custom methods, separate `index-pack` wall/CPU/RSS fields are also present. Candidate graph and optimization work are included in candidate construction. The aggregate ledger additionally records setup, failed immutable attempts, workspace bytes, and the conservative CPU upper bound. There are zero failed/inapplicable formal methods and zero fallback uses.

Independent sums exactly reproduce the recorded formal ledgers:

- initial: method construction `358.0720611001 s`, strict verification `78.4318873000 s`, cold access `13.3986328000 s`, warm access `1.31708199998 s`, candidate construction `121.5328404000 s`, candidate pack+index `15,014,469 B`;
- replay: method construction `357.9771191000 s`, strict verification `78.6216500000 s`, cold access `13.5258964000 s`, warm access `1.32171259997 s`, candidate construction `121.4725437000 s`, candidate pack+index `15,014,469 B`;
- all recorded pilot/control runs: conservative CPU upper bound `7,773.765625 s` under the `14,400 s` budget;
- final workspace accounting: `3,039,633,317 B` under the 4 GiB budget, with `27,306 B` of immutable failed attempts separately retained.

Bytes, CPU seconds, wall seconds, RSS bytes, and access timings remain typed fields; they are not arithmetically combined. Planning cost is not hidden behind pack size.

## Latest collision and action-coverage audit

The preclaim current-upstream check is adequate for the frozen Git 2.55 object: the tested controls exist in the pinned source and executable, and the owner did not claim that an unavailable option is absent from current Git.

One owner interpretation requires correction. The `conservative_action_coverage` implementation first accepts an edge actually selected by an executed comparator, then accepts same-path pairs as a path-walk superset, and finally accepts an edge lying within 80 positions in one of three proxy orders. The two formal runs therefore decompose as:

- initial: 719 `OBSERVED_UNION_EDGE`, 112 `PATH_WALK_SAME_PATH_SUPERSET`, 1 `CONSERVATIVE_WINDOW80_PROXY_1`;
- replay: 720 `OBSERVED_UNION_EDGE`, 111 `PATH_WALK_SAME_PATH_SUPERSET`, 1 `CONSERVATIVE_WINDOW80_PROXY_1`.

Thus `outside=0` is a valid preregistered conservative action-space upper-bound result, but it does not establish that the current Git union actually selected all 832 candidate edges. Counting only observed selections would leave 113/832 (`13.58%`) and 112/832 (`13.46%`) unmatched. The review therefore rejects “832/832 executable selection absorption” as phrased evidence. This does not reverse the bounded STOP because the independent performance kernel is 0/20 primary-benefit repositories in both runs.

## Independent Q1/Q2 recalibration

- Candidate comparator audit: passed for the bounded natural negative; action-coverage wording corrected as above.
- Venue/status verification: no new venue claim is needed for the STOP decision; frozen upstream source audit remains within its documented ceiling.
- Independently added or replaced paper: none.
- Editor/venue-fit view: a mechanism with no primary benefit on either formal run lacks a viable current paper result under the frozen claim.
- Methodology view: same-object, codec fidelity, strict validation, typed cost, and replay are strong; the action-selection absorption narrative is weaker than stated but non-decisive.
- Domain-contribution view: the candidate is structurally nontrivial, yet its bounded natural evidence is negative.
- Devil's-advocate view: scale, other repositories, or other constructors might behave differently; that only limits scope and does not manufacture a residual for this frozen mechanism.
- Status: `PARITY_NOT_PLAUSIBLE`
- Bounded gap audit: no finite evidentiary gap can turn the already observed 0/20 primary-benefit result into preliminary support without changing or scientifically revising the frozen mechanism.

## Q1/Q2 sufficiency judgment

- Clear problem: yes.
- Non-trivial contribution: structurally yes.
- Credible current evidence: yes, but negative for the frozen mechanism.
- Executable formal-experiment gap: no missing experiment is required to decide this Stage A contract.
- Reviewer-recognizable paper narrative: not at the project's minimum Q2 line for this mechanism and claim.

## Non-relaxable quality audit

- Same-object: pass.
- Latest collision/current-upstream reality: pass for frozen Git 2.55.
- Strong fair baselines: pass, subject to the explicit envelope wording.
- Natural input/evidence: pass for the bounded 20-repository claim only.
- Full-cost: pass.
- Reproducibility: pass for scientific decision; byte identity is partial and explained.
- Evidence/claim honesty: pass only with the corrected action-coverage language and exact claim ceiling.

## Reproducibility and integrity

Independent SHA-256 verification of the owner manifest covered all `63,924` listed files and `3,039,711,577` listed bytes: zero missing, zero unlisted, zero malformed, and zero mismatched entries. The manifest self hash matches the frozen assignment. The seven supplied critical-file hashes also match. Discovery, Stage 0 primary, and Stage 0 confirmation manifests independently verify 4/4, 4/4, and 5/5.

All 560 frozen physical pack/index file hashes match their JSON records. Across formal rounds, pack/index hashes match for 224/280 method pairs; candidate matches 20/20, the two deterministic simple constructors match 40/40, and classic branching matches 19/20. Git's auto-threaded delta search and one equal optimum/tie in classic branching account for the remaining byte-level variation. Strict object equality, candidate hashes, size residuals, candidate covered flags, outside counts, and the STOP kernel remain stable. Physical nondeterminism therefore does not affect the scientific decision.

## Required stop kernel

`CONFIRM_STOP`: the exact frozen joint forest/order candidate is real and correctly executed, but on both codec-faithful formal runs it has `0/20` preregistered primary-benefit repositories; every size residual is nonpositive, and no access residual exceeds the 5% threshold. This is a fair, same-object, full-cost, reproducible scientific negative on the bounded natural slice.

The only allowed scope is `BOUNDED_NATURAL_20_REPOSITORY_GIT_2_55_NEGATIVE__NO_GENERAL_IMPOSSIBILITY_CLAIM`. The result does not establish a general impossibility theorem, does not rule out a different algorithm or contract, and does not authorize Stage B. `stageb_authorized=false`; `stageb_user_approval_id=null`.
