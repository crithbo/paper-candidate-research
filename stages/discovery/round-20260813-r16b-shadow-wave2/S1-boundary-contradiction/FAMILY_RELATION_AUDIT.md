# Append-only family-relation audit — mainline correction

## Compared signatures

- R16A S1 F01: `CPYTHON_IMPORT_PREEXEC_PUBLICATION_FAILURE_REMOVAL`.
- R16B S1 F03: `CPYTHON315_LAZY_IMPORT__PROXY_FIRST_USE_PUBLICATION__FAILURE_AT_USE__FIXED_IMPORT_TRACE__PYTHON315_UNION__CPU_RSS`.

## Relation

`CONDITIONAL_SPECIALIZATION` (historical repeat; not independent).

Both concern CPython's import object and the same core loader publication/recovery guarantee: a module's `sys.modules` visibility and failure cleanup. Python 3.15 changes when that existing import path is triggered (proxy/first use) and adds mode/filter controls; it does not freeze a different research object, independent native action, or a stronger/different recovery guarantee. The first-use timing is a conditional deployment regime within the already sampled import-publication family. Therefore R16B F03 cannot count toward four new opportunity families.

No completed file has been altered. The proposed duplicate-only replacement is reserved before any replacement canonical seal:

`GIT_SEQUENCER__TODO_PROGRESS_PUBLICATION__CONTINUE_ABORT_RECOVERY__FIXED_WORKTREE_HISTORY__GIT_UNION__CPU_RSS_LATENCY`

Its intended object is Git sequencer state for a fixed worktree/history and conflict trace, not Git pack/object construction. Its native alternatives are continue after resolved conflict versus abort/recover to pre-sequence state; exact current source/docs, direct collisions, full cost, and a finite closure route remain to be checked before canonical treatment.

## Additional mainline family-graph check — once initialization

### F01 Itanium C++ guard versus R16A Rust `Once`

Relation: `ALTERNATE_MECHANISM`, not a relabel. Predicate comparison: (1) object differs—compiler-emitted ABI guard for one function-local static versus library-owned generic `Once`; (2) problem differs—ABI-correct initialization/destructor registration versus user-selected closure coordination; (3) action differs—`__cxa_guard_acquire/release/abort` on an 8-byte guard versus `call_once/call_once_force`; (4) recovery differs—C++ abort releases uncompleted initialization for retry, whereas Rust records poison and requires an explicit force path; (5) guarantee differs—C++ ABI exactly-once local-static initialization and destructor registration versus Rust's documented poison/happens-before contract; (6) comparator/full cost differs—compiler-generated guard/code-size/ABI calls versus Rust std state, wakeups and closure behavior. It is therefore not EQUIVALENT/CONTAINS/CONDITIONAL_SPECIALIZATION.

### F02 C++ `call_once` versus R16A Rust `Once`

Relation: `ALTERNATE_MECHANISM`, not a relabel. (1) object is a C++ `once_flag` with arbitrary concurrent invocation; (2) exceptional calls leave its flag unset, followed by a returning call, while Rust's `Once` poison is observable and subsequent ordinary calls panic; (3) recovery action is automatic retry after C++ exception versus explicit `call_once_force` in Rust; (4) the C++ total-order/synchronizes-with guarantee differs from Rust poison-state semantics; (5) fair baseline and costs include C++ exception/unwind/retry behavior, unlike Rust force/poison state. No source supports treating either primitive as a contained implementation of the other.

### F01 versus F02

Relation: `CONDITIONAL_SPECIALIZATION` only at the abstract “one-time initialization” label, but `INDEPENDENT` as an opportunity-family signature because F01 freezes a compiler/ABI/local-static/destructor object and F02 freezes a standard-library/exceptional-call/flag publication object. The action, information boundary, guarantee and full-cost denominator are not interchangeable. No replacement reservation is required by this check.
