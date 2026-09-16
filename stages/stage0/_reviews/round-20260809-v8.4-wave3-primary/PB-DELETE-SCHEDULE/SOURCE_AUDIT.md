# PB-DELETE-SCHEDULE source / collision audit

## Frozen-input verification

| Artifact | SHA-256 | Result |
|---|---|---|
| `TOPIC_BRIEF_PB-DELETE-SCHEDULE.md` | `633291801204CD813728331051BFBA1E2FCDF6159A81FCD89471FEBAE81F734A` | matches upstream manifest |
| `SOURCE_COLLISION_MATRIX.md` | `8847E6342BDD9DE3BFB5E0DE2DB9F87083E47F7F2D766618A2EF2BA1ADBA96F3` | matches |
| `DISCOVERY_LOG.md` | `3A16C5660995789A9B34D8F6821EBCAD610995D6F8ED5AC5423350C6CFD474A6` | matches |
| `handoff.yaml` | `0B2A06DA6B25972213C352B9463669711D010BCA1882C7CF5D18FD5A7990DFED` | matches |

## Primary/upstream verification through 2026-08-09

| Source | Verified fact | Treatment |
|---|---|---|
| [Certified MaxSAT Preprocessing, IJCAR 2024](https://link.springer.com/chapter/10.1007/978-3-031-63498-7_24) | WCNF preprocessing can produce VeriPB/CakePB end-to-end equioptimal proof; core deletion requires rederivation from remaining core | `DIRECT_SUBTRACT` for certified preprocessing/rule use; trace-order construction baseline |
| [VeriPB proof-format overview](https://gitlab.com/MIAOresearch/software/VeriPB/blob/HEAD/proof_format_overview.md) | checked deletion preserves stronger guarantees; multiple deletions are checked in their stated order | direct subtractor for syntax/checker; also confirms order is semantically relevant |
| [VeriPB releases](https://gitlab.com/MIAOresearch/software/VeriPB/-/releases) | current 3.0.2 release, format v2/v3 support and checking changes | pin/re-audit target, not candidate result |
| [PB Competition 2025 rules](https://www.cril.univ-artois.fr/PB25/) | unchecked deletion is optionally available for speed; checked mode requires justification | weaker-guarantee reference only, not equal-quality baseline |
| [Redundancy Rules for MaxSAT, SAT 2025](https://drops.dagstuhl.de/storage/00lipics/lipics-vol341-sat2025/html/LIPIcs.SAT.2025.7/LIPIcs.SAT.2025.7.html) | extends efficiently certifiable redundancy rules | methodological adjacent / rule-level prior, not schedule construction |

## Collision verdict

`SEARCH_BOUNDED_OPEN_WITH_DIRECT_RULE_AND_CHECKER_SUBTRACTORS`。没有同一 exact object、目标、method、guarantee/result、cost 和主 claim 六项全覆盖的 `DIRECT_FATAL`。candidate 不可重述为 “checked deletion/VeriPB/MaxPre 已有”；唯一可审 residual 是在**固定 natural trace**上用同一 checked-deletion obligations 的合法调度/批处理构造来获得 full-cost Pareto。泛用 proof trimming、DRAT deletion、PBLean import 或 unchecked mode 都不能作为同质量的 universal union。

## Evidence honesty

未下载 corpus、未运行 MaxPre/VeriPB/CakePB、未生成 trace/graph、未测试算法。公开资源的存在只说明有限路线，不能被写成当前 occurrence 或性能事实。
