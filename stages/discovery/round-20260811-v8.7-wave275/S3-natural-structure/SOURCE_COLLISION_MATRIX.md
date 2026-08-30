# SOURCE / COLLISION MATRIX

| Family | First-party source | Current union/counterevidence | Status |
|---|---|---|---|
| AAPT2 | [AAPT2 official guide](https://developer.android.com/tools/aapt2) | compile/link/optimize/dump/diff; `--enable-sparse-encoding`, `--collapse-resource-names`, `--shorten-resource-paths`, splits and config directives | Unfrozen |
| LLVM profile | [LLVM instrumentation profile format](https://www.llvm.org/docs/InstrProfileFormat.html), [llvm-profdata](https://llvm.org/docs/CommandGuide/llvm-profdata.html), [LLVM profile source](https://llvm.org/doxygen/InstrProfData_8inc_source.html) | indexed on-disk hash table, compatibility, merge/order/extbinary/compression/sparse options | Unfrozen |
| .NET R2R | [official runtime source](https://github.com/dotnet/runtime), [runtime build docs](https://github.com/dotnet/runtime/blob/main/docs/workflow/building/coreclr/README.md), [R2R format design path](https://github.com/dotnet/runtime/blob/main/docs/design/coreclr/botr/readytorun-format.md) | Crossgen2/R2RDump and current composite/partial-composite directions require an exact source/config pin | Unfrozen |
| Chromium pak | [Chromium source](https://source.chromium.org/chromium/chromium/src/+/main:ui/base/resource/data_pack.h) | current DataPack reader and packer action/config sources not closed | Unfrozen |
| Fontconfig cache | [Fontconfig source](https://gitlab.freedesktop.org/fontconfig/fontconfig), [Fontconfig user docs](https://fontconfig.pages.freedesktop.org/fontconfig/fontconfig-user.html) | current cache validity, builder and reader sources remain to be pinned | Unfrozen |
| Swift module | [Swift compiler](https://www.swift.org/documentation/swift-compiler/), [Swift ABI/module stability](https://www.swift.org/blog/abi-stability-and-more/) | compiled `.swiftmodule` format is tied to a compiler version; a cross-version fixed stock-reader relation is unavailable | Structural drop |

No old issue or future-work note is used as absence evidence. All open rows require a current commit/tag plus defaults/nondefaults before they could be admitted.
