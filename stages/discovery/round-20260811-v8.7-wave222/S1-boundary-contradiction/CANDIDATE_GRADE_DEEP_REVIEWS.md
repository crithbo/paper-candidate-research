# Candidate-grade deep review — D01

## Fixed semantics and legal witness

Intel APX adds EGPRs `R16–R31`, REX2 access for relevant legacy-map operations, and EVEX extensions including a non-destructive destination (NDD). Witness W is a pressure-bearing integer basic block inside a normal APX x86-64 function: a value must survive a destructive arithmetic update while two other values remain live. A legal code sequence can use an EGPR with an APX prefix, or avoid it by a legacy register/move/spill sequence. Output, exception behavior, ABI, and unwind contract are held fixed.

This is an action-divergence witness at ISA level, not yet a candidate action gap at compiler-algorithm level.

## Current-upstream reality and strongest union

- Intel’s current APX software-enabling material describes the 16 EGPRs, REX2, NDD, and ABI/software-enabling surface; APX is not a hypothetical ISA action.
- Current LLVM `main` defines `FeatureEGPR`, `FeatureNDD`, `FeaturePPX`, and the other APX feature bits. Its standard code-generation pipeline supplies global greedy/PBQP allocator choices, prologue/epilogue insertion, post-RA pseudo expansion and scheduling. Those are real composable paths, not absent machinery.
- Current GCC documents `-mapxf` and function `target("apxf")` enablement, including EGPR, PUSH2POP2, NDD, PPX, NF, CCMP, and ZU. APX feature selection is therefore part of its documented target union.
- Current binutils APX work explicitly covers REX2, EGPR and extended-EVEX instruction encoding, assembler and linker support. Its published source discussion also records encoding restrictions that a constructor must respect.

What remains unpinned is decisive: no current revision-level enumeration has established, for both LLVM and GCC, the precise register-class costs, instruction-selection alternatives, prefix-size modeling, copy coalescing, spill weights, frame/unwind handling, and post-RA encoding choices for W and its generalization. Therefore neither an absence claim nor an absorption claim for a purported *joint* constructor is licensed.

## Candidate mechanism and red-team

The only plausible N2 would be a structured encoding-aware allocation/form-selection algorithm that jointly selects EGPR residency, REX2/EVEX/NDD form, copy destruction, spills, and ABI saves under a fixed code-size/front-end budget. Merely adding an EGPR penalty to a register cost, setting an APX option, or passing the same formulation to a generic ILP is prohibited.

At this point, there is no frozen proof that such a structured algorithm has an atomic action not obtainable by existing target instruction selection plus allocator/coalescer/spill machinery. Conversely, the cited sources do not prove absorption. The candidate is therefore not brief-ready.

## Six-dimensional review and finite closure

| dimension | evidence status |
|---|---|
| decision rule | Unfrozen: exact existing APX prefix/register cost decisions need source-level enumeration. |
| information | Same MachineIR/liveness/target input can be held fixed for W. |
| complexity/resource | A non-generic joint state space is conceivable, but its separability from current RA is unproven. |
| quality/guarantee | Fixed by ISA legality, ABI/frame/unwind validity, deterministic output/exception equivalence. |
| full cost | Frozen denominator includes compile CPU/RSS, code bytes/prefixes, spills, static throughput, and later cycles/memory. |
| generalization/no-gain | Requires multiple natural pressure-bearing functions and cross-toolchain comparison; not yet closed. |

### 72-hour finite killer / fidelity closure plan

1. Pin one current LLVM commit, GCC commit/release, and binutils commit; enumerate `-mapxf`/target attributes and all APX subfeatures used by W.
2. Trace the compilation path for W: instruction forms, register classes, allocator/coalescer, spill/reload, callee-save/frame/unwind, encoding and post-RA steps.
3. Formally enumerate the legal local APX encodings for W; compiler/assembler acceptance, objdump encoding, and unwind metadata provide the small oracle.
4. If every proposed joint action is reproducible by the same-information/same-budget union, direct absorption. If a complete structured action remains outside that union, freeze it with the stated full-cost comparator before any Stage0 proposal.

No StageA route is executed by this assignment; hardware absence would only cap runtime evidence, never decide the science.

## Verdict

`NOT_ADMITTED_UNFROZEN__CURRENT_JOINT_ACTION_UNION_NOT_ENUMERATED`.

No brief is emitted. This status is not a negative inference from missing APX hardware, implementation, results, resources, or AI readiness.
