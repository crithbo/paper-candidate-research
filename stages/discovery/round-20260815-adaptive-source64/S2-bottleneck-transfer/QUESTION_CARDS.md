# Question cards — Source64

## S64-01 — OpenMP target dependence/data-environment lowering

- Exact identity and semantics: a fixed OpenMP program, target device mapping and task/dependence semantics, with the same target-execution result.
- Official locus: LLVM documents separate host, target-host, plugin, and device runtimes; `OMPIRBuilder.h` current upstream represents offload-target configuration, target-region entries, and requires state.
- Initial full-cost boundary: lowering/compile CPU-RSS-temp, generated mapping/dependence metadata bytes, host-device copies, runtime setup, and target end-to-end latency.
- Skeptical alternative: a purported joint lowering merely chooses current mapping/options or task scheduling.
- Front-end disposition: `LOCATOR_ONLY__NON_GENERIC_ATOMIC_CONSTRUCTOR_NOT_FROZEN`.
- Reason: the public sources make the current action surface concrete, but this RQ contains no source-supported target-specific construction skeleton or guarantee beyond choosing mapping/runtime behavior.  It is not treated as a scientific DROP, nor promoted to raw on an API/configuration-shaped hypothesis.

## S64-02 — XLA alias/copy/buffer construction

- Exact identity and semantics: a fixed HLO module, input/output behavior and target executable.
- Official locus: OpenXLA describes layout assignment, a schedule selected for peak memory, latency-hiding scheduling, rematerialization, HLO dataflow and alias analyses, buffer assignment, thunk emission, and command-buffer conversion.
- Initial full-cost boundary: compile/schedule/buffer-assignment CPU-RSS-temp, allocation and copy bytes, peak memory, generated executable bytes, and runtime latency.
- Skeptical alternative: any proposal is generic interval/graph packing or an existing schedule/rematerialization/layout configuration.
- Front-end disposition: `EXCLUDED_BEFORE_RAW__GENERIC_WHOLE_PROGRAM_BUFFER_PACKING_SKELETON`.
- Reason: no target-specific atomic decision, algorithmic invariant, or guarantee was frozen beyond a generic placement/copy optimization; existing passes already span the named native stages.  This excludes only the stated generic sketch, not future same-object research with a distinct target-specific algorithm.

## S64-03 — ORC materialization-state construction

- Exact identity and semantics: a fixed module set and target triple, preserving JITDylib lookup/materialization and executable symbol behavior.
- Official locus: ORC exposes `MaterializationUnit`, `MaterializationResponsibility`, layers, JITDylibs, eager/lazy materialization, reexports, custom compilers, dependency tracking, and client-selected concurrent dispatch.
- Initial full-cost boundary: compile/link/materialization CPU-RSS-temp, lookup and first-call latency, code/stub bytes, resident memory, and steady-state call overhead.
- Skeptical alternative: selecting/caching/composing existing layers, reexports, or a work-queue dispatcher.
- Front-end disposition: `EXCLUDED_BEFORE_RAW__CURRENT_COMPOSABLE_LAYER_UNION_AND_GENERIC_WRAPPER`.
- Reason: no union-external complete action or target-specific guarantee survived the current official action union; the sketch is a generic layer composition/wrapper rather than N1/N2.
