# Current-source / collision matrix

| Object | Official/upstream pin | Current strong union | Natural carrier / confounds | Result |
|---|---|---|---|---|
| rsync | [rsync documentation](https://rsync.samba.org/documentation.html); master `3b84610ccb35d1355f6e88e0e870bef48a164fbb` | checksum/block/compression, delta/whole-file, recursion, transport and deletion modes | Versioned source trees; control transport/storage/cache/metadata/change shape | No whole target-specific action closed |
| CMake | [CMake documentation](https://cmake.org/cmake/help/latest/); master `ba5c65333755237707a386a3ded4effb71f38337` | generators, cache/configuration/preset/toolchain/dependency paths | Versioned projects; control generator/toolchain/dependency/cold state | Union incomplete; no mechanism claim |
| Ninja | [Ninja manual](https://ninja-build.org/manual.html); master `b51a1e37c2fb89bbefa600bd155e1ce13983f09d` | manifest/depfile/log/pool/default-target and execution union | Versioned manifests; control graph shape/storage/cache/target | Union incomplete; no mechanism claim |

No old issue or synthetic stress case is used as evidence of a stable regime.
