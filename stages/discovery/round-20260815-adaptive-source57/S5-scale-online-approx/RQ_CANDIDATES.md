# Source57 S5 RQ convergence

## S57-01 GNU make remake/restart

- Exact public anchor: GNU Make 4.4.1 manual, Remaking Makefiles, official
  documentation accessed 2026-08-15.
- Stable object/guarantee: fixed makefile/include/source state and the same
  target bytes, diagnostics, prerequisite semantics, and recipe execution
  contract.
- Primary RQ: Can an online bounded-recourse constructor maintain a changed
  included-makefile state while retaining make's same rebuild result and
  reducing re-read/restart/full-build cost without selecting an alternative
  build order or recipe?
- Result after ordinary closure: current native remake/re-read semantics leave
  only generic graph scheduling or changed build semantics.

## S57-02 Ninja dyndep graph extension

- Exact public anchor: Ninja manual current dynamic-dependencies reference,
  official documentation accessed 2026-08-15.
- Stable object/guarantee: fixed build.ninja/dyndep inputs and the same
  declared/implicit inputs, outputs, diagnostics, and produced bytes.
- Primary RQ: Can a bounded-recourse dyndep state constructor update the native
  graph after discovery while preserving the one-to-one dyndep statement
  contract and reducing graph/rebuild cost without becoming a generator or
  scheduling policy?
- Result after ordinary closure: dynamic graph insertion is already the native
  action; remaining variation is generator or policy.

## S57-03 Bazel Skyframe

- Exact public anchor: official Bazel Skyframe documentation.
- Identity preflight: exact historical Source53 S5 identity
  BAZEL_INCREMENTAL_BUILDGRAPH_RECOURSE, with no external evidence delta.
- Disposition: EXCLUDED_BEFORE_RAW__EXACT_HISTORICAL_IDENTITY. No RQ was
  reopened.

