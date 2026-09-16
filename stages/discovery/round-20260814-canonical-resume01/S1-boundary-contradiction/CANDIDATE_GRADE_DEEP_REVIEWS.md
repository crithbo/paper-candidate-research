# Candidate-grade deep reviews

## D01 — LLVM OpenMP libomptarget plugin/target-entry lifetime

- Exact object: an OpenMP offload executable's libomptarget target-entry and plugin lifetime, with fixed host program, offload triples, target-region identity, and observable target-region results.
- Initial actions: (a) stock eager registration/initialization and teardown, (b) a hypothetical demand-driven, ownership-preserving entry/plugin lifetime construction. Both must preserve registration/unregistration and target-region visibility.
- Current union checked: OpenMP IR-builder target-region identifiers and `requires` flags; OpenMPOpt's linked-runtime availability check; documented build/runtime selection paths. The available source shows several composition points, but the bounded material does not yet establish every plugin runtime, default/non-default option and teardown path.
- Strongest fair union: current Clang OpenMP code generation + current libomptarget runtime/plugin behavior, with any documented offload configuration that retains the identical host/device program semantics.
- Natural carrier and oracle: public LLVM OpenMP target tests plus the runtime's registration/target-entry diagnostics would be the proposed finite carrier/oracle. This remains a route, not a result.
- Full cost: host compilation CPU/RSS, target image/code bytes, registration/unregistration work, cold-start latency, target-launch latency, host RSS, and any added persistent plugin state.
- Direct collision: bounded official-source search found an upstream issue discussing initialization/teardown ordering, not a paper/current implementation proving a non-controller joint constructor. The issue is not used as absence evidence.
- 72-hour killer: first enumerate the actual libomptarget registration/initialization/unregistration call graph and all relevant build/runtime switches; DROP if a native configuration already expresses the complete demand-driven construction, or if preserving unregister semantics requires changing the object/guarantee.
- Disposition: `NOT_ADMITTED_UNFROZEN`, not scientific DROP. No brief: Q2 contribution shape, current union, and complete proposed action are insufficiently frozen.

## D02 — systemd notify readiness boundary (negative control)

- Fixed object: a service's readiness notification and manager-visible active state.
- Candidate alternatives reduce to notification timing, restart policy, or manager scheduling. They do not yield a target-specific constructor with a fixed same-object guarantee.
- 72-hour killer is static: if the contribution can be implemented as `Type=`/`NotifyAccess=`/restart configuration or an external supervisor, it fails the non-controller gate.
- Disposition: `STRUCTURAL_DROP` for controller-only action, independent of implementation/readiness/resources.
