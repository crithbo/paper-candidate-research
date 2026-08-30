# RAW_SCREEN_ROW_EVENTS

Official-source screen only; cutoff 2026-08-11. No artifact was downloaded, built, executed or benchmarked.

| ID | Fresh versioned native exact object | Stock oracle / natural pair | Result |
|---|---|---|---|
| R1 | SPIR-V binary module with fixed instruction/type/decoration/interface semantics | `spirv-val` plus stock binary parser on shader modules from adjacent official Khronos tool release fixtures | `DEEP_DIVE_REQUIRED` |
| R2 | OpenJDK application CDS archive with fixed class metadata/loader/runtime contract | matching `java -Xshare` archive loader on adjacent official OpenJDK tags | `DEEP_DIVE_REQUIRED` |
| R3 | Lua binary chunk with fixed constants/prototypes/VM execution | stock `lua_load`/undump on adjacent official Lua tags | `DEEP_DIVE_REQUIRED` |
| R4 | GObject Introspection `.typelib` with fixed introspection metadata lookup | `g_irepository_require` on adjacent GNOME release artifacts | `NOT_ADMITTED_UNFROZEN` |
| R5 | Dart Kernel `.dill` with fixed Kernel AST/compiler restore semantics | pinned Dart VM/compiler reader across official SDK tags | `NOT_ADMITTED_UNFROZEN` |
| R6 | JVM `.class` file with fixed bytecode/class-loading behavior | matching JDK verifier/class loader on adjacent OpenJDK tags | `STRUCTURAL_DROP`—constant-pool/index rewriting is already intrinsic to compiler/bytecode transforms; no independent whole layout action is frozen. |

All rows are distinct from excluded DEX, AAPT2, jimage, kallsyms, profdata, R2R, Chromium pak, Fontconfig and registry-active objects.
