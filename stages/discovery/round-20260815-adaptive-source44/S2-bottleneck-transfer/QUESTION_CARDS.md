# Evidence-qualified question cards

## QC44-01 — HIP virtual-address-stable dynamic device buffer

- **Exact identity / same object:** a fixed logical byte sequence and fixed device-visible virtual range using HIP virtual-memory calls; address stability, values and access permissions must remain unchanged.
- **Endpoint and consequence:** reduce whole update cost after ordinary allocation/copy has become costly, without changing pointer observables. A negative result is direct absorption by an existing same-function virtual-memory constructor or reduction to a generic allocator.
- **Non-generic discriminator / proposed atomic action:** choose a sequence of physical-handle partitions plus `hipMemMap`/unmap transitions for a fixed virtual range, with a recourse (mapped bytes/operations) guarantee under a fixed update trace. It is not a pool flag or prefetch selector.
- **Current source locus:** current HIP virtual-memory documentation lists separate `hipMemCreate`, `hipMemAddressReserve`, `hipMemMap`, `hipMemSetAccess`, unmap and release actions; ROCm `rocm-examples` identifies the versioned `virtual_memory` example.
- **Fair comparator / initial full-cost boundary:** stock HIP VMM calls with the same allocation trace, permissions and address contract. Cost starts at create/reserve and includes handle/map/unmap/access calls, copied bytes, update CPU, GPU synchronization, resident bytes/fragmentation, temporary storage and application latency.
- **Carrier / oracle:** deterministic official `ROCm/rocm-examples` HIP-Doc `Virtual-Memory-Management/virtual_memory` plus its fixed logical buffer checks; Stage0 must freeze a commit and a natural mutation trace before empirical claims.
- **Minimum falsifier and finite closure:** audit one current HIP commit and the example, then compare against GMLake's virtual-memory stitching and a target-specific recourse formulation. Stop if the formulation is generic allocation/packing or loses virtual-address equivalence.
- **Bridge disposition:** `KNOWN_FATAL` (not a missing implementation/result/resource): GMLake already supplies a virtual-memory-stitching allocator mechanism; the remaining formulation has no frozen HIP-specific discriminator beyond a portability/reimplementation of virtual mapping.

## QC44-02 — Vulkan `VK_EXT_device_generated_commands`

- **Exact identity / same object:** fixed indirect command stream, execution set, indirect command layout and resulting device commands under one Vulkan device.
- **Endpoint and consequence:** reduce whole preprocess plus execute cost without changing command order, shader binding or output. A negative result is that declared token/layout/preprocess requirements express the whole action.
- **Non-generic discriminator / proposed atomic action:** joint token-layout and preprocess-buffer construction. It is not admitted if it is only order/packing of declared tokens or allocation sizing.
- **Current source locus:** Khronos current manual pages define `VkIndirectCommandsLayoutEXT`, `VkIndirectExecutionSetEXT`, and `vkGetGeneratedCommandsMemoryRequirementsEXT`, including maximum sequence/draw constraints and required handles.
- **Fair comparator / initial full-cost boundary:** stock extension layout/execution-set/memory-requirement calls with identical commands. Full cost: host layout creation, preprocess CPU/GPU, preprocess bytes/RSS, temporary buffer, command execution and latency.
- **Carrier / oracle:** a version-pinned Khronos extension conformance/validation route with stock validation and command-output equivalence; it is a canonical implementation carrier, not a performance result.
- **Minimum falsifier and finite closure:** two legal layouts for one fixed token stream; reject if no target-specific guarantee exceeds generic packing or the stock extension already expresses the construction.
- **Bridge disposition:** `KNOWN_FATAL`: the only closed action is declared layout/memory configuration; no target-specific N1/N2 mechanism survived.

## QC44-03 — HIP captured graph allocation-node lifecycle

- **Exact identity / same object:** fixed HIP graph nodes, dependencies, memory effects and completion behavior.
- **Endpoint and consequence:** after graph capture amortizes launch cost, reduce allocation/copy materialization cost without changing graph completion semantics.
- **Non-generic discriminator / proposed atomic action:** a graph-owned allocation-node/copy construction; generic node ordering/update policy is explicitly disallowed.
- **Current source locus:** current ROCm HIP Graph guide documents kernel, memcpy, memset, dependency and individual node-update APIs; HIP documentation says stream-captured allocation becomes a graph-owned allocation node.
- **Fair comparator / initial full-cost boundary:** stock graph capture/creation/update with identical dependencies and memory effects; capture/build/update CPU, allocation/copy bytes, graph memory/RSS, launch and end-to-end latency.
- **Carrier / oracle:** current official HIP graph creation tutorial with native graph dependencies and observable completion.
- **Minimum falsifier and finite closure:** enumerate graph-owned allocation node forms on one official tutorial graph; reject if construction is a graph scheduler/controller or a direct replay of node APIs.
- **Bridge disposition:** `KNOWN_FATAL`: current node and update union leaves only generic graph-policy composition.
