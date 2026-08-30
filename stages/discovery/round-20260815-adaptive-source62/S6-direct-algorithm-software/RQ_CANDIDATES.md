# Source62 primary RQ convergence

## RQ01 — GCC C++ coroutine frame/state/cleanup constructor

**Primary RQ.** For a fixed C++20 coroutine source, target ABI and observable resume/destroy/exception behavior, can a target-specific joint constructor choose coroutine-frame state representation, spill placement and cleanup transition structure with a formal size/latency frontier that is not already the current GCC coroutine producer union and is not merely generic frame packing?

**Counterfactual.** If all legal actor/resume/destroy construction is fixed by GCC’s producer or ABI, or the remaining choice is ordinary layout/coloring, the RQ fails.

**Minimum falsifier.** Current official source/docs show the proposed joint action is already emitted or any alternative changes ABI/runtime-visible semantics.

## RQ02 — GHC STG lambda-lift and closure-environment constructor

**Primary RQ.** For a fixed Haskell module, runtime calling convention and observable program behavior, can a target-specific bounded-context algorithm jointly choose STG lambda lift sets and closure environments with a non-generic code-size/allocation/entry-cost guarantee beyond GHC’s current lambda-lift/configuration union?

**Counterfactual.** If the action is a standard lambda-lifting cost model, a compiler flag/threshold, or does not preserve the same closure/runtime object, the RQ fails.

**Minimum falsifier.** Current GHC source/docs already expose the same whole lift-set/environment action, or the proposed guarantee reduces to generic closure conversion/scheduling.

Only these primary RQs proceed to bounded official-source closure. The remaining seeds stay scheduling material and do not enter the scientific denominator.
