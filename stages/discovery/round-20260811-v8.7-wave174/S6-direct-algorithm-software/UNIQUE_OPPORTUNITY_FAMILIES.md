# Unique opportunity families

## ELF-GNU-hash-dynsym-joint-constructor

**Exact object.** A shared ELF object with the identical exported/imported symbol names, `st_info` binding/type, visibility, symbol-version definitions/needs, relocation targets/types and loader-visible resolution outcomes. Internal legal `.dynsym` indices may change only together with all dependent relocation, version and hash references. The stock ELF dynamic loader remains the reader/oracle.

**Candidate complete action (only a hypothesis).** Jointly choose a legal dynamic-symbol permutation, GNU-hash bucket count, bloom/filter geometry and bucket-contiguous chain layout, then rewrite `.dynsym`, `.gnu.hash`, `DT_GNU_HASH`, version-index tables and each index-bearing relocation/reference. Its intended N2 form would be a profile-robust, globally costed constructor with a stated bound/approximation for a lookup-plus-file-cost objective.

**Minimal legal action witness.** Let two exported, same-version, default-visible symbols have different GNU hash residues under a chosen legal bucket count. Swapping their dynsym positions alone is not sufficient: a legal witness must regenerate hash bucket starts/chains and rewrite every dynsym-index-bearing reference. The ELF/GNU-hash format permits such a regenerated representation; this establishes format legality, not an action gap or performance claim.

**Disposition.** `NOT_ADMITTED_UNFROZEN__CURRENT_GNU_LD_AND_LLD_COMPLETE_JOINT_WRITER_UNION_NOT_SHA_PINNED_AND_NOT_EXHAUSTIVELY_ENUMERATED`. The current lld source already embodies one complete global constructor, including a deterministic GNU-hash ordering. The accessible evidence did not pin both upstream commits nor exhaust GNU ld target/backend, version-script, export/visibility, relocation and default/nondefault action paths. Therefore this lane cannot honestly certify that the hypothesized constructor is outside the strongest current union.

