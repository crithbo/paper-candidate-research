# Same-object RQ versions frozen before evidence

## S01 — `RISCV_ZABHA__FIXED_ATOMIC_SEMANTICS__BYTE_HALFWORLD_LOWERING`

1. With fixed atomic result, memory model, ABI and RISC-V target, can byte/halfword AMO selection be a target-specific construction with a guarantee beyond ordinary lowering?
2. Does retaining a wide-object representation until late lowering expose a same-object algorithmic residual rather than an atomic-semantics change?
3. Is there a formal cost/legality characterization of width-specific AMO lowering that is not a cost-table tweak?

## S02 — `CUDA_CONDITIONAL_GRAPH_NODE__FIXED_GRAPH_SEMANTICS__BODY_COMMITMENT`

1. With fixed graph results and dependencies, can conditional-body commitment be changed by a non-controller constructor with a guarantee?
2. Does device condition publication expose a same-object N1/N2 action beyond graph scheduling?
3. Can conditional graph bodies be optimized under a fixed dynamic behavior without becoming a graph-policy selector?

These versions were written before checking implementation completeness, collision, witness, Q2 mapping, or results.
