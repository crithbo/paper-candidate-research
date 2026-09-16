# Source42 RQ candidates

## RQ-42-02 — QNN shared-weight context construction

Fixed object: a versioned set of QNN graphs with the same tensor semantics, common weights, context-binary contents and output values.  
Versions formed before lookup: (A) target-specific shared-weight context constructor; (B) same-context construction with a bounded ROM/RAM-plus-setup guarantee; (C) existing context-binary feature selection.  
Selected question: is (A)/(B) beyond current QNN action union? Contrary route: current QNN documentation and QNN Weight Sharing Feature note. Outcome: no—weight sharing across up to 64 graphs and its binary-generation call flow are already native.

## RQ-42-03 — XLA GPU collective-pipeline construction

Fixed object: the same StableHLO module, shapes, sharding, output semantics and accelerator target.  
Versions: (A) compiler action that jointly forms pipeline segments and buffer lifetimes; (B) bounded Pareto construction over compile/memory/communication; (C) current overlap/pipeline option selection.  
Selected question: can (A) survive the current XLA pipeline/scheduler union? Contrary route: current XLA flags, effort-level and architecture documentation. Outcome: no target-specific whole action was frozen; pipeline, latency-hiding, combiner and scheduling actions are already native, and the stated residual reduces to selection/configuration.

## RQ-42-04 — oneDNN compiled-partition scratchpad/materialization

Fixed object: oneDNN graph, logical tensors, partitioned operation semantics, target engine and output values.  
Versions: (A) target-specific joint partition/layout/scratchpad constructor; (B) same graph with bounded setup-plus-execution memory guarantee; (C) current partition compiler and scratchpad/in-place choices.  
Selected question: can (A) be made non-generic outside the current union? Contrary route: current oneDNN Graph/compiled-partition/scratchpad documentation. Outcome: no: native compilation chooses opaque layouts; in-place pairs and both scratchpad lifecycles are exposed. A putative remaining planner is generic packing/allocator policy.

`RQ-42-01` was excluded before locator by global terminal identity preflight; no evidence lookup was performed for it.
