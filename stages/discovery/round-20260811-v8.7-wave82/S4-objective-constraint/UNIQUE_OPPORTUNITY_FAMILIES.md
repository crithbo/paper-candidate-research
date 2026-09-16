# Same-object coupled-constraint contracts

| Family | Exact action / primary quality | Fair union and full-cost denominator | Natural or formal route | Result |
|---|---|---|---|---|
| POWER | Same persistent KV/notary behavior; guarantee crash consistency and corruption detection. | PoWER preconditions, corruption-detecting Boolean, verified systems; all writes, ordering, checksum updates, recovery, verification and PM cost. | CapybaraKV/CapybaraNS formal verification. | Deep drop |
| WOLVES | Same file-system semantics; synchronously construct/recover metadata package. | WOFS package, ordering point and translation/recovery action; data/meta I/O, CPU, recovery, space and consistency. | Linux prototype/application workloads. | Deep drop |
| F2FSJ | Same F2FS semantics; construct fine-grained journal/recovery. | Metadata-only ordered journal, inode logs, epochs, data/control decoupling, fast-forward apply; all writes, locks, recovery and correctness. | Open source F2FSJ / F2FS workloads. | Deep drop |
| SHIFTLOCK | Same RDMA reader-writer lock semantics including starvation freedom/fault tolerance. | Nonblocking direct handover protocol; retries, RNIC IOPS, wait/tail, goodput, failure handling and transaction work. | FAST artifact and storage transactions. | Deep drop |
| GRACE | Same realtime-video delivery; retain QoE under loss. | Joint neural encoder/decoder loss-spectrum training; bitrate, compute, packet loss, quality, undecodable frames/stalls and latency. | Videos + real network traces. | Native codec |
| COMPASS | Same encrypted semantic-search answer/quality and privacy. | Directional filtering, prefetch, graph-tailored ORAM; search accuracy, leakage, ORAM bandwidth/compute and latency. | Encrypted embedding queries. | Native construction |
| LENGTH-LEAKAGE-ORAM | Same oblivious access privacy target. | Lower-bound matched constructions; storage, bandwidth and allowable leakage. | Formal leakage models. | Bounded construction |
| WALLET | Same confidential serverless function result/isolation. | Nested confidential execution, trustlet and data-centric I/O; TCB, density, communication, latency and security. | Serverless chains. | Native architecture |
| STIMPACK | Same cloud-game output/QoE. | Rendering/resource utility system; rendering GPU/CPU, compression, QoE and user capacity. | Cloud-gaming users/workloads. | Utility controller |
| MAE | Same RTC video semantics/QoE. | Encoder adaptation to bandwidth; encoder/network state, rate, tail and quality. | Internet/video experiments. | S5 exclusion |
