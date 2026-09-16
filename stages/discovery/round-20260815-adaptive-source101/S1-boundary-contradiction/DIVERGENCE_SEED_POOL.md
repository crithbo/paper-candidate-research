# Offline divergence seed pool

Seeds are non-evidentiary prompts generated before public-source inspection; they do not count as opportunity families.

| Seed | Boundary prompt | Cluster | Selected |
|---|---|---|---|
| S101-01 | Guard-byte publication may differ from recovery after a throwing static initializer. | C++ ABI state | yes |
| S101-02 | Guard acquisition can separate compiler-emitted fast path from runtime lock ownership. | compiler/runtime | no |
| S101-03 | `atexit` destructor registration may be adjacent to, but not identical to, guard release. | lifetime | no |
| S101-04 | COMDAT guard coalescing may differ from cross-object one-time construction. | linkage | no |
| S101-05 | Guard-object spare bytes can expose an implementation-defined representation seam. | representation | no |
| S101-06 | Local-static initialization may have an exception/retry visibility boundary. | recovery | no |

Coverage rule: S101-01 was selected because the ABI defines an exact guard acquire/release/abort contract. Other prompts were not anchored this cycle.

