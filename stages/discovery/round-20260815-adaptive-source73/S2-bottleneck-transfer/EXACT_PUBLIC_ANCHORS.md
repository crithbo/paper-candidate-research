# Source73 exact public anchors

| Locator | Public identity, version/date | Object/guarantee envelope | Anchor question | Primary source / fallback | Status |
|---|---|---|---|---|---|
| S73-L01 | GCC online manual, current page accessed 2026-08-15 | AArch64 ABI-preserving `memcpy`/`memmove`/`memset` lowering | Does the documented target/config action surface already reduce this to feature/cost selection? | `https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html`; GCC source only if needed | closed |
| S73-L02 | OpenMP 5.2 `target enter data`, current official HTML accessed 2026-08-15 | same program/device-data-environment semantics | Does the native directive already expose map, dependence and deferred-task actions? | `https://www.openmp.org/spec-html/5.2/openmpse83.html` | closed |
| S73-L03 | JDK 25 `java` command specification, current page accessed 2026-08-15 | same class path, loaded classes, stock JVM archive/read semantics | Is a non-generic stock-reader-compatible archive constructor identifiable? | `https://docs.oracle.com/en/java/javase/25/docs/specs/man/java.html`; `https://github.com/openjdk/jdk/tree/master/src/hotspot/share/cds` | bounded locator only |
| S73-L04 | LLVM RISC-V user guide, current page accessed 2026-08-15 | fixed IR/observable code semantics on a Zicbop target | Is a target-specific action left beyond existing prefetch mechanisms? | `https://llvm.org/docs/RISCVUsage.html`; `https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVTargetMachine.cpp` | closed |

The registry/history preflight was a bounded exact-string search over the frozen `registry.yaml`. It found no five-field exact identity for the four new locators; `NO_MATCH` is recorded only as a registry-surface result and is not a novelty or absence claim. The `OPENJDK-JIMAGE-VERSIONAWARE-LAYOUT-DELTA` record is `RELATED_ONLY` to S73-L03: it has a different artifact/reader endpoint (jimage/jrt launcher rather than AppCDS/JVM archive).

