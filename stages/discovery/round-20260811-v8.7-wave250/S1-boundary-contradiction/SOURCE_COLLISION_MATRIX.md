# SOURCE / collision matrix

|family|primary evidence|finding|
|---|---|---|
|Zcmp|[LLVM RISCVFrameLowering](https://llvm.org/doxygen/RISCVFrameLowering_8cpp_source.html)|current frame/Zcmp and CFI union absorbs|
|AArch64 atomics|[LLVM Atomics guide](https://llvm.org/docs/Atomics.html)|late LL/SC and LSE/outline mechanisms already modeled|
|PPC|[PPC target flags](https://www.llvm.org/doxygen/namespacellvm_1_1PPCII.html)|prefixed form exists; union incomplete|
|Wasm|[Wasm tail-call spec](https://webassembly.github.io/tail-call/core/_download/WebAssembly.pdf)|validation fixes stack contract|
|RVC|[CC'23 compressed RA](https://pp.ipd.kit.edu/uploads/publikationen/fried23cc.pdf)|direct collision|

No absence claim is used as novelty evidence.
