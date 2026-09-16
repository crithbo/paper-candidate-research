# RQ candidates — Source34 S2

## RQ-S34-01 — CUDA graph allocation lifetime

Same object: a fixed CUDA graph, node semantics, outputs, dependency relation and repeated launch sequence.

1. Does an algorithm that jointly constructs graph allocation/free lifetimes and dependencies improve whole-path cost under the stock graph semantics?
2. Can it guarantee a target-specific memory/lifetime trade-off beyond the native graph memory-node action union?
3. Is its action distinct from merely toggling nodes or letting CUDA schedule graph nodes?

Selected RQ: 2. Falsifier: current graph memory nodes and graph instantiation already expose the claimed lifetime construction, leaving only scheduling/policy. 

## RQ-S34-02 — Level Zero command-list form

Same object: fixed kernels, copies, dependencies, outputs and device context.

1. Can a target-specific constructor select list boundaries and queue association with an explicit guarantee over latency/throughput?
2. Is the construction not already represented by normal versus immediate lists, list batching and documented driver optimization?

Selected RQ: 2. Falsifier: official specification states the current command-list/queue action union and documents defaults and throughput/latency modes.

## RQ-S34-03 — XLA collective form

Same object: fixed HLO collective program, replica semantics, tensor results and hardware target.

1. Can lowering to async collective provide a new bounded guarantee under transfer-dominated cost?
2. Is the proposal outside current async rewrites, latency-bound thresholds and analytical overlap controls?

Selected RQ: 2. Falsifier: current flag guidance exposes the proposed rewrite/threshold choices as native configuration or compiler behavior.

All three RQs were selected before consulting their official source loci. None may be reformulated after the contrary check.
