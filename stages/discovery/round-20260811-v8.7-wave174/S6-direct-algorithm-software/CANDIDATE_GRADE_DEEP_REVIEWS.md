# Candidate-grade deep review

## ELF GNU hash / dynsym joint construction — NOT ADMITTED

### Current executable union frozen as far as source permits

| producer | complete relevant action | exposed/default controls and constraints | source-level result |
|---|---|---|---|
| LLVM lld ELF `main` snapshot | selects exported dynamic symbols; builds dynsym; if enabled, `GnuHashTableSection::addSymbols` partitions undefined then defined entries, computes GNU hash/residue, fixes `nBuckets=max(n/4,1)`, sorts by `(bucketIdx,strTabOffset)`, rewrites dynsym order, and serializes bloom/bucket/chain tables | `--hash-style=sysv|gnu|both`; GNU hash is created when `ctx.arg.gnuHash`; `--symbol-ordering-file` orders input sections, not documented as arbitrary dynsym/hash construction | direct source confirms a complete native constructor, not merely a flag surface |
| GNU ld/BFD official current-source mirror | records dynamic symbols and visibility/localization; creates `.dynsym`, `.dynstr`, version sections and `.gnu.hash` subject to `emit_gnu_hash`; BFD GNU-hash code computes bucket/renumbering output | `--hash-style=sysv|gnu|both`; default is configuration-dependent; export/version scripts and target backend behavior are relevant | source path identified but cannot be SHA-pinned/exhaustively enumerated in this run |
| glibc loader | GNU-hash bucket/chain lookup followed by version-aware symbol resolution | loader contract fixes name/version/binding behavior; no writer action | confirms same-object reader semantics |

### Six-dimension residual assessment

| dimension | finding |
|---|---|
| decision rule | A joint global constructor is describable, but lld already has a whole-output GNU-hash sort and fixed sizing rule. No certified union-external decision rule yet. |
| information | A prospective method could use the same exported symbol/version/relocation graph and an explicitly frozen lookup distribution; profile information would need equal availability to comparators. |
| complexity/resource | Potential N2 is nontrivial only if it provides an approximation/bound or scalable exact/FPT result for a stated legal assignment objective, not a hash-size or ordering sweep. |
| quality/guarantee | Must preserve native loader resolution for all imports/version queries and every relocation. This is a hard equality predicate, not a proxy. |
| full cost | Link CPU/RSS, output bytes, temporary memory, dynamic-loader CPU/RSS, and lookup latency must all be counted. |
| generalization/no-gain | A natural corpus must include versioned and non-versioned DSOs; no-gain is expected where exports are few, lookup is negligible, or the current fixed sizing/order is already Pareto-equal. |

### Finite 72-hour fidelity closure / killer

1. Obtain immutable SHA IDs for GNU binutils `master` and LLVM `main` through an authenticated official source endpoint; enumerate the lld files above plus GNU ld/BFD dynsym, GNU-hash, version-script, export, relocation and target-backend call paths.
2. Make a small public open-source DSO witness with two or more exported, versioned/default-visible symbols and an import relocation. Regenerate a legal candidate only after mapping every dependent index. Verify `readelf` dynamic tables and stock-loader symbol/version resolution against the same imports.
3. Compare the *entire* stock GNU ld/lld union under same available inputs and flags. Kill immediately if either upstream path already expresses the complete joint action, any reference cannot be updated without semantic change, or the contribution reduces to parameter selection/generic packing.

This is finite but is not complete today because immutable source pins and GNU ld's full current union are unavailable. It consequently cannot carry a Stage 0 brief.

