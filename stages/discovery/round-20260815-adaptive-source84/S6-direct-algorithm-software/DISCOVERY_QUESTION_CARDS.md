# Discovery Question Cards

## QC-S84-01 — GNU patch inexact hunk location

- Exact anchor: GNU Diffutils 3.12 / GNU patch manual, 12 January 2025.
- Tentative object: fixed original text, patch hunks, flags and stock GNU patch outcome.
- Current native union: patch first predicts line-number plus prior offset, then scans forward/backward for exact context; with `--fuzz` / `-F`, it successively ignores outer context lines (default fuzz 2); failure yields a reject hunk. `-l` and POSIX modes are documented additional behavior controls.
- Same-object fatal: the official manual states results are guaranteed only when a patch is applied to an exact copy of its generating file. For an inexact original, multiple context locations can be legal under fuzz/offset but need not encode a unique intended post-image; a proposed “correct location” requires an external intended-target/oracle, changing the frozen object/guarantee.
- Minimum witness: repeated equal context at two offsets permits two fuzz-accepted hunk locations with distinct patched texts. Selecting one is generic approximate substring/edit matching and does not preserve a unique same-object outcome.
- Full-cost if defined: match/search CPU-RSS, hunk scan distance, reject rate, output/reject bytes and stock application equality. The endpoint fails before corpus acquisition.
- Disposition: `EXCLUDED_BEFORE_RAW__SAME_OBJECT_TARGET_OUTCOME_UNDERDETERMINED_PLUS_GENERIC_APPROXIMATE_HUNK_MATCHING_KERNEL`.

中文理由：精确原文件时没有 residual；不精确时官方只给 heuristic/fuzz，正确目标文本不由冻结输入唯一决定。引入 intended target 会换对象，未引入则只剩通用近似匹配，故 raw 前结构排除。
