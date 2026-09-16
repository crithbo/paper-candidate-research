# Wave241 raw-screen row events

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE241-VERSIONAWARE-NATIVE-ARTIFACT-DELTA-JOINT-N2N3-BREADTH`; cutoff 2026-08-11.  Source-only review: no release artifacts were downloaded, built, decoded or benchmarked.

| event | unique official/versioned native family | fixed semantic object and possible joint action | disposition |
|---|---|---|---|
| RAW_SCREEN_ROW_EVENT | Linux flattened device tree (FDT/DTB) | fixed DTS tree/property semantics; jointly choose legal string-table/structure layout across versions before delta | CANDIDATE_GRADE_DEEP_REVIEW |
| RAW_SCREEN_ROW_EVENT | kmod `modules.dep.bin` / alias binary indexes | fixed module dependency/alias mapping; joint trie/index construction across module-set versions | CANDIDATE_GRADE_DEEP_REVIEW |
| RAW_SCREEN_ROW_EVENT | OpenJDK `lib/modules` jimage | fixed module/resource mapping and image reader semantics; joint resource-index/layout construction across JDK versions | CANDIDATE_GRADE_DEEP_REVIEW |
| RAW_SCREEN_ROW_EVENT | .NET ReadyToRun images | fixed managed metadata/native-code loading semantics; joint layout/action candidate | NOT_ADMITTED_UNFROZEN__BUILDER_AND_IDENTITY_UNCLOSED |
| RAW_SCREEN_ROW_EVENT | Linux ORC unwind tables | fixed instruction-pointer→unwind relation | DROP__SORTED_LOOKUP_LAYOUT_CONSTRAINT__NO_WHOLE_ACTION_WITNESS |
| RAW_SCREEN_ROW_EVENT | GNU ELF build-id note | fixed final ELF bytes and build-id observable | DROP__IDENTITY_OBSERVABLE__CHANGING_LAYOUT_ALTERS_BUILD_ID_OBJECT |

Excluded at screen: OCI, Debian Contents, kallsyms, BTF, ELF GNU hash, PDB/DWARF, Git/Rocks/SQLite and all active cross-lane objects.  Delta-only, cache/controller and generic-ILP variants are not families.
