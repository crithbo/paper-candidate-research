# LLVM-PPC-PREFIX-PRESSURE-PARETODP User Blocker Packet

## 中文摘要

- 卡在哪里：LLVM-MinGW 官方 GitHub release URL 返回 302，而 frozen control 禁止跟随任何 redirect。
- 已经完成什么：long-path preflight、exact commit metadata 与 source archive 单次下载/哈希。
- 最小解阻动作：MAINLINE/用户在新 immutable resume 中冻结一个官方 redirect-compatible route（例如只允许 GitHub 到 `release-assets.githubusercontent.com` 的单一链），或提供 exact LLVM-MinGW 20260616 asset 与 manifest。
- 解阻后第一步：重新验证 retained commit/source inputs，并只对未闭合资产使用新合同；不得覆盖 r1。
- 科学负结论：无。

- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `OFFICIAL_ASSET_TRANSPORT_REDIRECT_POLICY`
- Exact failure: HTTP 302 for `llvm-mingw-20260616-ucrt-x86_64.zip`; redirect observed, not followed.
- Claim-bearing observation obtained before failure: no
- Scientific inference allowed: none
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: no
- Immutable failure directory: `stages/stageA/LLVM-PPC-PREFIX-PRESSURE-PARETODP/r1`

## Exact resource needed

- LLVM-MinGW version: 20260616 UCRT x86_64.
- Frozen request URL: `https://github.com/mstorsjo/llvm-mingw/releases/download/20260616/llvm-mingw-20260616-ucrt-x86_64.zip`.
- Observed official redirect host: `release-assets.githubusercontent.com`.
- Required future controls: exact redirect host/path policy, one new attempt, response byte cap 268,435,456, SHA-256, included notices, and new immutable resume directory.
- Remaining unattempted assets: exact CMake 4.4.2 and Ninja 1.13.0 PyPI wheels.

## Retained completed inputs

- Exact commit metadata: 6,641 bytes, SHA-256 `E64F34464C58A1356359629FBBE629E40975B494A009AED5821CF0CDF7923492`.
- Exact source archive: 280,166,423 bytes, SHA-256 `C7871896611513E3E850818A7E5C6B0C600BE60BA46260105602EB9BFBD651CF`.

## Work and cost

- Network attempts: 3/5; retries: 0.
- Persisted response bytes: 280,173,064.
- Resource root at closeout: 281,845,866 bytes.
- Exact CPU time: unavailable; not estimated.
- Not executed: safe archive preflight, extraction, configure, build, package, smoke, PPC F1–F5, natural/performance/full-cost/claim run, cleanup.

