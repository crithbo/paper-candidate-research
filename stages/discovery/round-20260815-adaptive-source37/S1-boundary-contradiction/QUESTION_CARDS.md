# Evidence-qualified question cards

## Q37-01 — Zabha lowering

- Exact identity: a fixed RISC-V program, byte/halfword atomic observable behavior and memory model, ABI, target including Zabha.
- Contribution type: `COMPILER_TOOL` (possible N2 only).
- Endpoint and counterfactual: improve a stated compiler-side full-cost measure while preserving behavior; otherwise stock lowering produces the same semantics.
- Current-source locus: LLVM main documentation lists Zabha as supported; Stage0 would need a pinned source-level pass/config enumeration.
- Minimum falsifier: all claimed choices reduce to ordinary instruction selection, legalization, or target-cost adjustment.
- Natural carrier/closure: LLVM RISC-V compiler tests plus atomics programs; assembler/disassembler and architecture memory-model oracle. Full cost: compile CPU/RSS, bytes, instruction/static-uop cost and runtime atomic cost. A finite Stage0 check can pin source and compare generated forms.
- Result: `NOT_ADMITTED_UNFROZEN`. The basic question card is complete, but a non-generic whole action/guarantee is not yet named. No complete union/collision/witness is claimed at RQ stage.

## Q37-02 — CUDA conditional graph body

- Exact identity: a fixed CUDA graph dependency/result contract, conditional-node type/handle semantics and fixed device context.
- Contribution type: `SYSTEM_ARCHITECTURE` (possible N1/N2 only).
- Endpoint and counterfactual: preserve graph behavior while changing a complete graph-body construction; otherwise stock graph creation/conditional execution is used.
- Current-source locus: CUDA guide and Runtime API conditional-node parameter surface.
- Minimum falsifier: candidate solely chooses condition, thread, or body execution policy.
- Natural carrier/closure: official CUDA graph examples/public graph workloads; runtime API legality oracle. Full cost: graph construction/instantiation/update CPU-RSS, memory and GPU runtime. A finite Stage0 check can pin documentation/API revision and enumerate legal body actions.
- Result: `STRUCTURAL_DROP`. Official documentation defines the node as device-evaluated IF/WHILE/SWITCH control flow. No non-controller action survives the initial type route; this is a structural finding, not a result/resource inference.
