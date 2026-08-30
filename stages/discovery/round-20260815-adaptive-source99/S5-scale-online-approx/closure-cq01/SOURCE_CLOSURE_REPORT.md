# Source closure — OpenJDK CDS

## Scope and disposition

Assignment: `SOURCE-CLOSURE-RESUME-BATCH02-ITEM01-SOURCE99-S5-OPENJDK-CDS-V1`.

Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.

This is a source-closure result only.  It makes no clean-brief, novelty, Q2, candidate, PASS, STOP, or stage-state decision.

The parent’s original direct-locus omission was a mechanical routing blocker, not scientific evidence.  Mainline’s frozen route addendum supplied the two precise directory routes; this continuation preserved the parent assignment, pin, object, and 10-call/48-MiB envelope.

## Fixed identity and acquisition

- Project/version/pin: `openjdk/jdk`, `jdk-24+36`, `6705a9255d28f351950e7fbca9d05e73942a4e27`.
- Exact endpoint retained: fixed JVM CDS archive acceptance and stock class-loading semantics under one fixed classpath update.
- Ten official, pinned requests completed; retained payload is 501,073 bytes, below the 50,331,648-byte cap.  The monotonic ledger is [acquisition-attempt-ledger.yaml](resources/logs/acquisition-attempt-ledger.yaml).
- No clone, build, Java execution, archive dump, benchmark, external search, or substitute route was used.

## Current-source closure

The pinned union is materially stronger than a simple archive-writing baseline:

- `cdsConfig.cpp` owns `SharedArchiveFile`, `ArchiveClassesAtExit`, `RecordDynamicDumpInfo`, and `AutoCreateSharedArchive`.  It explicitly permits one base and one top archive, defines their path interpretation, and rejects incompatible option combinations (lines 152–245 and 459–478 of retained `07-cdsConfig.cpp`).
- `dynamicArchive.cpp` implements the dynamic-dump builder, initializes a dynamic `FileMapInfo` with the current base archive, and validates the recorded base/header/regions; its comments enumerate `SharedArchiveFile` failures and the no-compatible-default-archive case (lines 209–230, 477–556 of `05-dynamicArchive.cpp`).
- `archiveBuilder.cpp` serializes a dynamic archive and documents `-XX:ArchiveClassesAtExit=...` as a dynamic-dump route (lines 994–1009 and 1144–1155 of `04-archiveBuilder.cpp`).
- `filemap.cpp` supplies acceptance-side classpath/header/CRC/base-name checks and maps failure to archive-loading failure or disabled shared spaces (lines 407–459, 811–1070, 1196–1315 of `06-filemap.cpp`).
- The deterministic in-tree witness `SharedArchiveFile.java` creates an archive then uses it through stock `CDSTestUtils`, preserving the stock reader/acceptance contract.

These sources expose two stock-legal complete plans for the frozen carrier: a base-only/static `SharedArchiveFile` use plan and a base-plus-dynamic/top-archive plan, with acceptance/fallback checks.  They also expose automatic archive creation as a current configuration action when the named shared archive is missing.

## What remains unresolved

The bounded packet does **not** define a particular union-external archive-delta action, its information boundary, recourse bound, or a finite formal guarantee.  It therefore cannot establish whether a proposed bounded-recourse constructor is merely a cache/archive controller already represented by the current union, or a distinct legal action with a non-generic guarantee.  Treating source non-observation as absence is prohibited; conversely, the existing dynamic/base-top/automatic-creation actions cannot alone prove complete absorption of an unspecified stronger action.

The direct current subtractor is thus frozen as: stock static and dynamic archive construction, base/top layering, automatic archive creation, compatibility validation, and failure/fallback.  Any later candidate-grade review must map every proposed action and guarantee against that union under the same archive acceptance/class-loading endpoint.

## Finite falsifier and full-cost ledger

If a successor defines a candidate action, its earliest falsifier is a fixed-classpath-update pair for which the candidate’s legal archive plan cannot be represented by the stock base/top/dynamic/auto-create action catalog while preserving stock acceptance and fallback.  Full cost must include archive-write CPU, metadata copy, transient RSS, archive bytes, compatibility checks, startup-load cost, and fallback cost.  No performance or correctness result was observed here.
