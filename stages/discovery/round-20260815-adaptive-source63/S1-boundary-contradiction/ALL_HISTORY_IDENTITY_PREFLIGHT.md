# All-history five-field identity preflight

Lookup surface: current `registry.yaml` and `plan.md`, frozen at assignment start.

| Historical entry checked | Object | Action/estimand | Endpoint | Guarantee | Full-cost | Relation / result |
|---|---|---|---|---|---|---|
| Source61 OpenMP detach (plan summary) | explicit detached task/event vs target offload task | task completion scheduling | completion | OpenMP task semantics | runtime scheduling cost | `RELATED_ONLY`; do not exclude. This assignment uses a target-offload boundary, but that distinction does not rescue the generic-shell test. |
| GCC genautomata terminal STOP | different compiler automaton object | different | different | different | different | held terminal; not read or reopened. |
| Source55 MIPS FCSR queue | different ISA state | different | different | different | different | held; not read. |
| Source58 Wasmtime post-return queue | different Component ABI cleanup object | different | different | different | different | held; not read. |
| Source59 glibc TLSdesc queue | different ELF/runtime ABI object | different | different | different | different | held; not read. |

Mechanical disposition: `RELATED_ONLY_DO_NOT_EXCLUDE`. No-match/related status is not an inference of novelty.
