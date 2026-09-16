# Source audit — GraalVM Native Image class initialization / image heap

Assignment: `SOURCE-CLOSURE-SOURCE87-S2-CQ01-GRAALVM-CLASS-INIT-IMAGE-HEAP-V1`.  
Authority: source closure only; no candidate, quality-tier, or pipeline-state decision.

## Pin and bounded official evidence

The first official repository call established `master` as the default branch.
The second fixed `oracle/graal` at
`f3c130e4d5345b81968f0f9d94fedb87c7143b8c`; the complete tree response was
not truncated. All retained loci below are pinned to that commit.

| Bounded role | Official current locus | What it establishes |
|---|---|---|
| Class-init safety/control | [ClassInitializationSupport.java](https://raw.githubusercontent.com/oracle/graal/f3c130e4d5345b81968f0f9d94fedb87c7143b8c/substratevm/src/com.oracle.svm.hosted/src/com/oracle/svm/hosted/classinitialization/ClassInitializationSupport.java) | The stock tool records build-time and runtime policies before analysis is sealed, follows superclass/default-method-interface constraints, and defaults unconstrained classes to runtime initialization. |
| Image-heap construction | [NativeImageHeap.java](https://raw.githubusercontent.com/oracle/graal/f3c130e4d5345b81968f0f9d94fedb87c7143b8c/substratevm/src/com.oracle.svm.hosted/src/com/oracle/svm/hosted/image/NativeImageHeap.java) | The heap tracks image objects without assuming a final layout, has a layouter, deterministic field ordering, phase-controlled object addition, and current late interned-string placement for locality. |
| Fixed test carrier locus | [TestClassInitialization.java](https://raw.githubusercontent.com/oracle/graal/f3c130e4d5345b81968f0f9d94fedb87c7143b8c/substratevm/src/com.oracle.svm.test/src/com/oracle/svm/test/clinit/TestClassInitialization.java) | A current in-tree carrier distinguishes pure initializers suitable for image-build simulation from side-effecting initializers that must be delayed to runtime. |

Six official requests were used and retained response bytes total 7,766,032,
within the 16 MiB persisted cap. The complete receipt, source hashes, and
pre-call monotonic ledger are under `resources/`.

## Current union boundary

The source establishes a substantial current union, rather than a bare binary
choice: explicit build-time/runtime class policy, safety computation through
class/interface dependencies, phase sealing, image-object construction,
layouter integration, object worklists, layered-image state and a current
locality-oriented late-string action. These are mandatory current subtractors
for any later same-object review.

It does not, within this bounded surface, define two complete legal plans for a
single fixed closed-world application that jointly change class-init decisions
and heap layout while preserving executable/application semantics. Nor does it
define a proposed union-external action, its exact safety/layout condition, or
a finite GraalVM-specific algorithmic/formal guarantee. This is a bounded
closure gap—not a claim that no such action exists elsewhere.

## Carrier, collision and generic-objection status

`TestClassInitialization.java` is a stock current carrier locus, but it is a
test class collection rather than a retained fixed native-image executable and
does not furnish two complete init-layout plans. The official source displays
current configuration and heap-locality mechanisms, so an eventual proposal
must be compared to their complete same-object action map. No direct-current
fatal is registered here because the frozen candidate action/guarantee is not
yet defined; no absence inference or external-project search was performed.

The generic proof/packing/config objection likewise remains unadjudicated: a
later authorized closure must show why the action is neither a class-init
option policy nor a conventional heap layout/configuration wrapper.

