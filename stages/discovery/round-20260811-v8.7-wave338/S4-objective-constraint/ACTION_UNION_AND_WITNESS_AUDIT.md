# Action-union and witness audit

## Tree-sitter exact contract

- **Same-object guarantee:** same grammar language, same runtime ABI, same source input, and same stock runtime concrete syntax tree/error behavior.
- **Strong union:** default generation plus ABI choice, structured grammar regeneration, conflict handling, compatible-state merging (including the documented `--disable-optimization` complement), external scanner, runtime input encoding, and incremental old-tree/edit paths.
- **Required witness:** two generated parser artifacts for the same pinned grammar that both compile and are accepted by the unmodified runtime, return identical trees/errors for the frozen corpus and edits, yet differ through a whole generator action outside the union.
- **Target-specific mechanism threshold:** a new parser-state construction must specify its state/complexity and a tree/error preservation guarantee; generic table packing, a generator flag, cache/policy selection, or changed error recovery fails.
- **Finding:** current documentation positively identifies compatible-state merge as the relevant generator optimization. This review did not close a distinct legal whole action beyond that union. `NOT_ADMITTED_UNFROZEN`.

## ext4 exact contract

- **Same-object guarantee:** identical directory names/inodes and filesystem feature semantics, accepted by the matching stock ext4 reader/readdir/lookup behavior; no reader, hash-policy, or observable directory semantics change.
- **Strong union:** linear and HTree representations, legal hash modes, legal HTree depth/checksum layouts, mkfs feature choices, and e2fsck automatic/`-D` re-index/sort/compress/rebuild routes.
- **Required witness:** two images for the identical directory tree that stock ext4 accepts and whose lookup/readdir outputs match, where the changed complete construction cannot be replayed by any legal current HTree/hash/e2fsck/mkfs action.
- **Target-specific mechanism threshold:** the mechanism must be an ext4-format-aware construction algorithm with a stated compatibility/complexity guarantee, not generic B-tree packing, a hash/feature toggle, or an emitter patch.
- **Finding:** documentation establishes that the visible cost/lookup choices are already current format or directory-optimization paths. A complete union-external native action has not been frozen. `NOT_ADMITTED_UNFROZEN`.
