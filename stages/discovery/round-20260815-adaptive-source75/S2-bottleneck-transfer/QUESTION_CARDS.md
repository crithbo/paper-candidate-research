# Evidence-qualified Question Card outcomes

## QC-S75-01 — GCC CMI

- Exact identity / carrier: current GCC manual; fixed C++20 module DAG and source units; implementation carrier only. Network-security check: PASS.
- Same-object contract: same source DAG, exported declarations, compiler version and CMI import semantics. The full-cost boundary would be module-interface compile, CMI write/rename, CMI mapping/open/mmap, import CPU/RSS/FD pressure and object output.
- Current reality: the official manuals expose `-fmodules`, `-fmodule-only`, module mapper controls, compiler-version-tied CMI, atomic replace, lazy `mmap` reads, `-fno-module-lazy`, and an LRU close policy. This is supporting *and contrary* evidence: it shows the apparent transfer is already addressed by native mapping/materialization controls.
- Proposed non-generic discriminator tested: a target-specific whole-CMI construction algorithm rather than mapper/cache policy. It could not be named without changing the object, invoking an external build wrapper, or relabeling existing materialization controls.
- Cheapest falsifier: name one same-DAG CMI construction state/action with a guarantee not expressible by the documented native composition. It failed at the action skeleton, before raw.
- Disposition: `EXCLUDED_BEFORE_RAW`; reason: current action composition plus the only remaining sketch is a generic cache/mapper shell. This is a structural screening result, not a result/implementation/resource inference.

## QC-S75-02 — LLVM Mach-O compact unwind

- Exact identity / carrier: current LLVM docs/source; fixed x86-64 Mach-O program, ABI and stock unwinder; implementation carrier only. Network-security check: PASS.
- Same-object contract: same executable semantics and `__TEXT,__unwind_info` accessibility; full-cost would include frame/code generation, link/JITLink construction, metadata bytes, runtime unwind lookup, CPU/RSS and temporary bytes.
- Current reality: documentation makes the size/lookup motivation and encoding/frame restrictions concrete; current JITLink installs preparation, reservation and final writing passes around a `CompactUnwindManager`. No absence claim is made.
- Non-generic discriminator needed: a target-specific coupled frame-plus-unwind algorithm with an exact/FPT/approximation/Pareto guarantee relative to this native composition.
- Cheapest falsifier: write a fixed-function witness in which the proposed joint action cannot be replayed by the current frame lowering plus prepare/reserve/write pipeline while the stock unwinder accepts both images. The assignment's bounded source route did not furnish a concrete action/guarantee skeleton; merely permuting metadata is generic packing.
- Disposition: `LOCATOR_ONLY`; `RAW_REQUIRED=INCOMPLETE`, no C0/deep. Bounded debt: freeze a single target/function-class and non-generic guarantee from a primary source or formal construction. No resource failure and no scientific DROP are inferred.

## QC-S75-03 — HotSpot segmented code cache

- Exact identity / carrier: JDK 25 official command specification; fixed Java workload/JDK execution; implementation carrier only. Network-security check: PASS.
- Same-object contract: same compiled Java behavior, same tiered compilation and code-cache semantics. Full cost would include compilation, code-cache residency, reclamation, code bytes, RSS and runtime execution.
- Current reality: official controls already expose segmented non-method/profiled/non-profiled code regions, default enablement condition, fixed segment sizing, segment-size controls and sweep threshold. These are defaults/non-defaults considered before any absence conclusion.
- Proposed discriminator tested: a whole construction with a formal guarantee, not a size/threshold selector or online cache controller. No such action was frozen; the described decision remains placement/reclamation policy.
- Cheapest falsifier: identify a static semantic code construction that is neither a code-cache configuration nor a controller and that changes the stated cost boundary. The sketch fails the noun-swap test.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_CONTROLLER_CONFIG_SHELL`.

## Count

`EVIDENCE_QUALIFIED_RAW=0`, `C0=0`, `D1=0`, `DEEP=0`, `CLEAN_STAGE0_BRIEF=0`.
