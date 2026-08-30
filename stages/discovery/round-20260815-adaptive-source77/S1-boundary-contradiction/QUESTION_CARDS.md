# Question card

## QC01 — Rust niche layout / fixed C ABI seam

- Exact identity: a fixed target Rust `repr(C)` enum/struct exported to a fixed C reader/caller.
- Same-object endpoint: identical byte-level C representation, size, alignment, discriminant/validity observations, call ABI and functional values.
- Candidate contribution: N1 only if an alternative compiler-level layout survives all of those fixed observations and has a non-generic guarantee.
- Current/contrary locus: the Reference's explicit C-layout algorithm and its statement that default Rust representation has no other layout guarantees; the Nomicon requires `repr(C)` for FFI layout compatibility.
- Natural carrier: public Rust C-ABI libraries and bindgen/cbindgen-compatible examples; a later Stage 0 could pin crate, target and C harness revision. No carrier was acquired or run.
- Full-cost: compile CPU/RSS, emitted bytes/data layout, foreign call/read cost, alignment/padding and ABI oracle cost.
- Minimum falsifier: a plan that changes representation attribute, size/alignment, tag placement, foreign bytes, or validity endpoint changes the object. A plan leaving all fixed C layout observations unchanged has no stated free niche/layout decision.
- Finite fidelity route: pin rustc/target and a C-ABI crate; enumerate `repr(C)` layout plus emitted ABI for a two-variant witness, compare C `sizeof`/offset/read observations. Kill on changed ABI/bytes or collapse to the prescribed layout algorithm.
- Decision: `KNOWN_FATAL__C_ABI_LAYOUT_CONTRACT_LEAVES_NO_SAME_OBJECT_NICHE_ACTION`. The intended Rust-layout freedom belongs to the default representation; importing it across the fixed `repr(C)` boundary changes the contract. It cannot enter raw.
