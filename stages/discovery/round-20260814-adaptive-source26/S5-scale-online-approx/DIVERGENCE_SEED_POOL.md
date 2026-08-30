# Divergence Seed Pool — Source26

## Pool metadata

- Assignment / lane: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE26-EVIDENCE-CLOSURE-TRIAD-V1` / S5.
- Frozen profile: `SOURCE26_EVIDENCE_CLOSURE_TRIAD_V1`; v8.7 canonical; V9 OFF.
- Seed ceiling: 12; selected-locator ceiling: 4.
- Network-security exclusion check: PASS. No security, vulnerability, exploit, attack, defensive, or protocol-security subject was retained.
- Generation completed before evidence lookup: YES. This file was created without external lookup, download, build, or execution.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S26-01, S26-09 |
| `PROBLEM_REFRAMING` | yes | S26-02, S26-10 |
| `CONSTRAINT_MANIPULATION` | yes | S26-03, S26-11 |
| `NEGATION_OR_INVERSION` | yes | S26-04 |
| `ABSTRACTION_LADDER` | yes | S26-05 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S26-06 |
| `JANUSIAN_TENSION` | yes | S26-07 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S26-08, S26-12 |

Perspective rotation: END_USER (S26-02), OPERATOR (S26-11), MAINTAINER (S26-03), COMPILER_OR_BACKEND_ENGINEER (S26-01/S26-04/S26-06), HARDWARE_ARCHITECT (S26-07), MEASUREMENT_REVIEWER (S26-10), THEORIST (S26-05/S26-09).

## Seed records

### S26-01

- Engine / role: `BISOCIATION_STRUCTURAL_TRANSFER` / COMPILER_OR_BACKEND_ENGINEER.
- Sketch: Treat WebAssembly control-flow structuring after an edit as a bounded-recourse rewrite of a typed stack program, rather than as a fresh whole-module lowering. The structural mapping is edited CFG region → affected structured region → validated binary module.
- Conclusion-first test: At most, a target-specific incremental structuring constructor could preserve the exact WebAssembly validation/observable behavior while bounding rewritten regions; that matters when module generation is interactive or repeated.
- Risk / evidence needed: Existing Binaryen Relooper and `wasm-opt` may already express it; need official current source, validation contract, and a versioned module carrier.
- Relation / noun-swap: FRESH_SKETCH / PASS; preliminary `KEEP_FOR_CONVERGENCE`.

### S26-02

- Engine / role: `PROBLEM_REFRAMING` / END_USER.
- Sketch: Reframe shader pipeline cache growth from an eviction-policy question into preserving pipeline-library compatibility while incrementally coalescing compiled state. The tension is exact driver-visible pipeline semantics versus bounded state transfer.
- Conclusion-first test: A result would only concern a named API's compatible pipeline state and a bounded-recourse constructor, not generic cache policy; users care if recompilation stalls are avoided without changing compiled behavior.
- Risk / evidence needed: likely driver-specific/closed or controller-like; require official API compatibility semantics, public trace, and stock oracle.
- Relation / noun-swap: FRESH_SKETCH / PASS; preliminary `KEEP_FOR_CONVERGENCE`.

### S26-03

- Engine / role: `CONSTRAINT_MANIPULATION` / MAINTAINER.
- Sketch: For Yosys technology mapping, impose a fixed target-cell library and equivalence contract while changing only a small RTL cone. Ask whether a certified local-global remapping action can bound netlist disturbance without weakening logic equivalence.
- Conclusion-first test: The narrow conclusion would be an exact target-library remapping construction with a certified recourse/quality bound, useful for incremental hardware design flows.
- Risk / evidence needed: generic SAT/mapping or existing incremental flow could absorb it; need current `abc`/techmap union, equivalence checker, and versioned open RTL changes.
- Relation / noun-swap: FRESH_SKETCH / PASS; preliminary `KEEP_FOR_CONVERGENCE`.

### S26-04

- Engine / role: `NEGATION_OR_INVERSION` / COMPILER_OR_BACKEND_ENGINEER.
- Sketch: Invert the usual “rebuild DWARF after every link” premise for a fixed ELF binary interface: can a changed function’s line/call-site metadata be reconstructed with bounded rewrite while preserving consumer-visible debug semantics?
- Conclusion-first test: Only an exact consumer-compatible debug-info constructor with an explicit rewrite/space bound would matter; it would matter to incremental native linking.
- Risk / evidence needed: explicitly active/blocked `LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY` in plan; must not proceed.
- Relation / noun-swap: ACTIVE_OR_STOP_IDENTITY / PASS; preliminary `ACTIVE_OR_STOP_IDENTITY`.

### S26-05

- Engine / role: `ABSTRACTION_LADDER` / THEORIST.
- Sketch: Move from individual eBPF instruction rewrites to a fixed verifier-accepted program and map-update sequence, then seek an update constructor preserving verifier acceptance and observable map semantics with bounded state transfer.
- Conclusion-first test: The possible conclusion is a target verifier-specific transition guarantee, not a generic program optimizer.
- Risk / evidence needed: verifier/security boundary and active cached-state history make it out of assignment scope.
- Relation / noun-swap: FORBIDDEN_SCOPE / PASS; preliminary `FORBIDDEN_SCOPE`.

### S26-06

- Engine / role: `ADJACENT_POSSIBLE_OR_BOUNDARY` / COMPILER_OR_BACKEND_ENGINEER.
- Sketch: For SPIR-V modules, use the boundary between validation and optimizer recipes to ask whether debug-preserving incremental canonical construction is possible after a small edit. The potentially new constraint is exact debug/instruction identity at untouched regions.
- Conclusion-first test: A narrow tool contribution would be a target-specific region-stability guarantee, if current optimizer passes cannot express the joint action.
- Risk / evidence needed: Source25 already exposed SPIRV-Tools canonicalization union; likely contained unless the debug identity guarantee is independently frozen.
- Relation / noun-swap: CONTAINED / PASS; preliminary `CONTAINED`.

### S26-07

- Engine / role: `JANUSIAN_TENSION` / HARDWARE_ARCHITECT.
- Sketch: In an open accelerator compilation stack, retain both bit-exact quantized outputs and a changing on-chip memory budget; seek a target-specific tensor-layout constructor with a certified bounded-movement guarantee.
- Conclusion-first test: At most, it could establish a named backend/layout guarantee rather than a quantization option search; this matters when hardware scratchpad capacity changes across deployment modes.
- Risk / evidence needed: generic layout scheduling/option grid and paper-owned mappings are likely; need official backend mapping source, bit-exact oracle, and public model/version carrier.
- Relation / noun-swap: FRESH_SKETCH / PASS; preliminary `KEEP_FOR_CONVERGENCE`.

### S26-08

- Engine / role: `COMPOSE_DECOMPOSE_SIMPLIFY` / OPERATOR.
- Sketch: Decompose a Protobuf descriptor-set update into schema graph, generated-message compatibility, and serialized wire acceptance; ask whether compatible schema deltas admit a bounded-recourse descriptor-table constructor.
- Conclusion-first test: A result would only cover a fixed Protobuf compatibility class and exact stock reader acceptance, not generic compression or repacking.
- Risk / evidence needed: earlier format/descriptor family work may contain it; need current compiler/runtime union, official compatibility rules, and versioned public schema history.
- Relation / noun-swap: FRESH_SKETCH / PASS; preliminary `KEEP_FOR_CONVERGENCE`.

### S26-09

- Engine / role: `BISOCIATION_STRUCTURAL_TRANSFER` / THEORIST.
- Sketch: Transfer bounded-recourse tree rotation ideas to an AIG-based logic network, but insist that every changed cone remains accepted by a stock equivalence checker and fixed mapping objective. The mapping is edit locality → cut boundary → equivalence-preserving network transformation.
- Conclusion-first test: The credible claim is a target-specific AIG constructor with a recourse/area-delay guarantee, not generic graph rewriting.
- Risk / evidence needed: may be generic resynthesis; needs a current official AIG/ABC action map and public versioned circuit history.
- Relation / noun-swap: FRESH_SKETCH / PASS; preliminary `KEEP_FOR_CONVERGENCE`.

### S26-10

- Engine / role: `PROBLEM_REFRAMING` / MEASUREMENT_REVIEWER.
- Sketch: Characterize whether module-size growth produces a stable compile-time/RSS cliff in a fixed compiler pass and derive a constructive mitigation. The object is an observation family rather than an online constructor.
- Conclusion-first test: This could be N3 only if a versioned natural corpus and a decision-changing stable law are available; it is not an implementation-speed anecdote.
- Risk / evidence needed: target compiler/corpus and confounder plan are absent.
- Relation / noun-swap: FRESH_SKETCH / PASS; preliminary `KEEP_FOR_CONVERGENCE`.

### S26-11

- Engine / role: `CONSTRAINT_MANIPULATION` / OPERATOR.
- Sketch: For an open package manager, lock package semantics and weaken only the requirement that a full dependency solution be regenerated after a repository delta. Search for a certified incremental explanation constructor.
- Conclusion-first test: It could matter as a target-format proof/explanation guarantee, not as a generic dependency solver or scheduling policy.
- Risk / evidence needed: generic solver prohibition dominates.
- Relation / noun-swap: GENERIC_SHELL / GENERIC_SHELL; preliminary `GENERIC_SHELL`.

### S26-12

- Engine / role: `COMPOSE_DECOMPOSE_SIMPLIFY` / MAINTAINER.
- Sketch: Separate a Verilog design’s syntax-preserving edit path from its elaborated representation, then ask for an exact incremental elaboration constructor with bounded regenerated hierarchy. The target-specific action would be a legal elaborated-design state transition checked against stock elaboration.
- Conclusion-first test: A valid conclusion would concern fixed-language elaboration equality and bounded recourse, useful for frequent design edits.
- Risk / evidence needed: active Verilator identity and generic elaboration machinery can absorb it.
- Relation / noun-swap: ACTIVE_OR_STOP_IDENTITY / PASS; preliminary `ACTIVE_OR_STOP_IDENTITY`.

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative |
|---|---|---|---|---|
| Compiler binary/state reconstruction | S26-01, S26-04, S26-06 | incremental compiler representation construction | WebAssembly structuring vs DWARF vs SPIR-V debug stability | S26-01 |
| Logic/RTL exact constructor | S26-03, S26-09, S26-12 | equivalence-preserving circuit/netlist change | tech mapping vs AIG rewrite vs elaboration | S26-03 |
| Accelerator/state-layout | S26-02, S26-07 | bounded state transfer under a resource budget | API pipeline compatibility vs bit-exact layout | S26-07 |
| Structured artifacts | S26-08, S26-11 | incrementally updated declarative structure | reader-compatible descriptor graph vs generic dependency solve | S26-08 |
| Characterization | S26-10 | scale-law measurement | N3 rather than constructor | S26-10 |

## Coverage-constrained convergence and precommit

Selected locators were frozen before any external evidence lookup. Selection preserves different object classes, contribution routes, and contrary routes; it is not a score ranking.

| Selected seed | Coverage reason | Precommitted exact locator / source routes in order | Question Card |
|---|---|---|---|
| S26-01 | target-specific compiler tool / exact validator | Binaryen WebAssembly structuring: ANCHOR official Binaryen source/docs; CURRENT_UNION `wasm-opt`/Relooper current source; CONTRARY official WebAssembly validation/spec. Fallback: official release/API docs. | QC26-01 |
| S26-03 | target-cell-library exact constructor / checker | Yosys techmap after RTL delta: ANCHOR official Yosys `techmap`/`abc` source/docs; CURRENT_UNION official current command and config docs; CONTRARY official `equiv_*` checker/source. Fallback: Yosys tests/manual. | QC26-02 |
| S26-07 | accelerator bit-exact resource boundary | IREE target backend layout/dispatch state: ANCHOR official IREE compiler source/docs; CURRENT_UNION official target configuration/source; CONTRARY official test/oracle documentation. Fallback: IREE release notes/tests. | QC26-03 |
| S26-08 | stock reader compatibility / structured schema | Protobuf descriptor-set compatible update: ANCHOR official protobuf descriptor/compiler docs; CURRENT_UNION current compatibility/source route; CONTRARY official cross-version/runtime compatibility docs/tests. Fallback: official protobuf language guide. | QC26-04 |

## Append-only backlog

S26-02, S26-05, S26-06, S26-09, S26-10, S26-11, and S26-12 remain non-evidentiary. No later evidence result will cause source26 outcome-aware replacement.

## Advisory

- Engines used: 8; perspective roles used: 7; largest surface: compiler/RTL constructor (4/12).
- `DIVERGENCE_COVERAGE_ADVISORY`: PASS.
- Plain-Chinese note: 四个入选 locator 覆盖 WebAssembly、逻辑综合、加速器后端和 Protobuf 兼容对象；未选 seed 留在 backlog，不计作科学机会。
