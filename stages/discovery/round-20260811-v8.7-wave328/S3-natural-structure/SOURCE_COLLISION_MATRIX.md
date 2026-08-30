# SOURCE / COLLISION MATRIX

| Family | Primary current source | Counterevidence / boundary |
|---|---|---|
| KLIB | [Kotlin Native libraries](https://kotlinlang.org/docs/native-libraries.html) | KLIB contains serialized IR/bitcode/linkdata; target and path modes are existing producer actions. |
| Dart AOT | [dart compile](https://dart.dev/tools/dart-compile), [dartaotruntime](https://dart.dev/tools/dartaotruntime) | AOT is architecture-specific; `dart compile` flags/current pipeline form required strong union. |
| BEAM | [OTP code loading](https://www.erlang.org/docs/27/system/code_loading.html), [beam_lib](https://www.erlang.org/docs/17/man/beam_lib) | compiler creates BEAM chunks; debug/compiler options and loader behavior are existing actions. |
| Julia sysimage | [Julia system images](https://docs.julialang.org/en/v1/devdocs/sysimg/) | runtime/package/CPU construction union and public triple route remain unclosed. |
| R lazyload | [R Internals](https://cran.r-project.org/doc/manuals/r-release/R-ints.html) | namespace serialization/writer union and compatible reader contract unclosed. |
| Guix/Nix | [Nix store](https://nixos.org/manual/nix/stable/store/) | content-addressed paths make changed representation/object identity nontrivial; generic delta excluded. |
| Clojure AOT | [Clojure compilation](https://clojure.org/reference/compilation) | JVM class family excluded. |

No absence claim is made from missing implementation or result. The strongest union must include all official producer options and an equal-information VCDIFF comparator before any later admission.
