# S94-S1-QC01 — Rust scoped-thread automatic join / TLS-destructor boundary

- Exact public identity: Rust std 1.97.1 `std::thread::scope`, <https://doc.rust-lang.org/stable/std/thread/fn.scope.html>.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; ordinary Rust programs with scoped threads.
- Same-object endpoint: completion of scoped thread main functions, borrowed-data safety and documented TLS-destructor behavior.
- Network-security exclusion: PASS.

## Problem and hypothesis

- Problem: scope return joins thread main functions but does not promise that their TLS destructors have completed.
- Possible insight: a contribution would require a target-specific complete scope-construction that preserves this exact endpoint while changing an intrinsic decision.

## Evidence-qualified raw audit

- Current official locus: `scope` guarantees automatic joins; documentation explicitly says TLS destructors may still be running when the function returns.
- Strongest skeptic: waiting for those destructors changes the lifecycle/return boundary; preserving it leaves generic join scheduling/ordering.
- Minimum falsifier: show a fixed-program action pair with distinct target-specific completion decisions, same automatic-join and TLS endpoint, and a non-generic guarantee.
- Initial full cost: scope-end latency, join CPU/RSS, wake/synchronization, panic propagation, TLS teardown overlap.

## Disposition

- RQ audit: RQ_COMPLETE.
- RAW_REQUIRED audit: INCOMPLETE — no source-supported non-generic discriminator survives the fixed endpoint.
- Closure debt: STRUCTURALLY_UNCLOSABLE for this RQ; not an implementation/result/resource/AI-readiness judgment.
- Disposition: `EXCLUDED_BEFORE_RAW__TLS_COMPLETION_CHANGES_FIXED_LIFECYCLE_OR_REMAINDER_GENERIC_JOIN_SCHEDULING`.
- C0 eligible: NO.
