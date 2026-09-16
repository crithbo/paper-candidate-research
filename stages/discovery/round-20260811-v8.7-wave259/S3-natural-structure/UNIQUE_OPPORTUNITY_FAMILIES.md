# UNIQUE_OPPORTUNITY_FAMILIES

## De-duplication and scope

The registry and current plan were read at the dispatch freeze. KALLSYMS, OpenJDK jimage, FDT/DTB, kmod binary index, Linux ORC, GNU build-id, OCI, Debian Contents, RocksDB and active cross-lane objects were excluded before screening. The six rows below are distinct native artifact families, not renamed versions of those objects.

| Family | Exact same-object boundary | Natural carrier / acquisition and hash route | Minimal action-divergence witness | Result |
|---|---|---|---|---|
| RPM | One RPM with fixed lead, signature/header tags, payload and verification policy | Official repository metadata selects adjacent release RPM URLs; record repomd checksum plus package SHA-256 | Reorder payload entries and recompute compression changes signed header/payload digest; re-signing is an identity-changing production act. | `DROP` |
| APEX | One installable signed APEX: manifest, APK container, payload image and signatures | AOSP release tag plus published APEX artifact SHA-256 | Reorder payload/image contents and regenerate signatures; no stock-reader-equivalent action while holding signed bytes/identity fixed. | `DROP` |
| DEX | One `classes.dex` with fixed class definitions, code items, annotations and ART/DexFile resolution semantics | Pin AOSP tag, build fingerprint and downloadable small APK/dex SHA-256; no download in Discovery | Two format-valid encodings differing only in ID/class-data/data-section order, with all references/offsets repaired and same resolved classes/methods. | `UNFROZEN` |
| Rust rmeta | One crate metadata artifact readable by the same pinned rustc metadata decoder | Pin official rustc release/tag, crate source revision, invocation, emitted artifact SHA-256 | Two encodings of the same metadata graph differing in lazy-table placement while preserving decoder results. | `UNFROZEN` |
| CPython pyc | One hash-based cache for fixed source hash, interpreter magic and imported module behavior | Pin CPython tag, source SHA-256, `py_compile` invocation and cache SHA-256 | Candidate reordering changes marshal references/code layout; official interface supplies no separate legal constructor. | `DROP` |
| Signed .ko | One loadable signed kernel module under fixed kernel key/config policy | Pin Linux tag, config and module/System.map SHA-256 | Any section arrangement altered after signing invalidates the whole-module signature. | `DROP` |

R3 and R4 have a finite possible fidelity route, but absence of the required union closure is an admission failure, not negative experimental evidence.
