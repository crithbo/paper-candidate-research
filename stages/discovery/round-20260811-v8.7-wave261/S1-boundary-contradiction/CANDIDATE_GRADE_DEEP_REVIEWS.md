# Candidate-grade deep review — Wave261

## Current upstream reality and source-pinned union

[LLVM's current LoongArch target configuration](https://llvm.org/docs/doxygen/LoongArchTargetMachine_8cpp_source.html) states that `loongarch-enable-merge-offset` defaults true and exposes its disable flag. It initializes `MergeBaseOffset`, target pseudo expansion and the target selector. The same source declares pre-RA and RA rewrite hooks; it adds branch relaxation pre-emit and pseudo expansion at the final stage. [MergeBaseOffset](https://llvm.org/doxygen/LoongArchMergeBaseOffset_8cpp.html) specifically recognizes `MO_*_PCADD_LO` relocation forms. Therefore the union cannot honestly be reduced to an early peephole.

The [LoongArch ELF ABI](https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.pdf) fixes PC-relative relocation computations and declares `R_LARCH_RELAX`. Current [GCC documentation](https://gcc.sourceware.org/onlinedocs/gcc-14.1.0/gcc/LoongArch-Options.html) says `-mexplicit-relocs=auto` uses relocation operators where relaxation cannot improve code quality and macros elsewhere; defaults depend on assembler support and `-mrelax`. The official [binutils relaxation patch](https://sourceware.org/pipermail/binutils/2023-May/127539.html) documents the two concrete relaxable PC-relative sequences and their scheduling interaction.

## Action-divergence test

The tempting witness is a fixed PC-relative load, with a call/pressure interval between address materialization and use: one legal path retains a base virtual register, while another emits a macro-compatible sequence that a linker may relax. Both can preserve program, ABI, relocation and unwind semantics. This is only a *possibility* of differing final paths. It is not the required strong witness: the current GCC union already makes an explicit-reloc/macro/relax choice, while LLVM's pinned source has target merge, generic RA and late emission stages. The review did not establish a trace where the complete stock composition is forced to choose A and a named non-generic construction is forced to choose B.

The six required dimensions consequently fail closed: decision rule is unfrozen across compiler/linker; information is shared; resource/cost is the familiar bytes versus temporary/spill/relax tradeoff; no stronger quality/guarantee is proved; full cost is enumerable but unmeasured; and a prospective solver has no no-gain boundary distinct from normal form selection/RA. Any claimed DP currently collapses to pass composition or a generic solver.

## Decision

`NOT_ADMITTED_UNFROZEN`; `PROPOSE_STAGE0=[]`. This is not a scientific DROP based on missing implementation, result, hardware, AI readiness, or the GCC 429. It is an evidence-honest failure to freeze both (1) a mandatory LoongArch-native action-divergence witness and (2) a non-generic algorithm/guarantee above the complete LLVM/GCC/binutils union.

## Finite 72-hour killer if re-assigned

Pin the three upstream commits (including a retried GCC pin); enumerate LLVM and GCC default/nondefault form/relax flags and all LLVM passes through MC/linker; use one public PC-relative trace with exact relocation/unwind oracle; require a candidate named state/transition algorithm and a strict Pareto point versus both stock pipelines. Kill on changed ABI/relocation semantics, current-union expression, arbitrary register permutation, generic ILP/CP, cost tuning, source witness failure, collision, or no strict point. This is a plan only; no test/benchmark was run.
