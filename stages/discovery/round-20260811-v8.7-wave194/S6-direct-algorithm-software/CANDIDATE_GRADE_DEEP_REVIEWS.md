# Candidate-grade deep reviews

## 1. DWARF `.debug_info` / `.debug_abbrev` code assignment — NOT ADMITTED UNFROZEN

**Same object.** Identical DIE graph, attributes, address ranges and source locations; stock `llvm-dwarfdump --verify` and debugger-visible query semantics are the oracle. Abbrev codes and ULEB references may change only if all dependent DIE encodings regenerate.

**Current union and witness.** LLVM DwarfDebug/DIEAbbrev already produces abbreviations and ULEB encodings. Two structurally independent abbrev shapes can receive swapped codes with regenerated DIE references; that is a legal witness, not evidence that current writers lack a global grouping/ordering action. A complete current clang/LLVM/GCC writer-plus-flag union and a nontrivial union-external guarantee were not frozen. Natural carrier: public LLVM/Clang debug-info regressions and open C/C++ projects. Full cost: compile, debug-write, dwarfdump/debugger parse CPU/RSS, bytes and temp. `NOT_ADMITTED_UNFROZEN`.

## 2. MLIR bytecode string/dialect/type/attribute/use-list assignment — NOT ADMITTED UNFROZEN

**Same object.** Identical MLIR graph/dialect versions/resources, accepted by stock MLIR bytecode reader and IR verifier. The stable documented format uses PrefixVarInt and tables of strings, dialects, operations and indexed entities.

**Current union and witness.** The format itself supports indexed names and a use-list encoding that selects index-pair encoding relative to a reference list. Two independent strings or attributes can be legally swapped only with every index/reference regenerated. The writer's complete collection/order/version-hook/default/nondefault union is not source-exhausted; no union-external joint algorithm with a stated guarantee is identified. Natural carrier: public MLIR test/IR corpus. Full cost: serialize/deserialize/verify CPU/RSS, bytes and temporary memory. `NOT_ADMITTED_UNFROZEN`.

## 3. ECMA-335 metadata coded-index/heap assignment — NOT ADMITTED UNFROZEN

**Same object.** Same assembly identity, metadata tables, signatures and reflected/runtime-visible members, accepted by the stock CLI metadata reader. Compressed integers/coded indices can change only with every table/heap reference regenerated.

**Current union and witness.** Microsoft’s metadata API implements the ECMA-335 compressed integer encoding; writers must preserve table ordering constraints and index widths. A swapped independent metadata-row/heap assignment is legal after total rewrite, but no current Roslyn/metadata-writer source+flag union or global residual guarantee is frozen. Natural carrier: public .NET/Roslyn assemblies. Ledger: emit/load/reflection CPU/RSS, metadata/assembly bytes and temp. `NOT_ADMITTED_UNFROZEN`.

## 4. Android DEX identifier/index/debug-data assignment — NOT ADMITTED UNFROZEN

**Same object.** Same classes, methods, code/debug semantics and verifier/runtime behavior. Identifier/index changes require all bytecode/debug references to be regenerated under the DEX contract.

**Current union and witness.** DEX uses indexed instruction/metadata forms; a legal two-definition swap with all cross-references regenerated is possible in principle. However, AOSP D8/R8 writer/configuration, multidex/desugaring and verifier action union was not source-frozen, and a new complete N2 is not named. Natural carrier: public Android open-source modules. Ledger: dex write/read/verify CPU/RSS, bytes, temporary storage and startup/parse cost. `NOT_ADMITTED_UNFROZEN`.

### Common 72-hour fidelity killer

Pin current source/release and enumerate writer defaults/nondefaults; create a small public two-definition reference witness; regenerate every reference; use stock reader/verifier/equality oracle; compare the entire current union under equal inputs. Reject if an upstream action expresses the constructor, any visible semantics differs, or only frequency sorting/parameterization remains.

