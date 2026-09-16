# Candidate-grade deep reviews

## D01 — rsync file-tree delta regime

- **Same object/oracle:** fixed sender/receiver files and metadata semantics; stock rsync receiver result and file-tree equality are the oracle.
- **Current pin/union:** rsync master `3b84610ccb35d1355f6e88e0e870bef48a164fbb`. Fair union must include documented checksum/block-size/compression, whole-file/delta, recursive/incremental recursion, deletion and transport modes, with defaults and non-defaults.
- **Natural carrier/schema:** 20–50 pre-registered versioned release/source-tree pairs, source-hashed before observation; stratify change fraction, file-size distribution, repeated-block structure, metadata churn, and tree fanout. Record sender/receiver CPU/RSS/temp, metadata scan, network bytes, temp/disk writes, receiver apply time, and output equality. Match transport, storage, cache, platform and file metadata.
- **Required exploitation:** a target-specific whole delta-construction algorithm preserving the identical receiver tree, not a block-size/flag choice, transfer policy, or generic string-matching wrapper.
- **72h killer:** reject if no normalized repeated frontier elbow, if receiver semantics differ, or if the action maps to current checksum/block/whole-file/delta union.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__CURRENT_UNION_AND_STOCK_LEGAL_WHOLE_ACTION_NOT_CLOSED`.

## D02 — CMake configure/generate regime

- **Same object/oracle:** fixed CMake version, project source, toolchain and configuration semantics; stock generated build graph/files are the oracle.
- **Current pin/union:** CMake master `ba5c65333755237707a386a3ded4effb71f38337`. The union includes generator choice, cache/configuration variables, preset/toolchain paths, dependency discovery and native generation; the complete source/flag union was not closed in this desk review.
- **Natural carrier/schema:** 20–50 pre-registered public CMake project commits, recording target/dependency/configuration graph shape, configure/generate CPU/RSS/temp, cache and generated-file bytes, and invalidation/reconfigure cost. Control CMake version, toolchain, generator, dependency snapshot, platform and cold/warm cache.
- **Required exploitation:** a same-semantic whole generator construction with an explicit guarantee, not generator selection, cache policy, preset/configuration tuning, or generic graph layout.
- **72h killer:** reject if a regime fails to repeat after graph-size controls, generated build semantics differ, or full source audit maps action to existing generator/configuration union.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__CURRENT_SOURCE_FLAG_UNION_AND_NONCONTROLLER_ACTION_UNCLOSED`.

## D03 — Ninja manifest-load graph regime

- **Same object/oracle:** fixed Ninja version and `build.ninja` graph semantics; stock manifest parsing/dependency behavior and resulting build graph are the oracle.
- **Current pin/union:** Ninja master `b51a1e37c2fb89bbefa600bd155e1ce13983f09d`. Fair union covers manifest syntax, depfile/log loading, pool and default target behavior, and build execution options; full current action inventory needs source-level closure.
- **Natural carrier/schema:** 20–50 pre-registered public `build.ninja` manifests paired with project revisions. Record edge/fanout/order-only/dependency-file structure, manifest-load CPU/RSS/latency, graph bytes, dep/log bytes and cold/warm behavior. Hold version, storage, target set, platform and cache state fixed.
- **Required exploitation:** a native graph-representation/construction action preserving identical build graph and dependency semantics; scheduler/controller, target selection, manifest knob, or generic graph compression fails.
- **72h killer:** reject if no controlled repeated elbow, stock graph differs, or source union already expresses the complete action.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__CURRENT_UNION_AND_WHOLE_NATIVE_ACTION_UNCLOSED`.
