# S1 Wave6 baseline-residual-first action-space matrix

- Assignment: `DISCOVERY-S1-20260809-V8.4-WAVE6`
- Cutoff: 2026-08-09.
- Method: accepted production `v2/v8.1` only; TLS-blocked two-axis `v8.2r2` was not used.
- Excluded before screening: eBPF, STREAMBUS, AMD taxonomy/ISA-backend, Git-pack forest, PB deletion, and S4 pagepack objects.
- Result: `ZERO_PROPOSALS`.

| Public natural object | Strongest union frozen first | Candidate residual tested outside union action space | Result |
|---|---|---|---|
| MLIR source-to-source transformations on PolyBenchC and real `mlir-opt` transformations | [HEC, ATC 2025](https://www.usenix.org/conference/atc25/presentation/yin): MLIR graph translation, static/dynamic e-graph rewrite, loop/control and datapath equivalence checking; relevant deployment union includes MLIR verification and its identified real bugs. | A verifier for “additional transformations,” a rule generator, or a report/checker remains in HEC’s action space. No new information condition, semantic contract, proof object, or finite corpus-driven falsifier outside that union was found. | `DROP`—strong baseline union structurally absorbs all screened actions; checker variants prohibited. |
| DNN/LLM graphs with layout, reshape, transpose, slice, and other data-movement operators | [VTC, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/hu-muyan): virtual tensors, index mappings, profitable-creation algorithm, arbitrary operator composition, existing-kernel interoperability. | A layout-elision/fusion/metadata selector is inside VTC’s full-spectrum movement-elimination action space. A different backend would change the object, and a heuristic would be routine tuning without a changed constraint or guarantee. | `DROP`—`DIRECT_FATAL` for generic compiler data-movement elimination. |
| Commodity NVIDIA/AMD GPU workloads with dynamic fine-grained allocation | [MoonBright, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/zhang-yangyu) and [upstream artifact](https://github.com/MoonBright-project): host validation metadata, device-side page-table construction, fresh-address mapping, deferred TLB coherence. | Host/device page-table work splitting, address freshness, and avoiding common-path shootdowns are already one coherent allocator action space. A replacement policy or a TLB controller would be a prohibited selector/controller. | `DROP`—same-object union absorbs prospective mechanism. |
| Multi-GPU tensor-program inference with cross-operator dependency/communication overlap | [MPK/Mirage, OSDI 2026](https://www.usenix.org/conference/osdi26/technical-sessions) with [upstream artifact](https://github.com/mirage-project/mirage): SM-level task graphs, cross-operator pipelining, decentralized in-kernel scheduling, persistent mega-kernel execution. | Kernel fusion, persistent scheduling, overlap, or task-graph “improvement” is within the current union. Restricting to a different model/backend would be an application/backend rename, not a residual. | `DROP`—same-object mechanism family occupied. |

## Baseline-residual conclusion

For every natural corpus, the strongest fair union was defined before proposing an action. No screened lead changed the exact object while leaving an atomic decision variable, constraint/guarantee, full-cost ledger, and finite Stage A falsifier outside that union. Nothing is dropped for unavailable resources, missing implementation, or AI readiness.

No retained topic means no structural-paper-potential/current-evidence-readiness pair or Stage A killer is emitted.
