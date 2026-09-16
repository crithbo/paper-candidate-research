# All-history five-field identity preflight

Before evidence qualification, a bounded `registry.yaml` and `plan.md` search for `__cxa_guard`, `Itanium C++ ABI`, `guard_acquire`, and static-local initialization terms found no exact recorded string match. This no-match is not a novelty or absence inference.

The considered signature is:

1. object — Itanium ABI guard variable for a fixed local static;
2. action — acquire/initialize/release or abort/retry trace;
3. endpoint — exactly-once completion plus exception-safe non-completion and visibility;
4. guarantee — ABI guard API and first-byte completed marker contract;
5. full cost — guard access, lock/recovery, registration adjacency, CPU, RSS and latency.

No historical exact identity exclusion was applied. All assignment-forbidden sources remain unopened; broad once-initialization resemblance is `RELATED_ONLY` rather than an exclusion.

