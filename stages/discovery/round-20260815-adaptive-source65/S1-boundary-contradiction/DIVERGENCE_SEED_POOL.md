# Source65 divergence seed pool

Offline, non-evidence pool frozen before targeted lookup.

| ID | Engine / perspective | Idea and cautious conclusion test | Anchor candidate | Disposition |
|---|---|---|---|---|
| S65-SEED01 | `BOUNDARY_OR_FAILURE`; compiler/runtime engineer | Linux rseq V2 distinguishes legacy and optimized ABI behavior at preemption/signal boundaries. If a same-ABI whole-program construction existed, the cautious result would be a target-specific region/abort guarantee, not a scheduling knob. | Linux Kernel rseq documentation | `KEEP_FOR_CONVERGENCE` |
| S65-SEED02 | `JANUSIAN_TENSION`; OS maintainer | A cgroup freeze makes process state invisible while file-backed writeback may complete later. Could a fixed observable contract admit non-generic publication grouping? | Linux cgroup v2 documentation | `KEEP_FOR_CONVERGENCE` |
| S65-SEED03 | `COMPOSE_DECOMPOSE_SIMPLIFY`; compiler backend engineer | A linker relaxes an address form after register allocation has committed liveness. Could the exact relocation contract yield a target-specific whole-plan algorithm? | ELF psABI / linker documentation | `KEEP_FOR_CONVERGENCE` |
| S65-SEED04 | `NEGATION_OR_INVERSION`; runtime maintainer | A language runtime explicitly cancels a parked computation rather than waiting for it. Could cancellation ownership preserve completion semantics with a non-generic construction? | Java virtual-thread documentation | `KEEP_FOR_CONVERGENCE` |

Four engines/perspectives: advisory `PASS`. S65-SEED01 alone was selected before evidence lookup due to exact official ABI documentation. The other entries remain non-evidence backlog.
