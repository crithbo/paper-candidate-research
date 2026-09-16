# Source29 S2 divergence seed pool

Offline, non-evidence generation completed before lookup; network-security exclusion `PASS`.

| seed | engine / role | sketch | pre-evidence result |
|---|---|---|---|
| S29-01 | BISOCIATION / compiler engineer | Fixed ESIMD kernel ABI may couple accessor lowering and runtime argument materialization. | selected |
| S29-02 | CONSTRAINT_MANIPULATION / NPU architect | Fixed AIE instruction stream could couple DMA descriptors and buffer lifetime. | selected |
| S29-03 | COMPOSE_DECOMPOSE / runtime engineer | Fixed XRT AIE graph may couple ping-pong BO construction and graph execution. | selected |
| S29-04 | ADJACENT_BOUNDARY / accelerator architect | Command graphs may shift work from submission to memory materialization. | selected |
| S29-05 | NEGATION / operator | Intel GPU register allocation modes may trade compile time for memory pressure. | excluded: flag grid |
| S29-06 | JANUSIAN / backend engineer | ESIMD LSC cache hints and portable ABI conflict. | variant of S29-01 |

Six engines and five roles are represented. No seed makes a novelty/absence/quality claim. Source28 AMX, UPMEM, NVDLA, ROCm DME/LDS, SYCL image split and CUDA TMA identities are excluded before convergence.
