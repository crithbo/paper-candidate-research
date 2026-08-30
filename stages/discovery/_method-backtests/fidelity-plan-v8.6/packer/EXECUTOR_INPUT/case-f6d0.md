# Case f6d0

Cutoff: 2026-08-09. A compiler input must yield target-correct machine code.
The contemplated action is global scheduling across basic-block boundaries,
but the current implementation and an upstream target-specific global scheduler
already express speculative, predicative, and pull-up scheduling actions under
the same target legality and liveness constraints.

Any remaining change is a selector over that action space. A local swap/window
control would not implement the stated global action. Decide whether a distinct
same-object finite closure route remains.
