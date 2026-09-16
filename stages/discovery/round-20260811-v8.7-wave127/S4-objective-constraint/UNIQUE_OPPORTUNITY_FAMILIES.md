# Unique opportunity families

Six deduplicated first-party native-constructor families were screened. Their contracts, sources, and candidate action tests are frozen below.

| id | exact same-object guarantee | current realizable union | natural carrier and full-cost denominator |
|---|---|---|---|
| R01 | fixed replicated transaction stream; BFT safety and partial-synchrony liveness | DAG dissemination, every-replica proposals, and Shoal++ commit ordering | reported BFT workloads/failure networks; throughput, end-to-end message delays, message/CPU cost |
| R02 | fixed prompt/request semantics and comparable generation quality | important-token identification, multi-tier KV placement/loading, cache management | repeated-prefix serving traces; TTFT, disk/CPU-memory I/O, cache construction/eviction cost, quality |
| R03 | fixed edge LLM task and output-quality threshold | model/system co-design specialized to an accelerator | edge models/platforms; end-to-end latency, energy, storage/weight and quality |
| R04 | fixed storage request history with linearizability and chosen durability semantics | ordered queue, hardware ACK commit, asynchronous server execution, PM durability path | Memcached and PMemKV workloads; client-visible latency, CPU/NIC/PM work, recovery/durability cost |
| R05 | fixed serverless function graph and confidential-execution threat model | nested confidential execution, trustlets, decoupled guest OS, data-centric LibOS I/O | serverless functions/chains; TCB, latency, density, communication and trusted-resource cost |
| R06 | fixed encrypted embedding query/result semantics with access-pattern protection | directional filtering, speculative prefetch and graph-tailored ORAM | semantic-search datasets/network conditions; quality, latency, ORAM/network/compute cost and obliviousness |

R01, R02, R04, and R05 received negative candidate-grade deep review. R03 and R06 fail the initial witness and do not proceed.
