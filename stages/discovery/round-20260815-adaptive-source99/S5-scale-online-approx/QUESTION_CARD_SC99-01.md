# DISCOVERY_QUESTION_CARD — SC99-01

- Exact identity: OPENJDK_CDS_EXACT_SHARED_ARCHIVE__BOUNDED_RECOURSE_DYNAMIC_DELTA_CONSTRUCTOR.
- Anchor/current source: Oracle Java SE 24 `java` command and Java SE 23 CDS documentation; OpenJDK JEP 350, accessed 2026-08-15.
- Carrier: IMPLEMENTATION_CARRIER_ONLY; a public versioned Java application classpath history is bounded later debt.
- Same-object contract: fixed JVM/application class path, class-loading and archive acceptance semantics, static-base compatibility, and stock shared archive load behavior.
- Problem: CDS saves startup/memory via a mapped archive, but current static or dynamic dump materializes an archive for the loaded-class set. Dynamic archives are top layers dependent on base archive compatibility.
- Proposed insight: a target-native archive delta constructor could preserve stock accepted class metadata/loading semantics while bounding rewrite/recourse under classpath evolution; this is not an archive-trigger policy or generic file diff.
- Contribution: METHOD_ALGORITHM/N2. Endpoint: exact archive-construction action plus a bounded recourse/space/time guarantee.
- Current union: static dump; dynamic archive at application exit; `jcmd VM.cds static_dump/dynamic_dump`; one static plus one dynamic archive layer; `SharedArchiveFile`; `Xshare`; `AutoCreateSharedArchive`; base compatibility recorded/checked.
- Strongest objection: dynamic top-layer archive and current dump commands may already subsume any legal delta, or archive validity may require whole-set reconstruction.
- Full-cost: archive write/CPU, class metadata copied, transient buffer/RSS, archive bytes, classpath/base compatibility checks, runtime load/startup cost, and failed-archive fallback behavior.
- Minimum falsifier: official current HotSpot source shows an incremental reuse/delta action with the same archive acceptance contract, or an exact delta necessarily changes validity/class-loading semantics.

| Debt | Status | Finite route |
|---|---|---|
| Complete source/flag union | OPEN_BOUNDED | One official OpenJDK release tag: CDS dump/write paths and all dynamic/static/archive flags. |
| Small oracle witness | OPEN_BOUNDED | Two archive versions with a fixed classpath update and stock `SharedArchiveFile` acceptance/oracle. |
| Collision/genealogy | OPEN_BOUNDED | One bounded primary current/paper route. |
| Natural carrier | OPEN_BOUNDED | Public versioned Java classpath/project history. |

- Identity preflight: no exact terminal/direct match found in the allowed registry surface; no-match is not novelty evidence.
- RAW_REQUIRED audit: COMPLETE. Disposition: EVIDENCE_QUALIFIED_RAW.
- Claim ceiling: raw hypothesis only; no novelty, absence, correctness, improvement, Q2, or Stage0 claim.
