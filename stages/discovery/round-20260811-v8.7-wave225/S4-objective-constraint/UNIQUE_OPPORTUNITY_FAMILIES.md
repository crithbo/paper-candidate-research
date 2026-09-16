# V8 native snapshot constructor — current reality check

## Same-object contract

The candidate must regenerate a snapshot accepted by the pinned stock deserializer, reproduce the same heap graph/builtins/roots and observable JavaScript behavior, preserve V8’s native read-only/shared/startup partition and header/checksum/bytecode protocol, and retain the normal V8 build/version compatibility boundary.

## Pinned source / union

| source path at `c635f0d…` | current native action or constraint |
|---|---|
| `src/snapshot/serializer.cc`, `serializer-deserializer.h` | root constants, an 8-entry hot-object list, back references, pending forward references, deferred objects, snapshot-space allocation, alignment/padding, and bytecode emission |
| `startup-serializer.cc`, `startup-deserializer.cc`, `read-only-*`, `shared-heap-*` | startup/read-only/shared object caches and partition-specific construction/deserialization |
| `snapshot.cc` | startup/read-only/shared/context partitioning, header offsets/checksums, and native compression application to each payload |
| `snapshot-compression.cc` | built-in raw zlib compression at `Z_DEFAULT_COMPRESSION`; it is held fixed, not optimized separately |
| `mksnapshot.cc`, `flag-definitions.h` | `startup_blob`, target flags, warmup script path, `stress_snapshot`, `extensible_ro_snapshot`, shared-heap controls, checksum/tracing/statistics, and `reorder_builtins` (default false, build/profile dependent) |
| `sort-builtins.cc` | profile-based builtins code ordering; it is a current union member but does not schedule generic non-code heap objects |

The explicit opposite evidence is important: `reorder_builtins` and native compression already address a different, narrower action. They are included in the fair union; the proposal may not rebrand either as a new algorithm.

## Natural carrier

V8’s official `test/mjsunit`, V8 snapshot tests, and Node.js official benchmark/application fixtures form the public carrier. A Stage A corpus would freeze 20–50 root/builtin-heavy scripts and snapshot creators from those repositories, preserving one target architecture/build configuration.

