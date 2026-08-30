# ROCKSDB-DICT-COVER Independent Stage A Gate Review

## 中文摘要

- 审查结论：`RETURN_NO_SCIENTIFIC_INFERENCE_WITH_NO_VALID_REVISION_ROUTE`。
- 决定性理由：r7 的 16-block 构造门在完整 560 分母形成前失败；342 个 PASS 只是不可用于科学推断的执行前缀。冻结对象同时固定 4096-byte block、自然 manifest、方法/压缩语义和 16-block 门，没有一个合规的全局原子构造变化可修复该失败。
- 第二独立缺口：冻结 selector trace/aggregator 缺少 contract 必需的 retained-set、final-dictionary 与 compressed-match 证据。修复它需要另一项 claim-critical instrumentation 变化，不能与构造修补合并伪装成一次原子 revision。
- 生命周期：接受精确 raw retention 与 15 个 deferred cleanup leaves 的提案；本 review 未执行 cleanup。
- 用户/MAINLINE 动作：不自动 PASS、STOP、reserve、resource blocker 或 Stage B；由 MAINLINE 保持无科学状态变化并提交政策处置。

- Review lane id: `STAGEA_GATE`
- Assignment id: `STAGEA-GATE-20260825-ROCKSDB-R7-INVALID-CONSTRUCTION-REVISION-ELIGIBILITY`
- Input context SHA-256: `EE463A6F0AAE2AF08A63C716FD7C3EDB78F65853787EB30A1EAA7EE80F6F1DEC`
- START SHA-256: `A6256261B68D29B5D5976D7B830B74F1493AA1EA44ED05D8C8493C40CE738637`
- GATE_PRECOMMIT SHA-256: `2FF51B4B10AF4D0061D0018646A75A214C2DB35B76D1651E46C74D71288C7EE6`
- Reviewer non-participation: reviewer did not implement or run owner r7; owner files were read-only.
- Decision: `RETURN_NO_SCIENTIFIC_INFERENCE_WITH_NO_VALID_REVISION_ROUTE`
- Quality tier: prior `TIER_B_Q2_VIABLE` retained as historical state only; not recalibrated from invalid evidence.
- Evidence ceiling: `INVALID_CLAIM_CONSTRUCTION__NO_SCIENTIFIC_INFERENCE`

## Pre-claim and construction fidelity

Resume6 F0–F5, A1 one configure/one clean build, four nonclaim smokes, frozen-core preservation, and quiescence are hash-supported. These engineering gates do not cure the claim construction. The frozen natural harness creates one standard BlockBasedTable bottommost L1 SST with 4096-byte blocks and requires at least 16 data blocks. `pypi-django / B1 / G2` fails that requirement in both replays before a full valid result exists.

The failure is therefore construction invalidity rather than a scientific result. It occurs in baseline `B1`, not candidate `C1`; it does not show that the candidate mechanism fails. The minimal failure JSONs lack the valid-result fields needed for object, cost, and mechanism aggregation.

## Raw evidence and denominator audit

- Frozen denominator: 20 manifests × 7 methods × 2 cells × 2 replays = 560.
- Matrix: 342 PASS, 2 FAIL, 216 PLANNED; retry/exclusion false.
- Independent filesystem check: 344/344 executed result hashes match the matrix; 344 run directories and 344 result files exist; none of the 216 planned directories exists.
- Ledger: 344 rows, with identity set exactly equal to executed matrix identities; 342 true and 2 false.
- Failure pair hashes: `C3E5628E...` and `EBC1E67E...`, exact error `SST has fewer than 16 data blocks`.
- Aggregation: no global p50/p90 frontier, useful-residual ratio, or final mechanism decision was computed.

The executed prefix is deterministic but not a preregistered estimand. Reading its performance direction would create outcome-dependent selection. This review used only identities, counts, hashes, error classification, and source/contract structure; the 342 performance values do not enter the decision.

## One-atomic-revision eligibility

`REVISE_ONCE` is not eligible. A legal revision would have to preserve the exact object/function, 20 natural manifests, all methods/cells/replays, native-current baseline, table format, block size, compression semantics, full-cost metrics, and the 16-block invariant.

No direct construction repair satisfies those constraints:

- reducing block size changes the frozen production object and the meaning of the observed gate;
- padding/duplicating/splitting/transforming records changes the natural object;
- altering dictionary or compression behavior changes `B1/G2` baseline semantics;
- excluding Django/G2/failure replays or lowering the gate is expressly forbidden;
- continuing only 216 or rerunning only failures is not a fresh complete denominator.

Separately, the frozen mechanism contract requires a raw/useful residual ratio plus final-dictionary and compressed-block-match evidence. The candidate source computes fragment digests internally but emits only aggregate counters. The frozen aggregator explicitly declares the required retained-fragment digests, baseline membership, dictionary bytes, and compressed-match trace unobservable. Adding them is a distinct candidate/instrumentation change after results. The authorized one atomic construction revision cannot close both defects without violating the contract and revision count.

Scientific revision remains unconsumed (`1` available, `0` recommended for execution by this gate).

## EIC and methodology synthesis

Both independent cards converge on the same bounded disposition:

- evidence handling and reproducibility of the executed prefix are credible;
- no complete valid Stage A positive or negative exists;
- no one-atomic same-object revision route exists;
- the correct claim ceiling remains no scientific inference.

This is not a journal-tier rejection. The prior Q2 viability assessment is not re-evaluated because the frozen Stage A endpoint was never validly observed. It is also not a resource blocker: no missing network, hardware, license, or tool input caused this gate result.

## Non-relaxable quality audit

- Same-object: not closed for the two failed identities; denominator invalid.
- Latest collision: outside this bounded gate; no novelty claim is advanced.
- Strong fair baselines: union frozen, but full denominator incomplete.
- Natural input/evidence: genuine natural manifests; invalid construction at one frozen cell.
- Full-cost: 344 raw rows exist; global full-cost endpoint incomplete.
- Reproducibility: 172/172 executed replay pairs match on nonvolatile fields; global denominator incomplete.
- Evidence/claim honesty: PASS; no prefix-based PASS/STOP claim and no retry/exclusion.

## Lifecycle acceptance

The raw root contains 5,452 files / 331,806,359 bytes with zero reparse entries. All 15 proposed cleanup leaves independently match their frozen files/bytes and contain zero reparse entries; no claim harness process is active. The leaves are reacquirable toolchain/build metadata, transferred archives, or ephemeral cache/smoke DBs. Mandatory raw, source, frozen binary/libraries, runtime, summary, failure pair, resume capsule, and manifest remain retained. Projected retained size is 515,241,582 bytes, below the 1.5 GiB cap.

Disposition: accept the proposal for future MAINLINE-controlled cleanup only after MAINLINE accepts this canonical handoff and repeats containment/quiescence/retained-hash checks. No deletion occurred in this review.

## Final recommendation

`RETURN_NO_SCIENTIFIC_INFERENCE_WITH_NO_VALID_REVISION_ROUTE`.

MAINLINE should make no automatic scientific transition. In particular, do not register PASS, scientific STOP, resource blocker, reserve, Stage B, or revision consumption from r7 or this review. Preserve the packet and route the management/policy choice to the authorized control plane.
