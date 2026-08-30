# Offline-constructor admission and collision matrix

| Family | Fixed stock object | Current union | Two-action / natural-epoch result | Decision |
| --- | --- | --- | --- | --- |
| APT archive index | package tree → Packages/Sources/Contents/Release read by APT | `apt-ftparchive` commands, generate config, checksums/cache | alternative output is config/format or changes signed semantics | `DROP__UNION_OR_OBJECT_CHANGE` |
| ThinLTO | fixed bitcode/options → linked binary | cache/index plus documented prune policy | only cache policy found | `DROP__CONTROLLER` |
| CPython pyc | fixed source/version → stock `.pyc` execution | `py_compile`, invalidation/hash mode | alternate marshal representation is reader/version change | `DROP__OBJECT_CHANGE` |
| Conda repodata | package metadata → solver repodata | patch/generation vicinity | versioned two-output action unclosed | `NOT_ADMITTED_UNFROZEN` |
| Cargo/Bazel/CDS | fixed build input → stock cache/archive | native build/cache paths | public epoch trace + union-external pair unclosed | `NOT_ADMITTED_UNFROZEN` |

No item was dropped for missing implementation, result, resource, hardware or AI readiness.
