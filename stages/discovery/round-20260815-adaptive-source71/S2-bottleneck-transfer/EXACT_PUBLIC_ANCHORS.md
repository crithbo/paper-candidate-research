# Exact public anchors — Source71

| RQ | Fixed object / stock oracle | Official primary anchor | Anchor role |
|---|---|---|---|
| RQ-S71-01 | Fixed Java module set/resources/target runtime and stock runtime image/class loading | https://docs.oracle.com/en/java/javase/18/docs/api/jdk.jlink/module-summary.html | `jlink`, `jmod` and `jimage` define the implementation image/tool boundary. |
| RQ-S71-02 | Fixed Rust crate graph/compiler target/output semantics and stock dependent-crate compilation | https://rustc-dev-guide.rust-lang.org/backend/libs-and-metadata.html | Defines `rmeta`, `rlib`, metadata fields and `rustc_metadata` ownership. |
| RQ-S71-03 | Fixed host program/code object/target GPU and stock HIP module execution | https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/hip_porting_guide.html | Defines code-object bundling, registration and module-load behavior. |

Anchors were recorded before evidence outcomes and do not assert novelty, absence or paper quality.
