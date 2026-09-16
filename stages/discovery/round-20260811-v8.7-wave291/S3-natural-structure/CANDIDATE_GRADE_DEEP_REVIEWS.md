# CANDIDATE_GRADE_DEEP_REVIEWS

## D1 — SPIR-V: `NOT_ADMITTED_UNFROZEN`

The object is a fixed SPIR-V module accepted by the same target-environment validator and presenting identical interface/instruction semantics. The official tools already provide binary parser, assembler/disassembler, validator, linker, canonical-ID and numerous optimizer passes/recipes. The project also states that instruction order is not retained by its diff tool and supplies semantics-preserving transforms. Therefore a proposed predecessor-aware instruction/ID ordering cannot be assumed outside the current union.

A legal two-version/two-layout witness must freeze target environment, all IDs/decorations/debug information and `spirv-opt` pass ordering, then show two `spirv-val`-valid modules with identical interface/semantics but different *legal* serialization choices not replayed by the union. No such complete witness is present in official source/doc evidence. Natural carrier would be a hash-pinned set of 20–50 adjacent Khronos shader fixtures/releases; full cost: producer CPU/RSS/temp, module+delta bytes, validation/driver load/compile time and memory. 72h killer: exhaust optimizer recipes/passes and prove/refute the witness on two fixtures. `NOT_ADMITTED_UNFROZEN`.

## D2 — OpenJDK CDS: `NOT_ADMITTED_UNFROZEN`

The object is a matching-version application CDS archive, with identical class metadata/class-loading/runtime behavior through stock `-Xshare` operation. JEP 310 and OpenJDK archive-builder materials are contrary evidence: CDS already archives application classes, and static/dynamic archive paths are native whole constructions. No current source pin has yet enumerated archive-builder placement actions, class-loader constraints, heap-archive settings, flags and the direct literature collision.

A candidate would require a source-derived legal archive-atom graph and a target-specific bounded Pareto planner for archive bytes, matching-version startup and same-information delta—not a wrapper. Natural route: pin official OpenJDK tags, a fixed small app/class list, archive SHA and runtime flags. Charge dump CPU/RSS/temp, archive/delta bytes and matching JVM startup/load RSS/latency. 72h killer: two archive layouts that boot under stock matching JDK plus complete `-Xshare`/archive-builder union replay. Absent this, `NOT_ADMITTED_UNFROZEN`.

## D3 — Lua binary chunk: `NOT_ADMITTED_UNFROZEN`

The object is fixed Lua prototype/constants/VM behavior under the same Lua tag’s stock chunk loader. Official Lua material confirms `lua_load` detects binary chunks and current Lua work explicitly concerns dump/undump reuse. That is counterevidence, not an action gap. A legal alternative layout must preserve every prototype, string/reference, debug and VM decoding behavior; none is frozen from the official material, and binary chunks are compiler/VM-version constrained.

Natural route: official Lua tags plus versioned upstream programs, pin source/compiler flags and chunk hashes. Full cost: `luac`/dump CPU/RSS/temp, chunk/delta bytes and stock load/execute CPU/RSS. 72h killer: construct two same-tag stock-load-equivalent chunks and exhaust dump options/source action paths. `NOT_ADMITTED_UNFROZEN`; no inference from missing run or result.
