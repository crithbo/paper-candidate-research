# Same-object coupled contracts

| Family | Exact action / primary guarantee | Fair union / complete denominator | Natural/formal route | Result |
|---|---|---|---|---|
| ANANKE | Same file-system correctness; prepare/detect/recover microkernel fault. | Transparent recovery architecture; normal I/O, fault preparation/detection/recovery, CPU, latency and persistent state. | Real application workloads. | Deep drop |
| NVLOG | Same disk-file-system semantics/crash consistency; synchronous write action. | Byte-granularity NVM WAL, small-write/recovery/GC construction; DRAM/NVM/disk I/O, space, CPU, recovery and latency. | Legacy filesystem workloads. | Deep drop |
| ATOMICDISK | Same TEE storage behavior with sync atomicity/security. | Internal commit operation + SGX-PFS/MHT; all sync/eviction, snapshot state, trusted storage, latency and security. | Trace-driven workloads. | Deep drop |
| ZOOROUTE | Same tenant traffic; one-shot deterministic failover. | Candidate-port probes + VXLAN outer-port rerouting; outage, probes, gateway memory, middlebox effect, latency and OpEx/CapEx. | 26-month production cloud deployment. | Deep drop |
| XO | Same L7 request semantics; offload processing to backends. | Request-granularity transport/application offload; LB/server CPU, network, throughput and latency. | Ceph/nginx. | Native system |
| RTCP | Same TCP delivery under rate limit. | Rate-limit TCP optimization; retransmissions, bandwidth, delay and service cost. | Country-scale flows. | Controller/tuning |
| LAW | Same Wi-Fi/video service outcome with accepted loss contract. | Queue/rate/retry link architecture; loss, tail, goodput, airtime and CPU. | OpenWiFi/WebRTC. | Control residual |
| AFAAS | Same serverless function behavior. | Full cold-start system; control/data path, init, contention, resource and tail cost. | 18-month production use. | Native system |
| SPECLOG | Same globally ordered shared-log result. | Speculative delivery + fix-ante order; coordination, speculation repair, latency and storage. | Shared-log workloads. | Native abstraction |
| FIDE | Same consensus/KV synchronization guarantee. | Crash detector plus consensus protocols; detection, messages, CPU and latency. | KV/synchronization services. | Native protocol |
