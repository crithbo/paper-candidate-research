# Question card

## QC01 — Rust caller-location / indirect-call ABI seam

- Exact public identity: the Rust Reference `#[track_caller]` contract plus a fixed Rust-ABI indirect call through a function pointer or trait object.
- Same-object endpoint: the same function type, call result, panic/exception boundary, and documented caller-location-hint semantics.
- Candidate claim: N1 only if the implicit caller-location payload can be retained across the fixed coercion by a new non-generic representation without changing the ABI/type contract.
- Current locus and contrary: the reference gives the exact coercion shim and says it is necessary because the hidden parameter is absent from the pointer type; E0737 limits implicit receipt to Rust ABI.
- Natural carrier: public Rust crates using `Option::unwrap`/assertion-style caller tracking and indirect callbacks; a Stage 0 route could pin Cargo registry/crate revisions and rustc revision, but no material was acquired here.
- Full-cost: rustc CPU/RSS, object/code/data bytes, indirect-call cost, metadata size, and caller-location fidelity at the specified observer.
- Minimum falsifier: any design that adds the parameter to pointer layout, changes virtual dispatch/ABI, or merely selects an existing shim changes the frozen object or is a wrapper.
- Finite fidelity route: pin one rustc and one crate call graph; enumerate direct, fn-pointer and trait-object lowering; verify ABI/object output and observed caller location on a two-call witness. Kill if the candidate needs a changed function-pointer type or is representable as the current shim.
- Decision: `KNOWN_FATAL__SAME_OBJECT_HAS_NO_FREE_COMPLETE_ACTION`. The current contract identifies the apparent residual as an intentional ABI/type boundary; retaining the actual callsite requires changing the function-pointer representation or the documented hint behavior. It cannot enter raw as a same-object N1/N2.
