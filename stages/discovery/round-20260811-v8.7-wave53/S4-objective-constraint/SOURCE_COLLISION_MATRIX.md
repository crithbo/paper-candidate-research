# Source and current-union matrix

Cutoff: `2026-08-11`. Sources are official USENIX OSDI/NSDI records. For all rows, `CURRENT_UPSTREAM_REALITY_CHECK` is satisfied by a positive documented current action: none claims an action is missing, so a source/flag absence assertion is not used.

| Family | Current documented action | Same-object full-cost union | Fidelity outcome / decision |
|---|---|---|---|
| SPICE-SHELF-RESTORE | SHELF + `spliceVMA` + bulk restore | snapshot layout, I/O, faults, copies, VMA/metadata restore | direct current joint constructor; `DROP` |
| ARCA-CONTINUATION | capture/pause/migrate/copy portable continuation | capture, movement, resume, dependency wait, state/isolation | same-action replay; `DROP` |
| FALCONFS-STATELESS-METADATA | hybrid server index, lazy replication, merge | metadata/replication/network/VFS/file I/O | direct current joint constructor; `DROP` |
| ZIPLLM-LOSSLESS-LAYOUT | cluster + tensor dedup + BitX | bytes, metadata, build, read, decode, exact recovery | direct current joint constructor; `DROP` |
| LADR-CLOUD-GAMING-RECOVERY | loss/delay CC + RACK-TLP + FEC | loss/retransmit/FEC/deadline/compute | complete recovery constructor; `DROP` |
| MAE-VIDEO-ENCODER | CC-aware encoder adaptation | quality/bitrate/stall/probe | same controller action; `DROP` |
| BURST-SOFT-RDMA | verbs/DPDK/DSA/bypass CM path | CPU/DSA/I/O/setup/message semantics | complete protocol/data path; `DROP` |
| FENIX-INNETWORK-ML | token bucket + feature/DNN engines | ASIC/FPGA/token/accuracy/latency | existing joint system; `DROP` |
| CORTEX-SEMANTIC-CACHE | SE/Seri/judger/evict/prefetch | remote cost/embedding/judger/semantic accuracy/latency | current cache interface/controller; `DROP` |
| TITRATE-QUEUE-CONTROL | closed-loop threshold update | delay/drop/throughput/update cost | controller replay; `DROP` |

The union is finite and compatible, not an omniscient union. No failure to obtain code, trace, experiment, native output, or hardware was used as a scientific negative conclusion.
