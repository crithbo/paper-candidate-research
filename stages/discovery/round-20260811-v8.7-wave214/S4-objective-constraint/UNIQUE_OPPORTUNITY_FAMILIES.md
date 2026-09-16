# One unique family: Mach-O export-trie construction

## Frozen same-object contract

Input is a fixed dylib export set: symbol strings; regular/absolute/weak/TLV/re-export attributes; target addresses; library ordinals; and the same required `LC_DYLD_INFO`/`LC_DYLD_EXPORTS_TRIE` reader interpretation. Output must be accepted by stock dyld and LLVM tooling and expose exactly the same symbols with the same values and flags.

## First-party current-source reality check

| source | frozen reference | fact used |
|---|---|---|
| LLVM lld | `cbe3031ee342114ae2b00ff6ec9e6d4a25a4a9d9`, `lld/MachO/ExportTrie.cpp` | explicit compressed-prefix trie, three-way radix construction, ULEB-offset fixed-point sizing, and native serialization/parser are present |
| LLVM layout/tooling | same pin; `lld/MachO/SyntheticSections.cpp`; LLVM `llvm-objdump` docs | export-trie is a Mach-O/linkedit object which can be inspected by stock LLVM tooling |
| Apple contract | Apple Mach-O API documentation: https://developer.apple.com/documentation/kernel/mach-o | native dyld/Mach-O acceptance is the fixed reader boundary |
| Apple ld64 | `f60a74eaa2c99585de1dc0f2820e7a9f8aaf522c` | version is pinned, but its entire relevant option/source union was not downloaded or exhaustively enumerated |

LLVM’s source makes the main proposed factoring/serialization action already concrete. Apple ld64’s complete relevant flag-to-emitter map is not asserted absent or present beyond this frozen provenance, so the combined Apple+LLVM strongest-union proof is intentionally not closed.

## Natural carrier and fidelity route

Natural carrier: public Apple-platform dylib-producing source suites (LLVM/Swift/Apple open-source components), restricted to dylibs with stable export maps. A future finite closure would build 20–50 fixed export maps on a macOS toolchain, inspect trie/export contents with stock `llvm-objdump`, invoke the native runtime loader on a fixed machine, and account for link CPU/RSS, file bytes, and lookup/startup time. This is a plan only; it was not executed.

