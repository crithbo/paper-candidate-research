# Discovery Question Cards

## QC-S80-01 — Git same-tree hunk/edit-script construction

### Identity and same-object contract

- Exact public identity: current Git `git-diff` manual (latest rendered 2.55.0) and `git/git` `master:diff.c`, checked 2026-08-15.
- Carrier: a public versioned Git repository history; fixed ordered pre/post source trees, file paths/modes, and line content.
- Same-object endpoint: stock Git patch/hunk presentation for the same tree comparison. The RQ does not change tree semantics, applyability contract, or compare a merge directory endpoint.
- Contribution hypothesis: `METHOD_ALGORITHM`, N2; target-native edit-script/hunk construction.
- Network-security check: `PASS`.

### Identity preflight

See `GLOBAL_IDENTITY_PREFLIGHT.yaml`. The Git diffcore rename/copy pairing review is `RELATED_ONLY`: its file-pair action and rename-label endpoint differ from this within-file hunk action and patch endpoint. This relation does not exclude the RQ and does not establish newness.

### Current source and contrary reality check

- Official current `git-diff` documents `--indent-heuristic` (default), `--minimal`, patience, histogram, anchored, and `--diff-algorithm={patience|minimal|histogram|myers}`. It says the basic greedy Myers algorithm is the default and that minimal spends additional time to produce the smallest possible diff.
- The same manual says `--word-diff` takes the line-by-line diff and computes intra-hunk changes; it also exposes context and inter-hunk presentation controls.
- Current upstream `diff.c` declares `diff_algorithm`, has `diff_indent_heuristic = 1`, and parses `diff.algorithm` and `diff.renamelimit`; it thereby corroborates official default and non-default configuration dispatch.
- Strongest skeptic / contrary kernel: fixed-input hunk partition and edit-script minimization is the generic edit-distance/LCS/sequence-alignment problem. The proposed review-stability endpoint has no source-supported Git-specific invariant that separates it from presentation choice or generic segmentation.

### Minimum witness and decisive falsifier

- Candidate witness: two equal-content source-file versions with repeated lines admit two legal Myers-compatible hunk partitions; one can move a boundary without changing source-tree semantics.
- Why it does not survive raw: this merely witnesses ordinary edit-script non-uniqueness. `--minimal` and the documented alternative algorithms already span the native policy choices, and any additional boundary preference is an ordinary objective/tie-breaker unless a Git-specific semantic guarantee is supplied.
- Decisive falsifier: if the candidate cannot name a Git-specific invariant beyond generic edit-script cost or visual presentation, it must not be treated as an S6 opportunity. This falsifier is already met.

### Full-cost and finite route

- Relevant costs would be diff CPU, peak memory, output bytes/hunk count, patch review latency, and stock patch/application compatibility.
- A natural route would be versioned public Git histories with stock `git diff` and patch consumers. No corpus is acquired because the card fails before raw; that is not a resource inference.

### Disposition

`EXCLUDED_BEFORE_RAW__CURRENT_GIT_DIFF_ALGORITHM_UNION_PLUS_GENERIC_EDIT_SCRIPT_HUNK_SEGMENTATION_KERNEL`.

Reason in Chinese: 当前 Git 已有默认/最小化/耐心/histogram/anchored/indent heuristic 的算法与配置入口；剩余“更稳定 hunk”没有可核验的 Git 专属语义或保证，只是通用 edit-script 分段与展示目标。未因实现、结果、资源或 AI readiness 排除。
