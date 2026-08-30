# Source60 ordinary current-source screen

## Frozen primary sources

| Role | First-party source | Current result |
|---|---|---|
| ANCHOR/CURRENT | https://docs.oracle.com/en/java/javase/24/docs/specs/man/java.html | AppCDS supports a static plus dynamic archive pair; `-XX:SharedArchiveFile` specifies the pair; dynamic archives are created with `-XX:ArchiveClassesAtExit`. |
| CURRENT/CONTRARY | https://docs.oracle.com/en/java/javase/23/vm/class-data-sharing.html | CDS is enabled by default where available; dynamic archive creation, regeneration, `-Xshare`, `-XX:+AutoCreateSharedArchive`, and compatibility conditions are documented. |
| design subtractor | https://openjdk.org/jeps/350 | The target dynamic archive is a top layer on a base archive; metadata copying/relocation occurs before exit and the top layer is disabled if base CRC dependencies mismatch. |
| current source locus | https://github.com/openjdk/jdk/blob/master/src/hotspot/share/runtime/java.cpp | Current OpenJDK source includes the dynamic-archive implementation interface. |

No source was downloaded or persisted. Network response bytes and timing are unavailable in this runtime and are not estimated.

## Current-union and action result

The official current union already includes: default/static CDS, a user-selected base plus dynamic archive pair, dynamic dump at exit, auto-create behavior, archive validation, and regeneration when the JDK changes. The reader accepts at most the static-plus-dynamic pair described by the Java command documentation. A proposed extra archive tier therefore changes reader-visible representation/acceptance; a proposal that keeps that pair merely chooses when or how to regenerate existing stock archive actions. No source-supported target-specific atomic construction remains.

## Canonical abstention

S60-RQ-01 is LOCATOR_ONLY, not evidence-qualified raw. Its first hard failure is the absence of a union-external same-reader atomic action, not missing implementation or evidence. This is a bounded admission result only; it does not assert that no future same-object construction can exist.
