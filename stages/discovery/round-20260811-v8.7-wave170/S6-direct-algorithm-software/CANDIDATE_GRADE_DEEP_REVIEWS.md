# Candidate-grade deep review

## ELF GNU hash / `.dynsym` joint construction — NOT_ADMITTED_UNFROZEN

### Same-object contract and oracle

Freeze every exported symbol's name, version definition/requirement, binding, visibility and resolution target, along with all relocation semantics. The stock oracle is ELF dynamic loading plus `readelf`/loader inspection of dynamic symbols, GNU hash and version tables. A natural carrier is a version-pinned open-source shared-library build; Stage A would record source/toolchain/DSO hashes before running. No artifact was downloaded here.

### Current format and loader reality

The GNU-hash format has a header containing bucket count, `symoffset`, bloom word count and bloom shift; then bloom words, buckets and chain entries. Each chain entry corresponds to the eligible `.dynsym` suffix. Current glibc lookup source takes the GNU hash branch, locates a bucket/chain starting at the associated symbol-table index, and participates in version-aware lookup. The dynamic loader is therefore the same reader contract, not a synthetic hash benchmark.

### Current producer/configuration union

GNU ld officially exposes `.hash`/`.gnu.hash` selection via `--hash-style=sysv|gnu|both`; current lld is a GNU-linker-compatible implementation. This freezes the standard format family, but it does **not** close the needed strongest action union: this pass has not source-pinned current lld and GNU ld algorithms and all defaults/non-defaults for eligible dynsym ordering, `symoffset`, bucket count, bloom-size/shift selection, chain construction, versioning and relocation-index updates. A legal format alternative cannot be equated with a current implementation absence.

### Minimal action-divergence witness

For two eligible internal symbols with hashes `h1,h2`, two legal `.dynsym` suffix orders may be possible if every index consumer is updated. Their bucket/chain entries and bloom bits then change while loader resolution does not. This is only a **legality witness**. It has no named union-external complete N2, no guaranteed improvement, and no evidence that either executable producer union fails to express one ordering/construction. Treating a preferred bucket load as a generic hash-tuning objective would violate the assignment.

### Finite fidelity closure and killer

Within 72 hours, pin exact GNU binutils and LLVM commits; enumerate `--hash-style`, export/version scripts, dynamic-list, relocation/index writer paths, defaults and undocumented relevant knobs; construct a two-symbol public DSO witness; use loader/readelf to verify the complete export/version/relocation digest. Stop the line if (a) either current union expresses the action, (b) action changes any export/version/binding/relocation meaning, (c) the mechanism is only hash parameter tuning/order postprocessing, or (d) no nontrivial algorithm/guarantee survives.

A valid full-cost ledger would include link CPU/wall/RSS, loader CPU/wall/RSS, lookup/startup latency, `.dynsym`/`.gnu.hash`/version/relocation bytes and temporary storage. It must report all dimensions together. This plan was not executed.

### Decision

`NOT_ADMITTED_UNFROZEN__COMPLETE_CURRENT_LLD_GNU_LD_JOINT_CONSTRUCTOR_UNION_NOT_SOURCE_CLOSED`. There is a finite source-and-witness closure route, but not yet a grounded Q2 constructor or brief.
