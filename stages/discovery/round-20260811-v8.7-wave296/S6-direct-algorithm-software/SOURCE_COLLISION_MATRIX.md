# Source and collision matrix

| first-party source | role | result |
|---|---|---|
| [ripgrep upstream](https://github.com/BurntSushi/ripgrep) | Current public engine/features, PCRE2/auto controls, Unicode/mmap/incremental/parallel behavior. | Strong partial executable union. |
| [ripgrep FAQ](https://github.com/BurntSushi/ripgrep/blob/master/FAQ.md) | Finite-state semantics, PCRE2 boundary and mmap/multiline implications. | Same-object and fallback constraints. |
| [RE2 upstream](https://github.com/google/re2) | Same-information strong baseline with linear match-time and memory budget. | Required subtractor. |
| [Hyperscan upstream](https://github.com/intel/hyperscan) | Hybrid-automata strong baseline for many regex/stream matching. | Required subtractor. |
| Primary current regex-automata papers/artifacts | Direct collision closure. | Not closed; no novelty conclusion. |

All affirmative technology sources are official project sources.
