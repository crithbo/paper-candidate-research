# Rule Audit Report

## 中文摘要

- 发现的问题：零 clean brief 不是单纯因为 Q2 门过严。R16A/R16B 的主要问题是题源过度集中在成熟 cache/index/catalog/constructor/maintenance 对象，重复与包含关系负担上升；进入深审后又大量被 current native union 吸收，或停在原子动作、current-source union、Q2 论文形状尚未闭合。canonical-resume01 使用正式 v8.7 仍然零产出，说明问题不是 V9 单独造成的。
- 对推进速度或研究质量的影响：六路并行已经足够，继续增加并行只会更快重复同类题。当前更稀缺的是高质量题源、战略文献角色覆盖和对有限 near-miss 的定向深挖。
- 建议修改：不打断正在运行的 adaptive-source01。下一安全 assignment 使用可回滚的 `SATURATION_AWARE_SOURCE_PROFILE_V1`：跨轮饱和记忆、战略 source triad、最多四个 carry-forward closure slots、measurement/formal 独立入口、完整漏斗原因码。先作为 assignment-local 两周期 pilot，不立即写成永久规则。
- 是否需要用户批准：现有 `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 已覆盖不降低门槛的下一轮题源重配和遥测；永久修改共享规则、自动抑制某类题源或改变录取语义仍须用户另行批准。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-CANONICAL-DISCOVERY-ZERO-YIELD-ADAPTIVE-SOURCE-R17`
- `trigger`: R16A、R16B 与 canonical-resume01 连续没有 `CLEAN_STAGE0_BRIEF`
- `requested_by`: mainline under user adaptive-discovery authority
- `date`: `2026-08-14`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-CANONICAL-DISCOVERY-ZERO-YIELD-ADAPTIVE-SOURCE-R17/`
- `shared_files_modified: false`

## Question and scope

- User/process question: 为什么连续三个控制周期为零 clean brief；这是健康 abstention、题源饱和、检索深度不足还是录取门不合理；怎样在不暂停六路和不降低硬门的情况下提高后续 Stage0 供给。
- Rules inspected: `AGENTS.md`; `plan.md`; relevant registry state; `rules/ROLE_RULE_AUDIT.md`; `rules/ROLE_DISCOVERY.md`; the active adaptive-source01 assignment contracts.
- Evidence inspected: frozen R16A/R16B sample, dedup, cost and independent-auditor ledgers; six canonical-resume01 handoffs and their directly decisive logs/collision matrices; six explicit registry `stage0_repair_vector` records.
- Out of scope: new retrieval; candidate/Stage0/A/B execution; current adaptive-source01 interruption; shared-file modification; V9 Production; terminal-state changes.

## Current authoritative behavior

The current rules correctly provide four key protections:

1. zero proposals are legal and do not justify lowering Q2;
2. Discovery must distinguish `STRUCTURAL_DROP` from `NOT_ADMITTED_UNFROZEN`;
3. current-source reality, same-object, strong comparator union, natural evidence and full-cost remain hard requirements;
4. after two complete zero-clean-brief cycles, source allocation may adapt while Discovery continues, and V9 remains `OFF`.

The active adaptive-source01 contracts already move in the right direction: S1 semantic boundaries, S2 cross-layer algorithms, S3 natural laws, S4 measurement/characterization, S5 formal guarantees, and S6 recent limitations/current-source residuals. R17 therefore does not recommend rewriting those active assignments or pausing them.

## Evidence and diagnosis

### 1. R16A/R16B show increasing source-family saturation

| Wave | Accepted unique families | Excluded repeat/contained/cross-source families | Observed family-graph inputs | Exclusion burden | Canonical disposition |
|---|---:|---:|---:|---:|---|
| R16A | 24 | 13 | 37 | 35.1% | 11 drop, 13 unfrozen, 0 brief |
| R16B | 24 | 21 | 45 | 46.7% | 12 drop, 12 unfrozen, 0 brief |
| Combined, same unit | 48 | 34 | 82 | 41.5% | 23 drop, 25 unfrozen, 0 brief |

The second wave needed more exclusions to obtain the same 24 unique families. This is direct evidence of saturation, not merely a low acceptance preference. At least 32/48 accepted families came from the S2–S5 artifact-construction region and were predominantly mature caches, indexes, compiled catalogs, serialization/maintenance constructors or their close relatives. Lane diversity therefore did not produce source-archetype diversity.

The 23/48 canonical drops show healthy hard-gate abstention: many apparent opportunities were already native actions, configuration/controller choices, or generic packing remainders. Those gates should not be weakened. The 25/48 `NOT_ADMITTED_UNFROZEN` cases show a different loss mode: half the accepted sample never closed the action/current-union/Q2 package sufficiently to become a brief.

### 2. canonical-resume01 reproduces the problem under v8.7

The six canonical lanes report about 36 raw diagnostic rows, 12 candidate-grade deep reviews and zero briefs. Therefore V9 cannot be blamed for the zero yield. Among 35 rows whose primary disposition can be reconciled from the handoffs:

- 16 are structural/current-union/generic/controller drops;
- 11 are `NOT_ADMITTED_UNFROZEN`;
- six are repeat/cross-lane/near-family exclusions;
- two are other pre-depth exclusions;
- one S1 raw row is not explicitly mapped by the handoff/unique-family ledger.

The one-row discrepancy is a telemetry defect, not a scientific defect. It reinforces the need for one-to-one raw→family→deep→brief reason accounting.

The source matrices are dominated by current artifact documentation and source surfaces. Only isolated paper anchors are visible in the close cases. This is useful for collision checking but weak as a discovery source distribution: it preferentially produces mature objects whose complete native action union is already documented. More literature volume everywhere would waste time; deeper strategic genealogy is needed only for the highest-promise families.

### 3. Current-union subtraction is working but happens too late

The close cases repeatedly fail only after substantial deep review:

- Clang PCM, rustc incremental, GDB index, BTF, Subversion FSFS, restic and Borg are absorbed by current native actions or leave only configuration/generic remainder.
- OpenMP lifetime, DuckDB checkpoint, gcov/CTF, Mesa/AppStream/dconf, eBPF and Gmsh remain nonterminal because the exact union-external action, current-source closure or target-specific guarantee is unfinished.

This pattern argues for a cheap breadth-stage native-action sentinel and source-archetype saturation check before spending a deep-review slot. It does not justify treating an unclosed union as an absence claim or a scientific STOP.

### 4. The bottleneck is action/Q2 closure more than full-cost strictness

Across the 11 canonical-resume `NOT_ADMITTED_UNFROZEN` cases, the common missing component is a named complete union-external action or target-specific guarantee. Natural-law/carrier closure is explicitly unfinished in a smaller subset. Full-cost dimensions are usually listed even for dropped cases; full-cost is rarely the sole primary blocker.

The six registry records that explicitly carry a Stage0 repair vector provide a useful independent check:

| Repair facet | Count |
|---|---:|
| Atomic action unclear | 6/6 |
| Full-cost gap | 5/6 |
| Q2 paper-shape gap | 5/6 |
| Omitted first-party feature/current capability | 4/6 |
| Omitted generic kernel | 3/6 |
| Omitted current same-object surface | 1/6 |
| Natural-carrier gap | 1/6 |

These six are not the whole Stage0 history, but every explicitly tagged record needed action clarification. The repair evidence supports improving pre-brief source roles and action certificates; it does not support lowering the gate.

### 5. Measurement and characterization remain underused

The previous source mix heavily favored software artifact constructors. In canonical-resume01 S4 screened six families but performed zero candidate-grade deep reviews, while S3 required a named exploitation mechanism for N3. The project rules separately recognize `MEASUREMENT_CHARACTERIZATION` and benchmark/evaluation correction as valid paper types. A strong measurement brief therefore should not be forced to invent an N2 exploitation algorithm: a stable natural law, confound-controlled evidence plan, decision/ranking consequence, benchmark correction and reproducibility route can form the Q2 shape.

This is an alignment clarification, not a relaxation. Dashboards, uncorrected anecdotes and synthetic-only patterns remain below the bar.

## Root-cause classification

| Cause | Evidence strength | Contribution to zero yield |
|---|---|---|
| Mature source-archetype saturation | High | Primary |
| Historical/cross-lane repeat burden | High; 35.1%→46.7% across R16 waves | Primary |
| Late current-union absorption | High | Primary but scientifically healthy |
| Incomplete action/current-source/Q2 closure | High; 25/48 R16 and 11 canonical-resume cases unfrozen | Primary and potentially repairable |
| Natural/full-cost gate itself too strict | Low | Not supported |
| V9 caused zero yield | Refuted as sole cause by canonical-resume01 | Not primary |
| Six-lane parallelism insufficient | No evidence | Not supported |

## Recommendation

- Decision: `PATCH_RECOMMENDED__ASSIGNMENT_LOCAL_PILOT_FIRST`
- Minimum effective change: let adaptive-source01 finish unchanged; at the next safe assignment boundary, add the bounded `SATURATION_AWARE_SOURCE_PROFILE_V1` described in the proposal.
- Why smaller fixes are insufficient: merely adding more raw families reproduces the 41.5% R16 exclusion burden. Merely reading more papers on every family spends more time on already-native objects. The source distribution, cheap collision sentinel and near-miss closure allocation must change together.
- Why a permanent rule patch is premature: adaptive-source01 has not yet produced results. One current cycle plus one saturation-aware cycle gives a reversible comparison without changing scientific admission semantics.
- Non-relaxable gates preserved: Q2, same-object, latest collision/current-source reality, fair strong union, natural evidence, full-cost, reproducibility, claim ceiling, STOP non-revival and downstream independence.

## Validation and rollback

- Current adaptive-source01: continue; no mid-assignment change.
- Pilot comparison: treat adaptive-source01 as the first observational cycle and the next saturation-aware assignment as the second. Do not pool mixed funnel units.
- Primary process metrics: repeat/contained exclusion burden; mature-constructor share; source-triad readiness among deep reviews; fraction of finite near-misses closed; raw-row disposition completeness; clean briefs and independent Stage0 outcomes.
- Suggested directional success indicators, not admission quotas: repeat burden falls from the R16B 46.7% reference toward ≤30%; every raw row maps to exactly one primary disposition; at least 75% of deep reviews have the strategic source triad; mature constructor/cache/index families consume ≤15% of raw source budget unless a new action class is predeclared.
- Scientific outcome handling: zero briefs remains legal. A clean brief is dispatched immediately and is not held until the cycle ends.
- Rollback: if the source profile increases weak Stage0 stops, fails to reduce duplication, or starves a valuable source type, remove the assignment-local allocation weights at the next boundary. Preserve all logs; never revive a STOP or restore a rejected family as “new.”

## V9 future evaluation

V9 remains `OFF`. R16's 48/48 decision stability and zero leakage are integrity observations only; clean-brief precision remains undefined.

Future V9 evaluation should use chronologically accrued real canonical clean briefs:

1. include every clean brief before its Stage0 outcome is known; mechanical duplicates are removed before outcome only;
2. under a future explicit `SHADOW` authorization, freeze V9's completeness/repair predictions before independent Stage0 reads the brief;
3. use independent Stage0 confirmation as the outcome source;
4. report confirmed Q2-survival precision, fatal-collision rate, repair-vector recall, unsupported-flag rate and repair burden;
5. do not claim Discovery recall from a clean-brief-only sample;
6. an interim report at six briefs is descriptive only; a sealed evaluation should wait for at least 12 briefs across at least two cycles and three contribution types, with thresholds frozen before outcomes;
7. R17 does not authorize that shadow, any threshold, or Production cutover.

## Mainline handoff

- User approval already present: assignment-local adaptive source allocation and telemetry are covered by the existing adaptive-discovery authority. No new generic approval is needed to issue the proposed pilot if it does not change admission semantics.
- User approval still required: any permanent shared-rule patch, automatic suppression/blacklisting, V9 shadow/replay, V9 Production, or change to quality/status gates.
- Files proposed for change now: none.
- Registry migrations proposed now: none.
- Existing active/blocked/hold/terminal topics affected: none.
- Shared files modified: `false`.
