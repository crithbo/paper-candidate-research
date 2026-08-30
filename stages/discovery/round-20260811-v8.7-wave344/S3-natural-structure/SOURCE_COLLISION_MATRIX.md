# SOURCE / COLLISION MATRIX

| Object | Official primary sources | Frozen current-union conclusion |
|---|---|---|
| KLIB | [Kotlin Native libraries](https://kotlinlang.org/docs/native-libraries.html), [Kotlin compiler source](https://github.com/JetBrains/kotlin) | Documented zip directory layout, packed/non-packed and relative-path options exhaust exposed representation actions; linker/ABI preserve the semantic boundary. |
| BEAM | [OTP compilation/loading](https://www.erlang.org/docs/27/system/code_loading.html), [beam_lib](https://www.erlang.org/docs/17/man/beam_lib), [OTP compiler](https://www.erlang.org/docs/25/apps/compiler/compiler.pdf) | Compiler/debug/strip and stock chunk loader already cover production/reader actions; residual chunk order/padding is generic. |
| Delta | [RFC 3284](https://www.rfc-editor.org/rfc/rfc3284) | Equal-information baseline, never a whole-object constructor. |

No implementation absence claim or old issue/future-work item is used in either decision.
