# Same-object RQs

The Rust compiler guide documents MIR dataflow for values live across coroutine yields and borrow facts. Primary RQ: for a fixed async Rust crate, target and observable poll/output/drop behavior, can a **coroutine live-set plus state-layout constructor** jointly choose legal saved-local placements and representation variants to certify future-size / poll-memory / compile-cost frontier, while preserving Rust ownership/borrowing and async semantics?

Only target-specific N2 algorithm/guarantee survives; changing captures, manually rewriting async code, allocator control, generic packing or changed drop/poll semantics fails. The alternative RQ asks for an FPT/Pareto guarantee parameterized by live-across-yield interference; it is the same family.
