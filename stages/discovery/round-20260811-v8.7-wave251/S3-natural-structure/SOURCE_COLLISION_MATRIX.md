# Source and collision matrix

| source | role | collision / boundary |
|---|---|---|
| [OpenJDK JEP 220](https://openjdk.org/jeps/220) | runtime image and `jrt:/` semantics | defines same-object resource lookup boundary |
| [OpenJDK current jlink manual](https://docs.oracle.com/en/java/javase/25/docs/specs/man/jlink.html) | current documented union | confirms `order-resources`, compression, strip and plugin controls; cannot be called absent |
| [OpenJDK JEP 493](https://openjdk.org/jeps/493) | current runtime-linking configuration | linkable-runtime is build-time and not default; adds reverse-linking constraints |
| pinned `ImageFileCreator` / `ImageReader` | writer/reader source | layout uses resource traversal but reader maps resource locations; same-reader oracle is available |
| pinned `OrderResourcesPlugin` | native action source | executes supplied priority order; it does not prove a predecessor-aware construction rule is absorbed |
| pinned `JimageDiffGenerator` / `ResourceDiff` | current diff source | compares packaged modules to same-version optimized image, not adjacent release final image delta |
| [RFC 3284 VCDIFF](https://www.rfc-editor.org/rfc/rfc3284.html) | external strong comparator | required same-information final-image delta baseline |

Direct collision status is `SEARCH_BOUNDED_OPEN`: reviewed first-party current sources, JEPs and jimage format material reveal native ordering/diff mechanisms but no direct same-object bounded predecessor-aware jimage ordering constructor.  This is not an absence claim and requires independent Stage0 verification.
