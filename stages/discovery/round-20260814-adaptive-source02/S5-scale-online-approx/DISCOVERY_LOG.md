# DISCOVERY-S5-20260814-ADAPTIVE-SOURCE02

Canonical v8.7 Discovery; `DISCOVERY_CLAIM_PACK_MODE=OFF`. This package is a
read-only source/collision screen on 2026-08-14. No V9 output, experiment,
E2, build, installation or benchmark was run.

## Cross-project exclusions before raw screening

`GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN` is currently in independent
Stage 0, so GlobalISel is excluded. QEMU TCG, ThinLTO, OpenJDK CDS, Binaryen
stackification, Bison, Dafny/Boogie, LLVM Machine Outliner, rustc incremental
depgraph and eBPF cached-state pruning are prior or currently active families.
They are not re-opened here.

## Six fresh raw families and primary disposition

| # | Canonical family | Target-specific action / intended guarantee | Primary disposition |
|---|---|---|---|
| R1 | GCC RTL if-conversion | For a fixed target RTL CFG, jointly replace a legal branch region by predicated/branchless instructions while preserving target ABI and semantics; requested form would need a target-specific Pareto/FPT guarantee. | `DROP__CURRENT_UNION_AND_ONLY_THRESHOLD_RESIDUAL` |
| R2 | Swift SIL generic-specialization pipeline | Fixed Swift SIL program and ABI; select specialization/rewrite actions under compilation budget. | `NOT_ADMITTED__NO_FROZEN_NON_GENERIC_ACTION_PROMISE` |
| R3 | GraalVM Native Image hosted points-to analysis | Fixed closed-world image and output/reachability semantics; bounded state/action summary construction. | `NOT_ADMITTED__NO_CURRENT_UNION_OR_TARGET_GUARANTEE_CLOSED` |
| R4 | Soufflé incremental Datalog evaluation | Fixed relation/query semantics over a versioned fact-update stream; elastic incrementalization action. | `NOT_ADMITTED__CURRENT_ACTION_UNION_NOT_CLOSED` |
| R5 | TLC fingerprint-set partitioning | Fixed TLA+ safety/liveness exploration; relocate/persist fingerprint-state structure under memory cap. | `DROP__CONFIGURATION_AND_GENERIC_STATESTORE_NOT_TARGET_SPECIFIC_N2` |
| R6 | OCaml Flambda optimization pipeline | Fixed OCaml program/ABI; whole-program inlining/specialization plan with bounded code growth. | `NOT_ADMITTED__CURRENT_SOURCE_AND_FORMAL_ACTION_PROMISE_NOT_CLOSED` |

The contract requires exactly one primary disposition per raw row; it does not
make raw count, depth count or proposals a quota. R1 and R5 reached bounded
deep review because current official material already supplied decisive
counter-evidence. R2–R4 and R6 were not promoted: their natural/formal
carriers do not repair the missing target-specific action-plus-guarantee card.

## Deep review R1 — GCC RTL if-conversion

**Exact object.** A fixed GCC target and RTL control-flow region, with identical
language semantics, target ABI and emitted-object contract. The native action
replaces conditional jumps with branchless or conditional-execution sequences.
Natural carrier would be versioned GCC test-suite/C/C++ source histories;
oracle is stock compiler output plus target execution/ABI tests. Full cost must
include RTL analysis, compile time/RSS, code size, branch prediction and dynamic
instruction consequences.

**Current reality / strongest union.** Current GCC documentation lists
`-fif-conversion` and `-fif-conversion2`, states their semantics, describes
the `max-rtl-if-conversion-insns` and predictable/unpredictable cost bounds,
and gives RTL dumps `-fdump-rtl-ce1/2/3`. The GCC internals manual locates the
RTL pass family. Thus both default enablement and non-default action controls
are known. A residual that merely changes the threshold/cost is prohibited
parameter selection; generic CFG DP/ILP would not supply the requested
target-specific formal promise.

**Disposition.** `DROP__CURRENT_UNION_AND_ONLY_THRESHOLD_RESIDUAL`.

Sources: [current GCC optimize options](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html),
[current GCC developer options](https://gcc.gnu.org/onlinedocs/gcc/Developer-Options.html),
[GCC RTL-pass internals](https://gcc.gnu.org/onlinedocs/gccint/RTL-passes.html).

## Deep review R5 — TLC fingerprint-set partitioning

**Exact object.** A fixed TLA+ specification and TLC safety/liveness exploration
semantics. The stock actions choose fingerprint polynomial, in-memory share,
disk partition count and optional FP-set implementation. A canonical natural
carrier would be the public TLA+ example/specification corpus; the oracle is
TLC's reachable-state/property verdict. Full cost includes distinct-state and
queue representation, fingerprint bytes, disk I/O, memory, CPU and collision
risk.

**Current reality / strongest union.** The current tools document specifies
`-fp`, `-fpbits`, `-fpmem`, and an alternate off-heap disk FP-set implementation.
These are configuration and state-store choices, not a new invariant-preserving
semantic action. Any candidate restricted to repartitioning/thresholding is a
maintenance/configuration controller; an approximate fingerprint store is a
generic filter/state-store rather than a target-specific online N2.

**Disposition.** `DROP__CONFIGURATION_AND_GENERIC_STATESTORE_NOT_TARGET_SPECIFIC_N2`.

Sources: [current TLC tools documentation](https://github.com/tlaplus/tlaplus/blob/master/general/docs/current-tools.md),
[TLA+ tools overview](https://lamport.azurewebsites.net/tla/tools.html?unhideBut=hide-tlatex&unhideDiv=tlatex).

## Claim ceiling

This is not a current-absence or global-novelty claim. For R1/R5 the current
native actions/configurations supply a direct no-gain boundary. For all
unfrozen raw families, no negative inference is made from missing
implementation, result, resource or AI readiness. No family has a frozen
union-external target-specific action, formal guarantee, strongest subtractor
and finite Stage A falsifier, so no TOPIC_BRIEF is created.
