# Source and Collision Audit — X86-STACKCLASH-FRAME-PROBE-REGISTER-PARETO-FPT

## Independent source-reality check

Only official LLVM/GCC sources and upstream implementation material were consulted. No implementation, compilation, benchmark or generated-code test was run.

| Source | Finding | Scientific role |
|---|---|---|
| [Clang command reference](https://clang.llvm.org/docs/ClangCommandLineReference.html) | `-fstack-clash-protection` instruments stack allocation; `-mstack-arg-probe` and `-mstack-probe-size` are exposed configuration dimensions. | prevents missing-knob premise; freezes finite grid. |
| [LLVM stack-clash design](https://blog.llvm.org/posts/2021-01-05-stack-clash-protection/) | x86 starts with a free call-site probe; static allocation uses page chunks and probes; asynchronous interruption prohibits two small allocations without a probe. | exact safety predicate and deterministic state progression. |
| [current X86 frame lowering](https://llvm.org/doxygen/X86FrameLowering_8cpp_source.html) | `emitStackProbeInlineGeneric` reads `Offset`, probe size and alignment, then emits a block or loop; generated CFI is tied to frame setup. | shows static probe schedule is post-frame, numeric and not a register-allocation action. |
| [current PEI source](https://llvm.org/docs/doxygen/PrologEpilogInserter_8cpp_source.html) | places CSR spill/restore code, lets target finalize, calculates frame offsets, then inserts prologue/epilogue. | fixes pipeline order and invalidates a concurrent live-scratch premise. |
| [current Greedy RA source](https://llvm.org/doxygen/RegAllocGreedy_8cpp_source.html) | `tryAssignCSRFirstTime` compares CSR prologue/epilogue cost with spill cost; splitter/spiller actions are current. | direct subtractor for CSR/spill choice. |
| [LLVM x86 implementation review D68720](https://reviews.llvm.org/D68720) | documents inline page probing and includes static/dynamic, multi-object and natural-probe tests. | confirms current union includes relevant probe forms. |
| [GCC official instrumentation docs](https://gcc.gnu.org/onlinedocs/gcc-12.4.0/gcc/Instrumentation-Options.html) | describes page-at-a-time allocation/access under stack-clash protection. | same security family subtractor; not falsely used as identical LLVM baseline. |

## Collision conclusion

Current upstream does not need to contain a globally optimized FPT solver to absorb this candidate. Its proposed composite has no valid fourth native action: after RA and frame finalization, static probing depends only on total offset/alignment/probe size; before body execution, a probe temporary is not a register-allocated live value. Existing CSR-versus-spill selection and deterministic probe generation therefore leave only generic cost tuning/packing. This is a structural current-union collision, not an absence inference.

## Scope / integrity notes

- LLVM main pin: `e72ba6cf366a3180cbf5a8690d9e50665880ab76`, verified read-only on 2026-08-14.
- The target is only x86-64 Linux SysV static-frame stack-clash protection. Windows/CoreCLR and a dynamic-allocation proposal are excluded rather than silently generalized.
- No direct literature-absence assertion is made; no transport failure was used as evidence.

