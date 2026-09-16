# Action-space / collision matrix — WAVE12

## Frozen object, function and cost boundary

**Exact object:** a Linux eBPF program that is accepted by the kernel safety verifier and then JIT-compiled to execute at the same eBPF hook.

**Same-function / guarantee:** preserve eBPF-visible program behavior and the kernel verifier's safety/termination admission semantics; do not replace the program with an unverified userspace service, relax verifier acceptance, or compare a source-only language against a different runtime object.

**Full-cost ledger:** userspace lowering/recognition; certificate/proof creation and bytes; in-kernel verifier/proof-check time and memory; JIT/native code size and compilation; module/descriptor TCB boundary; hook execution latency/throughput; architecture portability; and fallback behavior when an extension is unavailable.

## Current strong mechanisms

| Work | Same object / information | Joint atomic action | Guarantee and cost boundary | Role |
|---|---|---|---|---|
| VEP, NSDI 2025 | eBPF program plus annotations, compiler output and proof data | Annotated source/bytecode compilation + lightweight bytecode proof checking | Verifier-side correctness under annotated semantics; toolchain/checking cost | Current proof/checker route. |
| Kops, 2026 | Verifier-admitted eBPF bytecode, proof sequence and per-architecture descriptor | Recognize pattern; lower extended action to vanilla proof sequence for the existing verifier; restore it to native emit for JIT | Existing verifier re-checks every load; native emit is explicit TCB addition; measures execution/code-size cost | Current compilation–proof–native-emission route. |
| K2, official project | Same eBPF bytecode and final Linux checker | Safety-aware program synthesis/optimization with final kernel-checker admission | Same runtime object and kernel safety checker; source/artifact available | Strong optimization baseline. |
| BeePL, 2025 | eBPF-targeting source program and verified compiler | Verified type discipline + semantics-preserving checks during compilation | Source-level correctness route; not silently unioned with in-kernel mechanisms | Counter-mechanism / boundary source. |

VEP and Kops share the required exact execution object, safety goal and relevant compilation/verifier information. Their union is used only for compatible actions; it does not claim that their implementations can be deployed together unchanged.

## Residual subtraction

| Apparent transferred bottleneck | Candidate joint action considered | Fair current subtractor | Can a compatible union express it? | Fidelity result | Decision |
|---|---|---|---|---|---|
| Compilation → proof/checker | Emit a certificate alongside a lowering so the verifier admits a more optimized program | VEP's compiler + bytecode proof checker | Yes | Not a missing checker/interface; action is already present | `DROP_DIRECT_ABSORPTION` |
| Verifier → native JIT/layout | Associate a verifier-checked representation with an architecture-native realization | Kops proof-sequence lowering/restoration + native descriptor | Yes | A Stage A native descriptor/witness would merely instantiate Kops's action | `DROP_DIRECT_ABSORPTION` |
| Optimization → safety admission | Search or select safe lowerings whose final output passes the kernel checker | K2 final-checking optimization; Kops when a native operation is required | Yes for the named joint action | Choosing among already-defined candidates is a selector/policy | `DROP_FORBIDDEN_SELECTOR` |
| Source typing → verifier metadata | Add source annotations/type metadata to avoid verifier work | BeePL and VEP | Yes at their respective semantic level; cross-level comparison cannot be silently made | No same-object union-external atom | `DROP_DIRECT_ABSORPTION` |

## Fidelity-closure conclusion

No retained topic is assigned `READY_TO_CLOSE_IN_STAGEA`, `FINITE_FIDELITY_GAP`, `HUMAN_CORE_FIDELITY_GAP`, or `RESOURCE_BLOCKED_FIDELITY_GAP`, because none survives the structural action-gap test.

Had a union-external action existed, the finite closure plan would have required: (1) an exact eBPF action interface; (2) native Linux verifier and JIT semantics; (3) a common full-cost denominator; (4) a small verifier-admitted eBPF witness whose native behavior is equivalence-checkable; and (5) a finite kernel/module/architecture execution path. Those requirements are finite in principle, so missing code would not be fatal. Here, however, they cannot distinguish a new action from current mechanisms; a `FINITE_FIDELITY_GAP` label would be misleading.

No claim of search-bounded novelty is made. The decision comes from identified direct subtractors, not absence of search results.
