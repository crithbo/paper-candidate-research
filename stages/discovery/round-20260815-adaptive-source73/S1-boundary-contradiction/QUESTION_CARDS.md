# Question cards

## QC-S73-01 — libstdc++ atomic wait pool

| Required field | Frozen value / disposition |
|---|---|
| Exact identity | current libstdc++ atomic/atomic_wait headers and C++20 atomic wait endpoint |
| Carrier | implementation carrier; public C++ concurrent programs would be used only after a mechanism survives |
| Same-object problem | waiter-pool sharing among atomic object addresses |
| Endpoint | same value-change return and memory-order semantics with non-worse CPU/RSS/latency/wake work |
| Current locus | `_S_for(address)` pool mapping and `_M_notify` path |
| Minimum falsifier | proposed action is address hashing/pool sizing or wake scheduling/controller, not a target-specific semantic construction |
| Full cost | wait/notify CPU, latency, spurious/extra wakes, pool memory, code size; not measured |

**Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_CONTROLLER_OR_MAPPING_KERNEL`.** The address-to-pool choice is implementation-private shared-resource placement. Retaining the standard endpoint leaves only a hash/pool mapping, pool size, or notification policy; these are generic controller/allocation actions. Altering the mapping's observable wait semantics violates the fixed object contract. No target-specific N1/N2 action survives.
