# Stock-constructor closure — KLIB and BEAM

## KLIB — `STRUCTURAL_DROP`

**Frozen same object.** A Kotlin/Native library with fixed target, exported ABI, serialized IR/linkdata and downstream stock linker behavior. The Wave336 four-version natural-law/held-out plan remains a finite Stage-A measurement route; no positive law is asserted here.

**Current producer/reader/config union.** The official Kotlin/Native producer is `kotlinc-native -produce library` / Gradle target KLIB task. The official KLIB utility reads metadata/ABI/IR; the Native linker consumes KLIB under target and dependency inputs. The documented format is a zip archive with a predeclared directory structure (`ir`, target Kotlin/native bitcode, `linkdata`, `resources`, `manifest`). Current knobs include target selection, `-produce library`, `-library`, output/name/location, packed versus non-packed artifacts, and `-Xklib-relative-path-base`; all change metadata/path or producer representation and must be baseline arms.

**Whole-action closure.** Holding ABI/IR/bitcode/linkdata/resource semantics fixed, the only exposed physical candidates are ZIP member order/compression/metadata, packing form, or source-path normalization. ZIP member order/compression is generic archive packing; path normalization changes debug/path representation and is already a native flag; packed/nonpacked is already native. Reassigning IR, linkage or bitcode groups changes the compiler artifact contract or requires a non-stock reader/linker. Thus no target-specific legal action remains from which a KLIB-specific N2/N3 constructor can exploit a future law.

**Direct subtractors / full cost / killer.** Strongest union is all current Kotlin Native/Gradle KLIB production plus equal-information VCDIFF. Charge compile/link CPU/RSS/temp, KLIB/delta bytes and downstream link/load/start CPU/RSS. A 72h killer still exists—four tagged library releases, stock `dump-abi`/`dump-ir`, all union arms, and two candidate representations—but it can only distinguish generic ZIP packing from contract change. **Structural reason:** `ONLY_GENERIC_ARCHIVE_ORDER_COMPRESSION_OR_CURRENT_PACKING_PATH_ACTIONS__NO_STOCK_LEGAL_TARGET_SPECIFIC_WHOLE_CONSTRUCTOR`.

## BEAM — `STRUCTURAL_DROP`

**Frozen same object.** One matching OTP/ERTS BEAM module with fixed module identity, exports/imports/atoms/code semantics and stock loader behavior. The Wave336 versioned law plan remains conditional only.

**Current producer/reader/config union.** Official OTP `compile:file` (and OS compiler invocation) creates object code; its options determine debug information and code/chunk output. Stock code loading and `beam_lib` read the BEAM IFF chunk representation, inspect chunks, compare/diff directories and support strip operations. All compiler attributes/options, `debug_info`, stripping, code-loader/ERTS version and target are baseline inputs.

**Whole-action closure.** With code, exports/imports/atoms and all loader-observable chunks fixed, moving IFF chunks or changing generic chunk padding is ordinary container ordering/padding. Selecting/removing debug chunks is already compiler/strip action and can alter `beam_lib` observables. Re-emitting code/atom/import chunks is a compiler construction, and no source-derived new legal BEAM decision beyond the existing compiler pipeline was found. An external patch/cache/controller does not construct a new module.

**Direct subtractors / full cost / killer.** Strongest union is complete OTP compiler+options, `beam_lib`/strip and same-information VCDIFF. Charge compile CPU/RSS/temp, BEAM/delta bytes and stock load/dispatch CPU/RSS/latency. 72h killer: four OTP/module tag points, stock chunk/behavior equality and union replay. **Structural reason:** `ONLY_GENERIC_IFF_CHUNK_ORDER_PADDING_OR_CURRENT_DEBUG_STRIP_ACTIONS__NO_UNION_EXTERNAL_STOCK_WHOLE_CONSTRUCTOR`.

Both drops arise from same-object/action-space absorption, not lack of implementation, result, resource, hardware or AI readiness.
