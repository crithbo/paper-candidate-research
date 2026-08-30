# Source and collision matrix

All sources below are official Debian/first-party materials consulted at the frozen cutoff.  Discovery performed no download of candidate corpora.

| source | role | evidence used | collision / limitation |
|---|---|---|---|
| [Debian Repository Format](https://wiki.debian.org/DebianRepository/Format), current | semantic specification | Contents filename/location, table mapping, Release SHA-256/size, compression and diff/by-hash facilities, timestamp snapshot route | establishes exact mapping and hash route; it does not establish a stable churn law or writer residual |
| [Debian `apt-ftparchive(1)`](https://manpages.debian.org/trixie/apt-utils/apt-ftparchive.1.en.html), trixie | constructor/configuration | `contents` and `generate` commands; `--contents`, `--arch`, `-o`, `-c` controls | a strong existing general generator; compression/config variations are in-union |
| [Debian apt source 3.0.3 changelog](https://sources.debian.org/src/apt/3.0.3/debian/changelog) and [example configuration](https://sources.debian.org/src/apt/1.8.2.3/doc/examples/apt-ftparchive.conf) | current upstream source/config facet | `Contents::Compress`; `BinDirectory` maps a pool to Packages/Sources/Contents; recent changelog records 2024 Contents-generation complexity fixes | contrary evidence to claims that Contents generation is unavailable or only a naïve emitter |
| [Debian `apt-file(1)`](https://manpages.debian.org/unstable/apt-file/apt-file.1.en.html), unstable | reader/query oracle | Contents targets, optional/default configuration, header-parser option and search semantics | forbids assuming output order/header is semantically irrelevant without a stock-reader test |
| [Debian Archive Kit (dak)](https://salsa.debian.org/ftp-team/dak), official Salsa project | archive producer facet | official project says dak runs Debian archive | production revision/config/publishing paths not frozen; strongest union remains incomplete |
| [Debian Snapshot / repository snapshot specification](https://wiki.debian.org/DebianRepository/Format) | natural adjacent version carrier | timestamp-addressable snapshot route and Release-listed hashes | acquisition and controlled analysis are only planned, not performed |

### Collision decision

There is no licensed basis for an absence claim such as “current Debian tools cannot construct X.”  The current union contains a general Contents generator, config-controlled compressed output, cache/database support, APT index-target reader configuration, and archive production by dak.  A proposal can survive only after an exact current production union is frozen and a named whole action is proven external under identical relation semantics.  This file finds neither condition closed, so the outcome is `NOT_ADMITTED_UNFROZEN`, not a direct scientific DROP.
