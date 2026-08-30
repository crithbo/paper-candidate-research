# Unique opportunity family

## ELF GNU hash plus dynamic-symbol joint constructor

**Exact same object.** One shared object with the same externally exported name/version/binding/visibility set, the same relocation resolutions and the same stock glibc dynamic-loader result. `.dynsym` entries may be legally permuted only if all affected symbol indices, version records and relocation references are updated; the exported interface cannot change.

**Native semantics.** GNU hash couples `symoffset`, bloom filter size/shift, bucket start indices and chain entries to the second part of `.dynsym`. Current glibc uses bucket/chain state in dynamic lookup and applies version-aware resolution. This makes a genuine joint construction conceivable, not merely a byte codec.

**Small legal witness.** Let two internal eligible dynamic symbols have different GNU hashes and no API-order constraint. Swapping their eligible `.dynsym` positions while consistently updating the corresponding chain/bucket and index consumers can produce another loader-equivalent file. This establishes legal multiplicity but not an action gap: it does not show that either current linker lacks the action or that a full constructor has a nontrivial guarantee.

**Outcome.** `NOT_ADMITTED_UNFROZEN__COMPLETE_CURRENT_LLD_GNU_LD_JOINT_CONSTRUCTOR_UNION_NOT_SOURCE_CLOSED`. No brief is created. The status is not an absence claim and not a resource/readiness decision.
