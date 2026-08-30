# Six candidate-grade deep reviews

## JETPACK-CONSENSUS-FASTPATH — `DROP_DIRECT_ABSORPTION`

Primary quality is the original consensus decision/safety across view changes. Jetpack already is the complete joint constructor: concurrent fast/original execution plus structural requirements that preserve the original decision. Its denominator includes both message paths, view changes, CPU, tail, throughput and safety. Any priority/timeout reweighting is controller work. The frozen 72h killer is 20 fixed view-change histories; an admitted action would need same decisions outside Jetpack’s path construction. No such action is frozen.

## CLINK-CRINK-LINEARIZABLE-CACHE — `DROP_DIRECT_ABSORPTION`

Primary quality is linearizable reads during ownership changes. CLINK/CRINK already couple memory latency/availability with correctness through range-granularity metadata and WriteGuards that reject delayed writes. Full cost includes cache memory, fencing writes, storage, sharding, read tail and availability. The killer is 20 fixed delayed-write/ownership traces with exact read results; no union-external atomic cache/fencing construction exists.

## SOLIDATTENTION-SSD-KV — `DROP_DIRECT_ABSORPTION`

Primary quality is unchanged inference accuracy under long context. SolidAttention’s dynamic sparsity, SSD block consolidation/speculative prefetch and synchronization-aware compute/I/O construction already jointly satisfies memory, latency and accuracy constraints. The denominator charges all SSD/KV/compute work. The 72h killer is 20 public long prompts requiring identical output-quality contract outside that action. A cache threshold/prefetch choice is controller tuning.

## COFS-CONTAINER-LOOKUP — `DROP_DIRECT_ABSORPTION`

Primary quality is exact fixed read-only image-tree lookup semantics. CoFS’s image-time MPHF, full-path MPHF and kernel sparse-data cache form the complete low-tail/cost action. Full cost includes image build, hashes, metadata, kernel work, I/O and cold start. The 72h killer uses 20 container images and exact path/result comparisons; no alternative atomic constructor has been named.

## ZUFS-MOBILE-STORAGE — `DROP_DIRECT_ABSORPTION`

Primary quality is end-to-end write ordering and stable reads. ZUFS already coordinates limited SRAM, write-order guarantees and large-zone GC across six stack layers. Full cost includes firmware, driver, F2FS/Android, SRAM, GC, ordering and foreground I/O. The killer uses 20 fragmentation/order histories. Another buffer threshold or GC trigger is configuration, not N2.

## D2FS-DEVICE-GC — `DROP_DIRECT_ABSORPTION`

Primary quality is filesystem mapping semantics while device GC frees space. D2FS already jointly constructs coupled GC, asynchronous mapping migration upcalls and virtual overprovisioning. The denominator includes device/FTL work, remaps, foreground I/O, capacity and GC tail. The killer uses 20 FIO/YCSB-F pressure traces and exact mapping/output checks; no union-external action is frozen.
