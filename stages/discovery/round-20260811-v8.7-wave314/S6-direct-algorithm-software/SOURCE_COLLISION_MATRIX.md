# Source / collision matrix

| deep family | first-party seed | current-closure finding | decision |
|---|---|---|---|
| Redis `rax` | [Redis releases](https://github.com/redis/redis/releases) | reported optimisation is a local rax path; no independent global constructor frozen | DROP |
| Redis expiry | [Redis releases](https://github.com/redis/redis/releases) | reported overhead fix maps to expiry scheduling/operations | DROP |
| LLVM X86 | [LLVM upstream](https://github.com/llvm/llvm-project) | missed-optimisation item is only a lead; global union/collision incomplete | UNFROZEN |
| Arrow-RS | [Arrow-RS upstream](https://github.com/apache/arrow-rs) | kernel performance PRs are only leads; planner/kernel union incomplete | UNFROZEN |

Official current/recent releases, source repositories and upstream PR surfaces supplied the leads. No issue/PR/release note is used as proof of a current absence or research gap.

