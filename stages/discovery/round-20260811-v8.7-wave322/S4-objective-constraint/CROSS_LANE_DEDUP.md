# Cross-lane de-duplication

The six families below were screened against registry/current active contracts and the explicitly excluded JSC, BTF, GIN, SQLite WAL, ThinLTO, glibc-loader, Cassandra, ClickHouse, Iceberg, V8, certificate-proof, startup-artifact, GPU, and prior storage objects.

| ID | Fresh exact object | Separation |
|---|---|---|
| R01 | Cargo workspace dependency/feature resolution and `Cargo.lock` under fixed resolver semantics | Not a compiler cache or existing ThinLTO/ORCv2 object. |
| R02 | systemd unit dependency transaction/startup under fixed unit semantics | Not a runtime controller or recovery-semantic object. |
| R03 | OpenSSL X.509 chain construction/verification under fixed trust/purpose verdict | Not a checked-certificate producer/checker format. |
| R04 | APT dependency-resolution transaction under fixed repository/package semantics | New package-solver object. |
| R05 | Nix evaluation/derivation dependency graph under fixed expression semantics | New functional package-evaluation object. |
| R06 | systemd-udevd hardware-database lookup under fixed device/modalias semantics | New native device-rule database object. |

No row revives a terminal contract or changes an existing object merely to evade collision.
