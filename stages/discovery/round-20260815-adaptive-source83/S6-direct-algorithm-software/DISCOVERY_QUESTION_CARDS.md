# Discovery Question Cards

## QC-S83-01 — GNU grep matcher-state construction

- Exact identity: GNU grep 3.12 manual, last official manual update 2025; fixed pattern, input bytes, locale/options and stock match/line output semantics.
- Current union: official manual covers BRE, ERE, fixed-string and optional PCRE modes; it states grep operates partly via efficiency-oriented automata and partly via a slower matcher for unusual features such as back-references.
- Minimal legal divergence: two automata-state encodings can recognize the same regular language and output the same matching lines. This is a generic DFA/NFA/regex-engine representation choice, not an identified GNU grep target-specific action.
- Falsifier met: no source-supported GNU-specific invariant/guarantee beyond generic automata time-space tradeoff; mode selection, locale and PCRE availability are native semantics/configuration, not a residual algorithm.
- Full cost if viable: compile/matcher CPU/RSS, scanning throughput/latency, bytes/state memory, fallback behavior and stock output equality. No carrier is acquired because the card fails before raw.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_GNU_GREP_AUTOMATA_FALLBACK_UNION_PLUS_GENERIC_REGEX_ENGINE_STATE_KERNEL`.

中文理由：GNU grep 已有自动机快路径和异常特征慢匹配路径及语义模式入口；等价 state encoding 是通用 regex-engine 问题，未见 GNU grep 专属保证，故 raw 前排除。不是资源、实现或结果原因。
