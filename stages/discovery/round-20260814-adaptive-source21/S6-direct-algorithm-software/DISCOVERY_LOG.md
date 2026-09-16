# Source21 — affirmative-cliff / partial-primitive residual

## Frozen method and funnel

- Assignment: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE21-AFFIRMATIVE-CLIFF-PRIMITIVE-V5`.
- Canonical v8.7, potential/readiness separated; `DISCOVERY_CLAIM_PACK_MODE=OFF`; V9 OFF.
- No experiment, benchmark, build, installation, or large download was run.  Network-security, vulnerability, attack, exploit, and protocol-security families were excluded.
- Funnel: 8 locators → 4 fresh raw → 2 C0 source closures → 1 D1 → 1 deep review → 1 conditional (`FINITE_FIDELITY_GAP`) brief.

## Locator and raw screen

| ID | Anchor/current source | Candidate object | Raw/C0 result |
|---|---|---|---|
| L1 | LLVM current source documents MachineOutliner as a pass that maps instructions, builds a suffix tree, finds repeated legal sequences and replaces them with calls. [current source reference](https://llvm.org/doxygen/MachineOutliner_8cpp.html) | Target-specific machine-code outlining candidate set | Fresh raw; C0 closed; D1 passed. |
| L2 | The same source labels instructions `Legal`, `LegalTerminator`, `Illegal`, or `Invisible`, and requires target-specific candidate/frame/call hooks. [header source](https://www.llvm.org/doxygen/MachineOutliner_8h_source.html) | Legal instruction-sequence replacement | Contained by L1, not separately counted. |
| L3 | Ginkgo exposes automatic block-Jacobi structure detection, while its documentation calls that automatic detection a rough approximation. [current parameter docs](https://ginkgo-project.github.io/ginkgo-generated-documentation/doc/master/structgko_1_1batch_1_1preconditioner_1_1Jacobi_1_1parameters__type.html) | Fixed matrix to bounded block-Jacobi partition | Fresh raw; C0 closed; D1 failed: residual is generic bounded matrix partitioning without a distinct target-specific guarantee. |
| L4 | Ginkgo supplies solver/preconditioner composition through a common `LinOp` abstraction. [current LinOp docs](https://ginkgo-project.github.io/ginkgo-generated-documentation/doc/master/group__LinOp.html) | Joint preconditioner/solver choice | Excluded: selector/composition rather than a fixed-output constructor. |
| L5 | MIOpen Find remains a current solution database/selection interface. [official documentation](https://rocm.docs.amd.com/projects/MIOpen/en/latest/) | Convolution solution selection | Excluded: existing-point selector. |
| L6 | Composable Kernel exposes coordinate movement, thread maps, and swizzle primitives. [official documentation](https://rocm.docs.amd.com/projects/composable_kernel/en/latest/) | Tile data-movement plan | Excluded: generic backend layout, also Source20 identity. |
| L7 | CacheLib FDP controls data placement through device paths/configuration. [official FDP guide](https://cachelib.org/docs/Cache_Library_User_Guides/FDP_enabled_Cache/) | Cache placement labels | Excluded: controller/device-interface identity, Source20. |
| L8 | QEMU and Verilator are active assignments. | Simulator/runtime constructions | Excluded before raw by contract. |

## C0 and D1: MachineOutliner

**Current source union, source-pinned at the accessed upstream Doxygen snapshot (2026-08-14).**  `MachineOutliner.cpp` performs suffix-tree candidate discovery and repeated outlining; `MachineOutliner.h` fixes the legality classes and candidate intervals.  Target implementations supply `getOutliningCandidateInfo`, `buildOutlinedFrame`, `insertOutlinedCall`, and `isFunctionSafeToOutlineFrom`.  Current exposed controls include the `RunOutliner` mode, hidden `-disable-global-outlining`, and `-append-content-hash-outlined-name`; the source also supports local/global code-generation-data modes.  These are the current native union, not absence inferred from old documentation.

**Small legal action-divergence witness.**  For a target hook that declares equal positive savings for both candidates, consider a legal mapped instruction string with repeated, overlapping candidates `[a,b,c]` at interval `[0,3)` and `[b,c,d]` at `[1,4)`, plus a disjoint repeat of the first interval at `[4,7)`.  Both plans preserve the same instructions/ABI because each replacement uses the native frame and call hooks:

- Plan A outlines the two non-overlapping `[a,b,c]` occurrences;
- Plan B selects the overlapping `[b,c,d]` occurrence and foregoes the first plan’s shared outlined function.

The action is not a new ISA primitive: it is a complete selection of existing native outline/call/frame actions.  The source describes repeated suffix-tree queries and contains an explicit remark that it currently chooses an arbitrary candidate for an outlined function; it does not establish a target-cost Pareto frontier over all legal, mutually incompatible candidate groups.  This is a source-supported action promise, not a claim that no external implementation exists.

**D1.**  The fixed object is a MachineIR module with a fixed target triple, ABI/unwind semantics, and initial instruction stream; function behaviour and output ABI must remain identical.  Oracle: LLVM `-verify-machineinstrs`, object-level relocation/unwind inspection, and execution/regression tests for LLVM Test-Suite programs.  Natural carrier: versioned LLVM Test-Suite / Clang-built C/C++ translation units.  Full cost: compile/outliner CPU, peak RSS/temp, code bytes, relocations/unwind records, and runtime/code-size effect.  The 72-hour killer is finite: construct the witness in MIR for one supported target; reject if native legality hooks refuse either plan, emitted code fails verifier/object equivalence, or exhaustive enumeration of the witness’s legal candidate subsets has no strict non-dominated set beyond the current selection.

## Decision

One conditional brief is proposed.  It is not an assertion of an established performance result or unbounded novelty: its current direct-collision status is `SEARCH_BOUNDED_OPEN`, and Stage 0 must close same-object outlining literature/tool collisions and confirm that the global candidate selection is not already implemented by a target backend or global CGData path.
