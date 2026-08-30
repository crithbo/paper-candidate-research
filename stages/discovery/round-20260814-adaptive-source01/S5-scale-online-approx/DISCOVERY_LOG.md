# DISCOVERY-S5-20260814-ADAPTIVE-SOURCE01

Canonical Discovery only. `DISCOVERY_CLAIM_PACK_MODE=OFF`; no V9 material was
created. This is a bounded source-and-collision review completed on 2026-08-14,
not an implementation, build, benchmark, E2 smoke test, or absence claim.

## Scope and pre-screen

The project controls were searched for the candidate signatures and adjacent
families before depth. ThinLTO, OpenJDK CDS, Android binary outlining and
generic build/cache controllers were excluded because they are already reviewed
or out of scope. The following diagnostic families were then screened:

| Family | Result before / at depth | Reason |
|---|---|---|
| LLVM Machine Outliner | DEEP / DROP | The current native pass already maps legal target instructions, discovers repeated sequences, applies target hooks and cost/overlap pruning. |
| LLVM IR Outliner | SCREENED_OUT_MERGED | Same compiler-outlining family; current IR pass already identifies regions, extracts, consolidates and applies a cost model. It is not an independent opportunity family. |
| rustc incremental dependency graph and CGU work products | DEEP / DROP | The current dependency graph, persisted work-product map, cache load and session publication are the complete stock incremental action union. |
| Linux eBPF verifier cached-state pruning | DEEP / DROP | The current verifier explicitly maintains state caches, liveness reduction and subset/equivalence pruning while preserving verifier acceptance semantics. |
| GHC recompilation checker | SCREENED_OUT | The documented native action is a recompilation decision over interface/source/object state. A remaining idea would be a build policy or generic dependency scheduling wrapper, prohibited by this assignment. |

The diagnostic target in the contract is not a quota. No other family reached a
distinct, target-specific action interface before the depth boundary.

## Deep review 1 — LLVM Machine Outliner

**Frozen object.** A fixed LLVM target's machine-level program, emitted object
semantics and ABI; the action is selecting legal repeated instruction sequences,
creating outlined functions/calls and resolving overlaps. Natural carrier:
existing multi-function LLVM/Clang compilation units. Oracle: stock assembler,
linker and semantic test suite. Full cost would include analysis, suffix-tree
memory, target-hook work, code-size, compile time and any call overhead.

**Current union and counter-evidence.** Current LLVM 24.0.0git Doxygen labels
instructions `Legal`, `LegalTerminator`, `Illegal` and `Invisible`, and exposes
target-specific candidate construction. The current implementation builds a
suffix tree, finds repeated subsequences, evaluates target information and
prunes overlaps. It also exposes a benefit threshold, rerun count and hidden
global-outlining controls. The proposed complete action is therefore directly
expressed, not missing due to a default configuration.

**Disposition.** `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_FROZEN_ACTION`.
Neither a different threshold nor a selection controller is a union-external
N2. A possible future residual would need a non-generic target state/action and
an exact/FPT/approximation theorem that survives this whole action union.

Sources: [MachineOutliner header](https://www.llvm.org/doxygen/MachineOutliner_8h_source.html),
[current implementation](https://llvm.org/docs/doxygen/MachineOutliner_8cpp_source.html),
[TargetInstrInfo hook](https://www.llvm.org/doxygen/classllvm_1_1TargetInstrInfo.html).

## Deep review 2 — rustc incremental dependency graph

**Frozen object.** A fixed rustc compilation session sequence, crate graph and
codegen-unit output semantics; the action is loading the predecessor dependency
graph/work products, recording current dependencies, determining reuse and
publishing a valid session directory. Natural carrier: versioned Rust project
histories. Oracle: stock rustc output and compilation-success semantics. Full
cost includes hashing, graph/index bytes, work-product copy/load, CPU, RSS,
temporary directory I/O and compilation fallback.

**Current union and counter-evidence.** Current rustc documentation states that
the dependency graph is loaded when possible, output is streamed to the current
session directory, work products are indexed/copied, query results can be
loaded, and invalid sessions are not published. The dependency graph source
also records current nodes and attempts to mark previous nodes green. This
already expresses the complete stock-native online state-transition action.

**Disposition.** `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_FROZEN_ACTION`.
Changing reuse thresholds, eviction, batching or build scheduling would be a
controller/cache policy. No target-specific FPT/approximation/recourse action
outside the union was frozen, so a finite Stage A killer would only retest the
existing implementation rather than falsify a new mechanism.

Sources: [rustc_incremental current API](https://doc.rust-lang.org/stable/nightly-rustc/rustc_incremental/),
[dependency graph API](https://doc.rust-lang.org/stable/nightly-rustc/rustc_query_system/dep_graph/graph/index.html),
[current graph source](https://doc.rust-lang.org/stable/nightly-rustc/src/rustc_query_system/dep_graph/graph.rs.html).

## Deep review 3 — Linux eBPF verifier cached-state pruning

**Frozen object.** A fixed eBPF program and kernel verifier acceptance/safety
semantics; the action is caching verifier states at program counters, reducing
unneeded state by liveness, and pruning a path when a prior state safely
contains it. Natural carrier: versioned in-tree BPF selftests and public BPF
program histories. Oracle: stock verifier acceptance/rejection and verifier
log. Full cost includes state-cache bytes, simulated instructions, branches,
register/stack state comparisons and verification wall time.

**Current union and counter-evidence.** Kernel documentation explicitly says
that the verifier compares a newly reached branch state with cached states,
prunes a contained state, tracks liveness for registers and stack slots, and
uses `regsafe()`, `states_equal()`, `stacksafe()` and `clean_live_states()`.
The action is native and safety-preserving; it is not an unavailable interface
or a disabled feature. A generic state-merging DP would not be target-specific.

**Disposition.** `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_FROZEN_ACTION`.
A later candidate would have to specify a verifier-specific state quotient plus
a nontrivial soundness/complexity guarantee and a smallest two-program witness;
this review did not freeze such an action.

Sources: [current kernel verifier documentation](https://docs.kernel.org/bpf/verifier.html),
[versioned 6.14 verifier documentation](https://docs.kernel.org/6.14/bpf/verifier.html).

## Evidence discipline and next step

No current-absence claim is made: all three final decisions are direct current
union absorption. No clean brief, fidelity plan or Stage A killer is warranted
for an absorbed action. The next assignment may consider a genuinely distinct
target-specific state/action only after a new action-divergence witness and
formal guarantee are frozen.
