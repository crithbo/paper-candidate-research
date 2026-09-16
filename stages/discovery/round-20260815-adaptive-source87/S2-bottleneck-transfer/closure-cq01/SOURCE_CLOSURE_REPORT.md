# Source-closure report

## Identity and permitted disposition

- Assignment: `SOURCE-CLOSURE-SOURCE87-S2-CQ01-GRAALVM-CLASS-INIT-IMAGE-HEAP-V1`
- Frozen object: one fixed closed-world Java application and reachability set
  built by stock Native Image for a fixed target, with unchanged class-init
  behavior, image-heap legality, executable semantics and application output.
- Current source pin: `oracle/graal@f3c130e4d5345b81968f0f9d94fedb87c7143b8c`.
- Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.

This source-only disposition does not decide a clean brief, Q2, PASS, STOP or
any stage state.

## Closure result

The bounded current source route closes the immediate stock action boundary:

- class initialization may be explicitly set build-time or runtime before
  analysis is sealed; default and superclass/interface dependencies are part of
  the current safety decision;
- the image heap has a layouter, deterministic field ordering and phased object
  addition, including a current late-string locality mechanism;
- the retained test carrier distinguishes simulated and runtime-delayed class
  initializers.

The required same-object two-plan witness is not supplied by these loci. The
test code does not instantiate one fixed application into two complete legal
class-init-plus-heap-layout plans, and no target-specific joint action or finite
safety/layout guarantee has been frozen. The exact options/configuration source
and a complete app build carrier would also need an explicitly authorized
follow-up because this route consumed all six requests.

## Evidence status

| Frozen closure field | Status | Reason |
|---|---|---|
| Immutable official source pin | closed | Official default branch and commit receipts retained. |
| Stock class-init safety/control | materially closed | Current source exposes policy, sealing, dependency safety and default behavior. |
| Stock image-heap action | materially closed | Current source exposes object-model, layouter and phased/locality actions. |
| Fixed-app carrier | locus only | Current test classes are retained; no fixed native-image executable/build receipt exists. |
| Two complete legal init-layout plans | not closed | No same-application pair is defined in the bounded loci. |
| GraalVM-specific union-external action and guarantee | not closed | Candidate mechanism and formal condition remain unspecified. |
| Direct current collision | unadjudicated | The bounded source is a subtractor map, not proof of absence or direct identity. |
| Generic proof/packing/config objection | unadjudicated | Requires the missing explicit action and whole-union comparison. |

## Later fidelity and falsifier boundary

Any separately authorized follow-up must keep the fixed application,
reachability set, target and class-init/executable semantics. It must account
for reachability and class-init analysis, image-heap construction/layout,
build CPU/RSS, image bytes, startup/runtime behavior and output equivalence.
A finite falsifier becomes available only when two complete plans are frozen:
either stock current actions express the asserted joint decision with the same
semantics/cost, or the proposed action cannot produce a distinct legal plan.
Neither test was executed here.

## Search boundary

Only the six `oracle/graal` routes permitted by the assignment were requested.
No clone, archive, build, execution, benchmark, external-project search, or
prohibited Source88+/Source92/R75/OpenXLA/TVM/ONNX material was read. Missing
or unqueried material and an exhausted cap are not absence evidence.

