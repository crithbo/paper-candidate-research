# Raw screen row events

Each row is a distinct `RAW_SCREEN_ROW_EVENT`; an initial screen is not a novelty or admission claim.

| Row | Opportunity family | Guarantee/input boundary tested | Official/current anchor | Disposition |
|---:|---|---|---|---|
| 01 | DuckDB robust join construction | Fixed SQL/result semantics under cardinality-estimation error and join-order choice. | [DuckDB join contract](https://duckdb.org/docs/current/guides/performance/join_operations), [RPT paper/artifact](https://duckdb.org/library/robust-predicate-transfer/) | `DEEP_DIVE_REQUIRED` |
| 02 | Binaryen CFG re-structuring | Fixed Wasm module semantics; choose structured regions/labels for a valid emitted module. | [Binaryen upstream](https://github.com/WebAssembly/binaryen) | `DEEP_DIVE_REQUIRED` |
| 03 | Rust trait-solving goal selection | Fixed crate/trait goals and compiler diagnostics; choose a proof/search path. | [rustc dev guide](https://rustc-dev-guide.rust-lang.org/overview.html), [Rust upstream](https://github.com/rust-lang/rust) | `DEEP_DIVE_REQUIRED` |
| 04 | HotSpot C2 SuperWord packing | Fixed Java IR and deoptimization semantics; choose legal SLP packs. | [OpenJDK source](https://github.com/openjdk/jdk/tree/master/src/hotspot/share/opto) | `STRUCTURAL_DROP` |
| 05 | SQLite query-plan choice | Fixed SQL/database/statistics and result semantics; choose a legal access/join plan. | [SQLite query planner](https://www.sqlite.org/queryplanner.html) | `STRUCTURAL_DROP` |
| 06 | OpenZFS metaslab allocation | Fixed allocation requests and pool state; select legal extents. | [OpenZFS documentation](https://openzfs.github.io/openzfs-docs/), [upstream](https://github.com/openzfs/zfs) | `STRUCTURAL_DROP` |
| 07 | nginx HTTP/2 priority dispatch | Fixed HTTP/2 stream set and protocol constraints; select next writable stream. | [nginx HTTP/2 module](https://nginx.org/en/docs/http/ngx_http_v2_module.html), [upstream](https://github.com/nginx/nginx) | `STRUCTURAL_DROP` |
| 08 | QEMU TCG host-register allocation | Fixed TCG IR and generated-code semantics; assign/spill virtual temporaries. | [QEMU developer docs](https://www.qemu.org/docs/master/devel/), [upstream](https://gitlab.com/qemu-project/qemu) | `STRUCTURAL_DROP` |
| 09 | GNU make ready-job dispatch | Fixed build dependency graph and commands; dispatch ready jobs under jobserver tokens. | [GNU make manual](https://www.gnu.org/software/make/manual/), [source](https://git.savannah.gnu.org/cgit/make.git/) | `STRUCTURAL_DROP` |
| 10 | LMDB page split/rebalance | Fixed key/value relation and reader semantics; choose legal B+tree split/rebalance. | [LMDB upstream](https://git.openldap.org/openldap/openldap/-/tree/master/libraries/liblmdb) | `STRUCTURAL_DROP` |

Repeat/rescreen events: `0`. Wave48–50 and all active/terminal registry objects were excluded before row creation. No embargoed or interface-unfrozen line entered this table as an absence claim.
