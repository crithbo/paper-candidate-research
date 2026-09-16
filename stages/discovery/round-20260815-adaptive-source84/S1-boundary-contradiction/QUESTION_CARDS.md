# Question cards

## QC01 — fork callback ordering and child-state visibility

- Exact identity: one `pthread_atfork` registration set and its prepare/parent/child callbacks.
- Carrier: `NATURAL`; multithreaded library/application fork path.
- Same-object problem: reduce callback/synchronization cost without changing handler side effects, post-fork locks, parent/child visibility, or registration contract.
- Contribution considered: N2 callback grouping/order constructor.
- Current/primary loci: POSIX atfork standard locator, official glibc 2.43 manual, and glibc source lineage.
- Current semantic union: prepare callbacks establish the pre-fork state and parent/child callbacks restore their respective state; `_Fork` skipping callbacks is a distinct API/guarantee.
- Configuration check: no default/non-default flag creates an alternate same-contract handler ordering; handler registration/order is the observable interface.
- Strongest skeptic: reordering or grouping callbacks changes lock acquisition/release side effects in parent or child; leaving the trace unchanged is generic callback/lifetime administration.
- Minimum falsifier: two callbacks whose prepare/child lock actions are order dependent. An alternate order changes observable post-fork lock state; identical order is the current callback trace.
- Finite closure: standard/manual/source-check route. The POSIX browser 403 remains a bounded transport fact, not an exhausted or scientific conclusion.
- Initial full cost: callback CPU, lock/synchronization, fork pause, retained resources, child recovery, and end-to-end fork latency.

Disposition: `EXCLUDED_BEFORE_RAW__CALLBACK_ORDER_IS_OBSERVABLE_OR_GENERIC_LOCK_LIFETIME_CONTROL`.
