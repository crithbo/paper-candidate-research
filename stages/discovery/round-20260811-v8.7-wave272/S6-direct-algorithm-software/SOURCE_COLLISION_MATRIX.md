# Source and collision matrix

| Source | Evidence / limitation |
|---|---|
| [LLVM source tree](https://github.com/llvm/llvm-project) | Authoritative current source location, requiring a later commit-level BackgroundIndex/FileIndex/serialization audit. |
| [clangd project](https://github.com/clangd/clangd) | Official project context for clangd. |
| [clangd shard-storage discussion](https://github.com/clangd/clangd/issues/184) | Project-maintainer statement that background shards are stored next to the compilation database; an issue is a locator, not gap evidence. |

Direct source-index/shard construction collision remains unclosed. This matrix intentionally records no implementation-absence claim.
