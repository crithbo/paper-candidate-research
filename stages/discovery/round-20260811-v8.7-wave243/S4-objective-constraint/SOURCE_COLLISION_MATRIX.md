# Source / collision matrix

| family | current mechanism/collision | same-object outcome |
|---|---|---|
| Clang PCH/PCM | ASTReader lazily reads a serialized AST; modules use a DAG and global-ID mapping | potential record-order action is unclosed |
| Rust rmeta | compiler metadata reader/writer compatibility is object-defining | raw only; union not frozen |
| ICU `.dat` | `icupkg` alignment plus package/files/library/loading/cache modes | potential item scheduling is unclosed; modes cannot be conflated |
| Qt QML cache | qmlcachegen internal cache generator and matching runtime | raw only; union not frozen |
| Go export | current unified serialized graph with lazy decode/index | potential index/order action is unclosed |
| GNU MO | native string alignment/hash choices | already known configuration-form action; no new atomic action frozen |

The matrix makes no paper-absence claim. The documented current mechanisms are direct collision obligations; incomplete reader/writer unions are recorded as `UNFROZEN` rather than turned into a novelty assertion.

