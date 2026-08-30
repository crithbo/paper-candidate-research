# Source73 question cards

## S73-CARD-01 — AArch64 MOPS copy lowering

- Identity: GCC current AArch64 target and a fixed ABI-preserving source-level `memcpy`/`memmove`/`memset` call; carrier is `IMPLEMENTATION_CARRIER_ONLY`.
- RQ/endpoint: target-native whole-copy lowering; initial cost boundary would have been compile time, emitted code size, copy time, and any out-of-line call cost.
- Current locus: GCC's current AArch64 manual states that `+mops` accelerates these memory operations and is enabled by `-march=armv8.8-a`; `-mcpu`/`-march`/`-mtune` form a documented target/config surface.
- Minimum falsifier: if the only intervention is choosing feature, tuning, inline form, or library call, it is a flag/cost-model policy rather than a non-separable N2 construction.
- RAW_REQUIRED audit: `INCOMPLETE` — no source-supported target-specific algorithm/guarantee distinct from the existing lowering selection was named.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_FLAG_OR_COST_MODEL`; this is not based on missing implementation/results/resources.

## S73-CARD-02 — OpenMP target-data mapping

- Identity: a fixed OpenMP program, mapped objects, and device-data-environment semantics; carrier is `IMPLEMENTATION_CARRIER_ONLY`.
- RQ/endpoint: host-device mapping construction, with a prospective full-cost boundary of map/copy/task latency, device memory, and synchronization.
- Current locus: the official construct supplies `map`, `depend`, `device`, `if`, and `nowait`; it creates a target task and carries the mapping semantics into its device data environment.
- Minimum falsifier: if the proposed intervention picks timing/dependency/map clauses or an external runtime planner, it is precisely a policy/controller around already-native actions.
- RAW_REQUIRED audit: `INCOMPLETE` — no target-specific action/guarantee survives the native directive and task surface.
- Disposition: `EXCLUDED_BEFORE_RAW__NATIVE_MAP_DEPEND_UNION_AND_CONTROLLER_SHELL`.

## S73-CARD-03 — OpenJDK AppCDS archive construction

- Identity: JDK 25 fixed application class path and loaded-class set; stock JVM archive acceptance, class loading, and observable program behavior are immutable. Carrier is `NATURAL` in principle (versioned public Java applications), but none was selected or downloaded.
- RQ/endpoint: stock-CDS-reader-compatible archive construction affecting archive-build CPU/bytes/RSS, startup/class-load latency, and mapped footprint.
- Current loci: JDK 25 documents `-Xshare:dump`, `-XX:ArchiveClassesAtExit`, `jcmd VM.cds`, `-XX:+AutoCreateSharedArchive`, and `-XX:SharedArchiveFile`; the current OpenJDK CDS tree contains archiveBuilder, dynamicArchive and filemap implementation loci.
- Minimum falsifier: a proposed method that merely chooses a class list, archive mode, or flag is not a new construction; a method that changes archive reader or class semantics changes the object.
- RAW_REQUIRED audit: `INCOMPLETE` — the bounded evidence does not supply a non-generic whole-constructor action skeleton or target-specific guarantee. This is an honest locator/RQ backlog, not an absence claim.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; no closure queue is opened because no single missing public source can convert an unnamed generic layout idea into a valid action.

## S73-CARD-04 — LLVM RISC-V Zicbop prefetch construction

- Identity: fixed LLVM IR semantics and RISC-V Zicbop target; carrier is `IMPLEMENTATION_CARRIER_ONLY`.
- RQ/endpoint: target-native prefetch placement, with prospective compile cost, code size, cache/memory traffic, and runtime latency full cost.
- Current loci: LLVM's current RISC-V guide lists Zicbop as supported; current target source exposes a RISC-V loop-data-prefetch control. The official LLVM review for the landed Zicbop work records `llvm.prefetch` lowering to Zicbop instructions.
- Minimum falsifier: if all proposed actions are distance, placement, insertion, or a pass enablement, the residual is generic prefetch scheduling rather than a target-specific N2 guarantee.
- RAW_REQUIRED audit: `INCOMPLETE` — no target-specific non-generic action or guarantee was identified.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_PREFETCH_SCHEDULING`.

