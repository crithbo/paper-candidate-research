# S6-EGRAPH-LIVEEXTRACT User Review Packet

## Bottom line

Decision recommendation: `REVISE_ONCE`, not PASS and not STOP.

The bounded exact probe found one real, replayable formal witness: at peak-live budget 15, joint extraction/scheduling costs 30 versus 32 for runtime-first and 34 for memory-first. The result reproduces exactly across two runs. This shows the coupling mechanism is possible.

It is not yet a natural compiler result. The one pinned public `eggcc-bril` projection had only one extraction and used synthetic unit output sizes, so it could not test the central natural headroom. A Stage A PASS would therefore relax the project's natural-evidence and full-cost gates.

## What to inspect

1. `RESULTS.md`: exact witness, negative region, costs, and claim ceiling.
2. `EXPERIMENT_CONTRACT.yaml`: frozen object, allocation convention, controls, inputs, and stop rules.
3. `results/run1.json` and `results/validation.json`: machine-readable trace and reproduction verdict.
4. `Q1_COMPARATOR_MATRIX.md`: why Tier A remains only a structural ceiling.
5. `COMMAND_LOG.md` and `HASH_MANIFEST.sha256`: replay and integrity.

## Requested Stage A revision gate

Obtain at least one pinned public compiler e-graph with multiple reachable alternatives and backend-valid operation/output-size mapping. Under the same roots, closure, semantics, allocation convention, and `B`, rerun both exact sequential controls and the joint oracle. The revision passes only if it produces a natural strict witness or a defensible structural/theoretical increment while including all critical costs. A dominated natural result or a boundary-changing benefit means STOP.

## Authority status

- Stage A revision: recommendation only; mainline must register it.
- Independent Stage A gate: not yet passed.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B approval: absent.
- Stage B execution: forbidden.

