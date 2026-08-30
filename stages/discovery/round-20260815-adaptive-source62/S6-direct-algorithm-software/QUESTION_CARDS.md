# Source62 evidence-qualified question cards

## C01 — GCC C++ coroutine actor/ramp/destroy construction

- **Exact identity:** fixed C++20 coroutine source, GCC 15.2.0 C++20 ABI/target, suspension points, promise behavior, resume/destroy/exception behavior, and generated actor/ramp/destroy functions.
- **Question / endpoint:** whether a joint frame-state/spill/cleanup constructor can improve frame bytes plus normal-resume and destroy latency without changing the C++/ABI observable object.
- **Anchor / carrier:** GCC’s public C++ coroutine tests and a version-pinned public coroutine translation unit; stock oracle is language/runtime behavior plus actor/ramp/destroy equivalence.
- **Current locus and union:** GCC’s published current 15.2 manual makes coroutines enabled by default for C++20; official GCC source-change records identify `cp_coroutine_transform`, analysis/ramp/outlined-function synthesis, `build_actor_fn`, `build_destroy_fn`, frame access, suspension state, parameter destruction and exception paths. These are one producer chain, not separate selectable postprocessors.
- **Minimum survival trace:** a legal alternative would have to regenerate the frame-accesses, state dispatch, actor and destroy function while preserving tail continuation and cleanup ordering. The official current-source record pins reverse-order parameter destruction and explicit actor/destroy construction; the candidate cannot identify a target-specific independent action beyond this union.
- **Contrary / direct collision:** historic LLVM coroutine-frame closure is only related, not an exclusion; current GCC itself is the decisive contrary producer. No separate paper collision is needed after the candidate reduces to ABI-coupled frame layout.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_PRODUCER_CHAIN_AND_GENERIC_LAYOUT_KERNEL`.
- **Reason:** a differently arranged frame/cleanup plan either changes ABI/lifetime-visible behavior or is generic frame layout/coloring. No target-specific exact/FPT/approx/Pareto guarantee beyond the producer chain was specified.
- **Full-cost if it survived:** compile CPU/RSS/temp; actor/ramp/destroy bytes; frame bytes/alignment; resume, exception and destroy latency; spill/reload and cleanup work.
- **72h killer:** on one public GCC coroutine test, show that the proposed plan cannot produce a same-ABI actor/ramp/destroy triple without changing state/cleanup semantics, or show it is already represented by the transform’s existing construction.

## C02 — GHC STG late-lambda-lifting / closure-environment construction

- **Exact identity:** fixed Haskell module, GHC 9.14.1+ STG/runtime calling convention, and identical observable program result, allocation semantics and code generation endpoint.
- **Question / endpoint:** whether a bounded-context algorithm can jointly select lift sets and closure environments with a target-specific code-size/allocation/entry-cost frontier beyond GHC’s current producer.
- **Anchor / carrier:** GHC’s public test suite and versioned Hackage-style modules; stock oracle is GHC semantic behavior and generated-code/runtime equivalence.
- **Current locus and union:** the current official user guide states that `-fstg-lift-lams` selectively lifts local STG functions by turning free variables into parameters; it is enabled by `-O2`. It also exposes the non-recursive and recursive parameter bounds (both default 5 on x86_64) and the `known` option. These current default/nondefault controls cover selection, free-variable-to-parameter conversion and calling-convention boundary already.
- **Minimum survival trace:** the proposed alternative must choose a different set of local functions and regenerate the corresponding free-variable parameter environments while retaining the same calls. That is precisely late lambda lifting; no non-generic action or target-specific guarantee remains after subtracting this union.
- **Contrary / direct collision:** official GHC documentation identifies the existing transformation and its cost-facing parameter bounds. Classic lambda-lifting is the obvious generic kernel, so a new generic cost model cannot be a S6 direct residual.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_SELECTIVE_LATE_LAMBDA_LIFTING_AND_GENERIC_KERNEL`.
- **Reason:** the proposed joint lift-set/environment mechanism is current selective lambda lifting, and any residual framed only as a different threshold, ordering or generic closure-conversion cost model fails the non-generic target-specific contribution requirement.
- **Full-cost if it survived:** compile CPU/RSS/temp; code and interface bytes; allocations/closures; entry/call cost; runtime and GC residency.
- **72h killer:** freeze one public STG-lift test and confirm that a different lift decision is expressible as the documented current transformation/configuration or that its alleged guarantee is generic lambda lifting.
