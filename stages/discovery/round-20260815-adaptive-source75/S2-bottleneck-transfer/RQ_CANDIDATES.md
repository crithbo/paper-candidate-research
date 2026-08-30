# Source75 primary RQ cards

## RQ-01 — GCC C++ CMI construction and import

- Seed / anchor frozen before evidence: S75-01; GCC current C++ Modules and CMI manuals, accessed 2026-08-15.
- Exact tentative object: a fixed C++20 module-import DAG, source units and compiler version; observable output is the same object output plus import-visible exported declarations.
- Primary RQ: **For one fixed GCC module DAG, is there a semantic-preserving joint CMI construction and import-materialization algorithm whose complete compile/import cost differs from the current mapper, CMI cache, lazy-read and file-LRU composition?**
- Immutable boundary: no source-level module rewrite, no changed import graph, no different compiler-version CMI contract, and no external build wrapper.
- Counterfactual: a construction result would change how a build system/compiler constructs the same CMI graph, not merely which command flag is selected.
- Precommitted primary route: GCC C++ Modules, CMI, and Module Mapper manuals. Fallback only for transport failure: current GCC source browser for `cp/module.cc`.
- FINER-lite: feasible conditional; relevant to large module DAG builds; novelty threat high; scope pass.
- Disposition after ordinary closure: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_MAPPER_LAZY_READ_LRU_COMPOSITION_AND_NO_TARGET_SPECIFIC_ALGORITHM_SKELETON`.

## RQ-02 — LLVM Mach-O compact-unwind construction

- Seed / anchor frozen before evidence: S75-02; LLVM current CodeGenerator documentation and current JITLink Mach-O x86-64 source, accessed 2026-08-15.
- Exact tentative object: a fixed x86-64 Mach-O program, ABI, functions and stock unwinder observable behavior.
- Primary RQ: **Can frame realization and compact-unwind section construction be jointly optimized for the same Mach-O image by a target-specific algorithm with a guarantee beyond the current compiler/linker pass composition?**
- Immutable boundary: same instructions/program semantics, ABI and stock `__TEXT,__unwind_info` semantics; no custom unwinder, changed exception guarantee, or postprocess wrapper.
- Counterfactual: the joint action would change a compiler/linker construction decision rather than select a flag or reorder independent metadata records.
- Precommitted primary route: LLVM compact-unwind documentation and JITLink source. Fallback only for transport failure: official LLVM GitHub source at the same path.
- FINER-lite: feasible conditional; important if a residual survives; novelty threat high; scope pass.
- Disposition after ordinary closure: `LOCATOR_ONLY__TARGET_SPECIFIC_ACTION_AND_GUARANTEE_NOT_FROZEN`; this is not a scientific negative inference.

## RQ-03 — HotSpot segmented code-cache construction

- Seed / anchor frozen before evidence: S75-03; JDK 25 `java` command specification, accessed 2026-08-15.
- Exact tentative object: fixed Java application, JDK 25 configuration, code-cache contents and executable semantics.
- Primary RQ: **Does a whole code-cache placement/reclamation construction under fixed tiered-compilation semantics admit a non-controller, target-specific guarantee beyond HotSpot's segmented-code-cache configuration and sweeping controls?**
- Immutable boundary: same Java execution and JIT code semantics; no changed tiering policy outcome, no cache proxy and no scheduler/controller wrapper.
- Counterfactual: only a construction/guarantee, not tuning a segment size or sweep threshold, could change the same-object full-cost decision.
- Precommitted primary route: JDK 25 command specification; fallback only for transport failure: current OpenJDK code-cache source.
- FINER-lite: feasible conditional; relevance clear; novelty threat high; scope pass.
- Disposition after ordinary closure: `EXCLUDED_BEFORE_RAW__CACHE_SEGMENT_CONFIGURATION_AND_SWEEPING_CONTROLLER_SHELL`.

No pre-RQ closure nomination was made: selective depth is OFF and each chosen primary official route was directly reachable.
