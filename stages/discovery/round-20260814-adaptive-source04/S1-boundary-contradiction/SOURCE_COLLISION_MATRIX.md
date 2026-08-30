# Source triad / action-promise matrix

| Probe | Official/current locator | Comparator/union | Hard-preflight outcome |
|---|---|---|---|
| LLVM custom/async coroutine ABI | LLVM Coroutines; `Transforms/Coroutines/ABI.h` | current custom-ABI interface and standard lowering union | new ABI or absorbed reimplementation |
| Clang coroutine wrapper | Clang AttributeReference; Debugging Coroutines | current semantic analyzer/wrapper contract | wrapper-only |
| userfaultfd WP | Linux kernel userfaultfd documentation | ioctl modes/features + userspace fault handler | controller/policy |
| CHERI revocation | CHERI Alliance current ISA/revocation material | no one source-pinned compiler/runtime target union | source union not frozen |
| RISC-V Zacas | RISC-V ISA manual; Sail model | ISA feature choice / target lowering | changed target/ISA path |
| RISC-V atomic mapping | LLVM RISCVUsage | A6S/A6/A7 mapping union | config mapping |

No `SEARCH_BOUNDED_OPEN` novelty claim is made, because no family reached raw admission.
