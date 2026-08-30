# Primary RQ

For a fixed Rust program containing a `#[track_caller]` function, a fixed function-pointer or trait-object coercion, fixed Rust ABI and observable result, can a compiler construction retain caller-location provenance with a non-generic, semantics-preserving guarantee without changing the function-pointer representation, virtual-call contract, or documented location-hint endpoint?

Contribution hypothesis would have been N1/compiler-runtime only: an explicit target-specific provenance representation whose use is legal under the unchanged dynamic-call ABI. The counterfactual is not merely “show a better diagnostic”; it would have to produce a distinct legal realization for the same indirect-call object without making the hidden parameter part of the function-pointer type.
