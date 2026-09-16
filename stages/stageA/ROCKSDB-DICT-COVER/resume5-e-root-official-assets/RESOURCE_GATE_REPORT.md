# ROCKSDB-DICT-COVER resume5 official resource gate

## 中文摘要

- 结果：官方资源门已闭合，20 个冻结输入及 20 个 manifest 全部通过资源级验证。
- 这意味着什么：后续可以由 MAINLINE 验收并另行冻结 Stage A preclaim assignment；本次没有验证 RocksDB 机制或性能。
- 证据上限：`RESOURCE_VALIDATION_ONLY__NO_SCIENTIFIC_INFERENCE`。
- 用户动作：当前不需要；MAINLINE 仍需完成 downstream 接受、active-process、containment/reparse 与 cleanup 门。

## Decision

`RESOURCE_GATE_READY_FOR_MAINLINE_ACCEPTANCE_AND_SEPARATE_PRECLAIM_ASSIGNMENT`

- Assignment: `STAGEA-L2-20260825-ROCKSDB-DICT-COVER-RESUME5-E-ROOT-OFFICIAL-ASSETS`
- Topic: `ROCKSDB-DICT-COVER`
- Exact object: `FIXED_SORTED_KV_MANIFEST_TO_ONE_STANDARD_DICTIONARY_COMPRESSED_ROCKSDB_BLOCKBASEDTABLE_SST`
- Frozen converter SHA-256: `E93D8D7A7AB47B2A65751064F5114FCD9E919813F2A7F810123FDCAF7FD7E244`
- Resource root: `<LOCAL_PROJECT_ROOT>/stages/stageA/ROCKSDB-DICT-COVER/resume5-e-root-official-assets/resources`
- Resource root reparse count: `0`

## Official asset closure

- NVD annual feeds: `10/10` for 2015–2024.
- PyPI project JSON: `10/10` for boto3, botocore, django, pandas, numpy, scipy, tensorflow, torch, matplotlib, and scikit-learn.
- Total assets: `20/20 complete`.
- HTTP success: `20/20`.
- Content-Length equality when present: `20/20`.
- Full content SHA-256: `20/20`.
- NVD gzip full-stream CRC/JSON/schema/year identity: `10/10`.
- PyPI JSON/schema/project identity: `10/10`.
- Per-asset attempts: exactly `1`.
- Retries: `0`.
- Followed redirects: `0`.
- Full URLs, UTC times, response headers, bytes, and hashes: `RESOURCE_LEDGER.tsv`, `resources/logs/acquisition_summary.json`, and `resources/logs/expansion_acquisition_summary.json`.

## Converter and manifest closure

- Frozen converter byte-identical copy: `PASS`.
- Converter read smoke: `20/20 PASS`.
- NVD year identity: `PASS_2015_THROUGH_2024`.
- Final manifest count: `20/20`.
- Manifest format: frozen converter `KVMAN1`, little-endian length-prefixed sorted unique KV.
- Final closure: `resources/build/manifest_closure_final.json`, SHA-256 `673B96BB41B667111061E9DAB888C4AAF1E3017A28D1196ADD0B546BB3F38EEE`.
- Final validation: `resources/logs/final_validation_summary.json`, SHA-256 `9E1A7EAA27EA121D9D44E9B50F03B04ACA6643D7080CCBB6467DC8535F4CE465`.

The initial 12-asset run correctly exposed an 8-feed denominator gap. MAINLINE authorized the exact NVD 2015–2022 expansion without changing the object, converter, denominator, evidence ceiling, resource root, lifecycle, or one-attempt/no-retry rules. No unapproved source was used.

## Budget accounting

- Attempts: `20 / 20`; one per asset.
- Response-body network bytes: `151,659,365 / 1,073,741,824`.
- Largest response: NVD 2024, `24,982,076 / 134,217,728` bytes.
- Resource-root logical bytes: `213,840,717 / 4,294,967,296`.
- Measured primary-command process CPU: `71.578125 / 7200 seconds`.
- Measured primary-command wall time: `1717.376 seconds`.
- First network request to final validation elapsed time: `2295.275 / 14400 seconds`.
- Other short preflight, hashing, and reporting overhead was not exposed as one exact aggregate and is not estimated.
- GPU/exclusive device: none.
- System installation/global environment change: none.

## Scientific boundary

- Claim-bearing observation: `false`.
- PRE_CLAIM gate: not executed.
- RocksDB executed: `false`.
- Zstd executed: `false`.
- Candidate or comparator/baseline executed: `false`.
- SST created: `false`.
- Scientific revision consumed: `false`.
- Scientific PASS/STOP/RESERVE inference: `NONE`.
- State transition authority: `false`.
- Stage B authorized/executed: `false`.

Resource closure does not imply that ROCKSDB-DICT-COVER is scientifically supported. It only removes the frozen public-input blocker for a separate, future preclaim assignment.

## Lifecycle and cleanup

- Lifecycle mode: `PRODUCTION_NEW_ASSIGNMENTS_ONLY`.
- Inventory finalized with `56` persisted resource entries.
- Post-close budget: `1,610,612,736` bytes; current root is below budget before cleanup.
- Exact cleanup candidate leaves: `31`, totaling `83,835,585` bytes.
- Candidate classes: one temp marker; ten reacquirable PyPI JSON responses after accepted handoff; twenty manifest source copies only after downstream accepts exact paths/hashes.
- NVD compressed responses, audit logs, final closure, frozen converter, and helper sources remain retained by the owner proposal.
- Cleanup owner: `MAINLINE`; owner performed no deletion.
- MAINLINE must independently pass downstream acceptance, literal containment, reparse, active-process, and receipt gates before deletion.
