# Stock-legal action-gap audit

## Candidate action class tested at discovery level

The only identified same-object candidate class was: construct an ext4 HTree for the identical directory tree by choosing legal hash/index feature settings and legal leaf/node split/rebalance/layout decisions, seeking a size × construction/repair cost × lookup/readdir-tail tradeoff while retaining stock reader behavior.

## Subtraction against the strongest current union

| Putative novelty | Current union member | Result |
|---|---|---|
| Enable/change HTree indexing | `dir_index` feature / native ext4 HTree format | Absorbed. |
| Select a legal directory hash | `hash_alg` defaults and configuration; documented legal hash versions | Absorbed. |
| Change legal HTree depth/root/interior/leaf representation | Current on-disk format’s legal depth, maps, collision and checksum rules | Not a new action without a distinct whole construction guarantee. |
| Re-index/rebalance/sort/compact directory entries | e2fsck automatic optimization/rebuild and `e2fsck -D` | Absorbed. |
| Change writer I/O/cache behavior | mke2fs configuration/direct-I/O construction path | Policy/cost setting, not an HTree constructor. |
| Generic B-tree packing or an emitter-only patch | Does not supply an ext4-specific state/compatibility/complexity theorem beyond legal current formatting | Not admissible as N2. |

## Result

No stock-legal same-object target-specific whole action remains after this subtraction. A new proposal would either replay index/hash/rebuild choices already available in the fair union, alter reader or directory semantics, or collapse to generic packing/emission. Therefore no conditional `PROPOSE_STAGE0` is justified.

This refutes the frozen visible action class, not the unmeasured natural-regime hypothesis. It makes no claim that no future ext4 research question can exist.
