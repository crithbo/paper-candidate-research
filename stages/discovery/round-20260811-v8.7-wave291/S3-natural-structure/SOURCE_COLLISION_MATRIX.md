# SOURCE / COLLISION MATRIX

| Object | First-party source | Direct/generic/contrary subtractor | Decision |
|---|---|---|---|
| SPIR-V | [SPIRV-Tools](https://github.com/KhronosGroup/SPIRV-Tools), [releases](https://github.com/KhronosGroup/SPIRV-Tools/releases) | assembler/parser/disassembler/validator/optimizer/linker; canonical IDs and `-O`/`-Os` recipes | Unfrozen |
| OpenJDK CDS | [JEP 310](https://openjdk.org/jeps/310), [OpenJDK CDS archive builder](https://wiki.openjdk.org/spaces/flyingpdf/pdfpageexport.action?pageId=56525686) | existing application CDS/static/dynamic archive construction | Unfrozen |
| Lua chunk | [Lua current work notes](https://www.lua.org/work/doc/), [Lua manual](https://www.lua.org/manual/5.0/manual.html) | stock `lua_load` and dump/undump compatibility/reuse | Unfrozen |
| GObject typelib | [GIRepository API](https://docs.gtk.org/girepository/), [gobject-introspection source](https://github.com/GNOME/gobject-introspection) | writer/reader ABI and version chain not frozen | Unfrozen |
| Dart dill | [Dart SDK source](https://github.com/dart-lang/sdk), [official changelog](https://github.com/dart-lang/sdk/blob/main/CHANGELOG.md) | incremental compiler restore shows format coupling; writer/reader union unclosed | Unfrozen |
| JVM class | [Java Virtual Machine Specification](https://docs.oracle.com/javase/specs/jvms/se25/html/index.html) | compiler/transformer-owned constant-pool rewriting; no independent native layout action | Structural drop |

No absence claim is based on an old issue, future-work statement, implementation gap or unavailable artifact.
