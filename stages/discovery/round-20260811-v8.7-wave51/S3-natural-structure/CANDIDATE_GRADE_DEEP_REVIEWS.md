# Candidate-grade deep reviews

These three reviews use the normal v8.7 production gates only. R7 collision-first semantics were not used because the frozen quality mode is `OFF`.

## EBPF-STATE-QUOTIENT — DROP

- Exact object/function: an eBPF program judged by the Linux kernel verifier; preserve accept/reject result and safety proof boundary.
- Named natural structure: branch joins commonly leave values/register slots dead on the suffix, producing repeated liveness-compatible abstract states.
- Minimal action-divergence witness: two states reaching one instruction differ only in a dead register/stack value. Proposed action would quotient them before successor exploration.
- Current strongest union: official current verifier documentation says the verifier checks earlier states at the same instruction, uses subset safety, implements `regsafe()` and `states_equal()`, and tracks register/stack liveness precisely to make more states equivalent.
- Current-upstream reality check: inspected current kernel verifier documentation and upstream-facing symbols named above at cutoff. This review makes no implementation-absence claim. The contrary evidence is direct native state equivalence/pruning; relevant kernel build/config switches do not turn this semantic pruning action into a missing user option.
- Full-cost denominator: verifier wall time, peak verifier state memory, log/result correctness, and any added state-key construction—never accepted-program count alone.
- Finite Stage A killer: on a small public BPF selftest, enumerate states at a join and compare the proposed quotient relation with `states_equal()`/liveness semantics. If it has no pair that is distinct from native pruning while retaining the same safety condition, the mechanism is absorbed. The current documented union already establishes this direct subtractor.
- Fidelity closure: `READY_TO_CLOSE_IN_STAGEA` for a future verifier-source/checker route, but no union-external atomic constructor exists. Structural-paper potential: `BELOW_Q2_STOP`; readiness did not cause the decision.

## JVM-CP-REINDEX — DROP

- Exact object/function: a valid class file whose constant-pool references, verification and execution semantics are unchanged.
- Named natural structure: a long-tail distribution of constant references, with `ldc` using one-byte indices and `ldc_w` using two-byte indices.
- Minimal action-divergence witness: assigning a frequently used eligible constant an index below 256 replaces an `ldc_w` reference with `ldc`, while every affected reference is rewritten.
- Canonical oracle: JVM class-file validation plus unchanged decoded references/execution semantics; the Java Virtual Machine Specification defines both instructions and their index widths.
- Current union and collision: Oracle's Pack200 specification states that a compressor fully parses class files, reconstructs a constant pool, adjusts all constant-pool references, and does so without changing class semantics. This is a same-object constructor, not merely a compiler flag; it directly covers reindexing.
- Current-upstream reality check: inspected the current Java SE 26 JVMS and current OpenJDK `constantPool.cpp` at cutoff. No absence claim is made. The direct contrary evidence is the formal Pack200 construction; flags are immaterial because the action is already specified as a complete rewrite.
- Full-cost denominator: transformed class bytes, rewrite/verification time, class-load/runtime behavior, and compatibility—not bytecode bytes saved in isolation.
- Finite Stage A killer: take one small public class, perform a reference-complete pool renumbering and validate it; if it is the stated constructor, Pack200 is already its direct subtractor. This immediately kills novelty. Structural-paper potential: `BELOW_Q2_STOP`.

## DWARF-NAME-INDEX-LAYOUT — DROP

- Exact object/function: a DWARF producer's `.debug_names` contribution with identical valid name-to-DIE lookup semantics.
- Named natural structure: repeated names/types across compilation units and an uneven lookup-frequency distribution.
- Minimal action-divergence witness: choose a different bucket/entry-pool layout for the same mandatory name entries while preserving valid offsets and abbreviation forms.
- Canonical oracle: DWARF reader lookup and the DWARF 5 format checker/parser; the standard defines `.debug_names`, bucket count, name count, entry pool and hash lookup table.
- Current union: the DWARF standard already makes bucket and table representation part of the prescribed name-index constructor; producer-specific alternative bucket sizing is a representation parameter, not a new algorithm or guarantee.
- Current-upstream reality check: inspected the current DWARF committee site, DWARF 5 standard, current DWARF v6 issue/errata record, and LLVM's current `DWARFDebugLine` source documentation at cutoff. No claim rests on an allegedly missing source option. The contrary evidence is the existing standards-defined name-index action.
- Full-cost denominator: producer construction time, `.debug_names` bytes, debugger startup/lookup time, and all required debug data; optimizing only hash load factor is insufficient.
- Finite Stage A killer: construct two legal layouts for one small public object and use a conforming parser/debugger; if only bucket sizing differs, it is parameter tuning. If entry content changes, it must satisfy the standard's existing constructor. Thus no N2/N3 action remains. Structural-paper potential: `BELOW_Q2_STOP`.
