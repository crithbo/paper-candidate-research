# Source69 S5 RQ candidates

## RQ-S69-01

- Discovery lane / assignment: S5 / DISCOVERY-S5-20260815-ADAPTIVE-SOURCE69-R40-ORDINARY-BREADTH-V1
- Divergence seed: S69-01
- Tentative public object: current clangd-built C++ module files published into its persistent cache.
- Exact public anchor and version/date: LLVM clang-tools-extra ModulesBuilder.cpp current doxygen source, accessed 2026-08-15; the source description names BuiltModuleFile and CopyOnReadModuleFile.
- Stable object and immutable guarantee envelope: published module-file bytes must remain acceptable to the existing clang reader; readers must not observe an in-place replacement.
- Decision-relevant counterfactual consequence: a bounded-recourse native publisher would reduce retained/rebuilt module artifacts while preserving parser acceptance during concurrent rebuilds.
- Contribution type hypothesis: COMPILER_TOOL / N2.

### Primary RQ

For current clangd built module files, can a whole publication constructor bound the number and copy cost of valid concurrent module-image generations while preserving the same reader-visible module contents and copy-on-read acceptance semantics?

### Scope and answerability

- In scope: native module-file build, persistent-cache publication, copy-for-read and reader acceptance.
- Out of scope: module cache prune interval tuning, generic RCU libraries, changing the PCM format, and any cache-hit controller.
- Candidate methodology: source-level union audit and a finite native two-generation witness.
- Minimum public carrier/oracle route: current clangd source plus a versioned public clangd module test or natural C++ module revision trace.
- Earliest falsifier: current native union already jointly realizes bounded versioned publication, or no public exact carrier/oracle can be frozen.

### FINER-lite

- Feasible: CONDITIONAL — source anchor is public; a versioned natural carrier was not yet identified.
- Interesting: CONDITIONAL — only if it is not already the current copy-on-read design.
- Novelty threat: HIGH — adjacent Clang PCH/PCM work is recorded in the registry.
- Ethical/scope fit: PASS.
- Relevant: CONDITIONAL.

### Pre-evidence selection and ordinary closure

- Selected for evidence lookup: YES.
- Alternative explanation/null: the existing stable publication plus copy-on-read is already the complete target-native transition.
- Precommitted primary evidence route: current clangd doxygen/source for ModulesBuilder.cpp.
- Transport-only fallback: current LLVM repository source path for the same file.
- Nomination: ORDINARY_CLOSURE; selective depth OFF.
- Packet result: EARLY_FATAL_TO_RAW_ADMISSION — not a scientific STOP: current source describes the target-native decomposition, and the required natural carrier/oracle was not frozen.
- Disposition: RQ_BACKLOG__CURRENT_UNION_OR_CARRIER_UNCLOSED.
