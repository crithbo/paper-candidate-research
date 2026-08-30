# Primary RQ — S3-100-01

- **Anchor:** Qt 6.11.1 official QML compiler and disk-cache documentation, checked 2026-08-15.
- **Object:** a fixed QML/JavaScript document set compiled into stock QML compilation units/cache files and loaded by the stock QML engine.
- **Same-object guarantee:** source document behavior, Qt-version validity condition, loaded compilation-unit semantics, and stock engine remain unchanged; no source transformation, custom loader, cache controller, or direct/static mode guarantee change.
- **Five-field identity preflight:** no exact history/registry match was found for the object/action/endpoint; `NO_EXACT_MATCH` is not novelty or absence evidence.

## RQ

For a version-pinned series of public QML module releases, can a predecessor-aware compilation-unit constructor preserve stock runtime behavior and cache-validity conditions while reducing complete emitted-unit plus same-information transition cost versus the current `qmlcachegen`/QML-engine union and binary delta?

The only possible route is N2 after a target-specific whole constructor and guarantee are frozen. N3 would separately require a measured stable release law. Full cost would include compiler CPU/RSS/temp, cache/code bytes and delta bytes, mmap/load/startup behavior, and read/execute cost.
