# Exact public anchor

| Field | Value |
|---|---|
| Signature | `GRAALVM_NATIVE_IMAGE__FIXED_CLOSED_WORLD_JAVA_APP__PROVEN_SAFE_CLASS_INIT_IMAGE_HEAP_LAYOUT_JOINT_CONSTRUCTOR__IMAGE_COLD_START_FULL_COST` |
| Official anchor | https://www.graalvm.org/dev/reference-manual/native-image/optimizations-and-performance/ClassInitialization/ |
| Same object | Fixed Java application/reachability metadata, target/runtime, observable class-initialization behavior and native executable semantics |
| Oracle | Native Image class-init legality plus application observable behavior; no custom loader/runtime |
| Stock union | Automatic safe-class analysis, build/run initialization configuration, image heap construction and all relevant Native Image settings |
| Carrier | One versioned official GraalVM demo/application chosen after one resolved upstream release/source pin |
| Full cost | Build CPU/RSS/temp, executable/image-heap bytes, page/load bytes, class-init checks, cold start and steady-state execution |

The anchor proves stock build-time initialization and image heap exist; it does not prove a missing joint optimizer.
