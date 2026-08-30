# Discovery Question Cards — Source25

## Batch contract

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE25-DIVERGENCE-V1R1`
- Canonical method: v8.7; `DISCOVERY_CLAIM_PACK_MODE=OFF`; no V9 material was generated.
- Seed source: `DIVERGENCE_SEED_POOL.md`, frozen before any network request.
- Retrieval scope: four selected locators only; official repositories/documentation only; no download, build, install, E2, experiment, or benchmark.
- Response/storage budget: rendered responses were well below 64 MiB and no source asset was persisted (0 bytes of downloaded materials), below the 128 MiB cap.

## QC25-01 — TensorFlow Lite Micro exact arena relocation

- Seed / engine: `S02` / Constraint Manipulation; selected as the bounded-memory and online-update perspective.
- Exact identity frozen so far: TensorFlow Lite for Microcontrollers `main` repository, a TensorFlow Lite port for ML models on DSPs and memory-limited microcontrollers.
- Primary snapshot: official repository page, accessed 2026-08-14; it documents limited-memory deployment and exposes Memory Management/Benchmarks/Profiling documentation links.
- Proposed same-object question: whether a model-specific interpreter arena can be updated while preserving an exact TensorFlow Lite Micro invocation result and a bounded movement/peak-memory guarantee.
- Candidate type / endpoint: `METHOD_ALGORITHM`; target-specific bounded-recourse allocator/placement guarantee, if the exact model graph, allocator state transition, and checker can be frozen.
- Current union snapshot: the official repository exposes its current TensorFlow Lite Micro code tree and documentation, including memory-management material; the bounded rendering did not establish the allocator's complete legal state/action union, default and non-default arena configuration, or a versioned public model-update carrier.
- Strongest subtractor: stock TensorFlow Lite Micro allocation and any documented memory-management mode under the same model/invocation semantics.
- Natural carrier/oracle/fidelity route: a versioned public microcontroller model corpus plus stock invocation equality would be required. Neither a carrier version nor the stock allocator transition semantics was closed in this bounded source pass.
- Full-cost denominator required if resumed: update/move bytes, peak arena bytes, persistent bytes, invocation CPU, build/update CPU, and failure/rollback work.
- Minimum falsifier: one fixed model update where the proposed movement action changes a stock invocation output, violates capacity, or has no lower moved-byte/peak-memory bound against the complete stock union.
- Disposition: `LOCATOR_ONLY__UNFROZEN_CURRENT_ACTION_UNION_AND_VERSIONED_CARRIER`.
- Reasoning ceiling: no absence claim is made. The repository establishes relevance, not an unexpressed action gap.

## QC25-02 — SPIR-V Tools incremental canonical module construction

- Seed / engine: `S03` / Adjacent Possible; selected as a compiler/tool semantic-boundary perspective.
- Exact identity frozen so far: SPIR-V binary modules accepted by current SPIRV-Tools assembler/parser/disassembler/validator/optimizer interfaces.
- Primary snapshot: KhronosGroup/SPIRV-Tools official repository page, accessed 2026-08-14. It states that the project provides assembler, parser, disassembler, validator, and optimizer; its optimizer is a collection of transformation passes and recipes such as `-O`/`-Os`, including ID canonicalization.
- Proposed same-object question: a bounded-recourse update constructor that maps a changed SPIR-V module to a valid semantically equivalent module while reducing total recanonicalization work.
- Candidate type / endpoint: `COMPILER_TOOL`; exact validity plus semantic-preservation and bounded-recourse construction would be required.
- Current union / strongest subtractor: current `spirv-opt` pass and recipe union, including existing canonicalization and other transformations, under the same module semantics. This is already a strong direct subtractor.
- Natural/canonical carrier and oracle: a versioned public SPIR-V module suite plus a semantics-equivalence oracle is required; the validator alone checks validity and was not established as such an equivalence oracle in this pass.
- Full-cost denominator required if resumed: all parse/validation/optimization work, module bytes, peak RSS/temp, preserved-debug-information contract, and output revalidation/equivalence cost.
- Minimum falsifier: a two-edit module pair for which a proposed incremental action either changes semantics, produces an invalid module, or is fully expressible as a stock optimizer pass sequence with no recourse bound left.
- Disposition: `LOCATOR_ONLY__CURRENT_UNION_STRONG_AND_SEMANTIC_ORACLE_UNFROZEN`.
- Reasoning ceiling: this is not a claim that SPIRV-Tools lacks an action. The documented optimizer/canonicalization union is adverse evidence; without a target-specific action and an equivalence oracle, a residual cannot enter raw.

## QC25-03 — MLIR sparse-layout state transfer

- Seed / engine: `S05` / Compose–Decompose; selected as an online state-transfer perspective.
- Exact identity attempted: MLIR SparseTensor lowering/layout representation while preserving MLIR program semantics.
- Primary snapshot: official MLIR Language Reference and Vector documentation, accessed 2026-08-14; they describe a generic, extensible IR and target-specific lowering/retargeting mechanisms.
- Current union / collision finding: the registry already records `SPIRV__OPENJDK_CDS__LUA_BINARY_CHUNK_NOT_ADMITTED_UNFROZEN` and Source25's bounded source material establishes only generic MLIR lowering rather than a new target-specific object. A current sparse-layout reader/transition semantics, a versioned natural carrier, and a stock semantic oracle were not frozen.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_MLIR_LOWERING_IDENTITY_NOT_CLOSED`.
- Reasoning ceiling: no generic MLIR retargeting or layout selection is relabelled as a new constructor; no current-absence claim is made.

## QC25-04 — BTOR2 bounded-recourse canonical transition encoding

- Seed / engine: `S10` / Inversion; selected as a checker-backed formal perspective.
- Exact identity attempted: BTOR2 transition-system input consumed by the current Boolector/BTOR tool ecosystem.
- Primary snapshot: official Boolector repository page, accessed 2026-08-14; it presents Boolector as an SMT solver for bit-vectors/arrays and links its source/build material.
- Proposed same-object question: preserve the transition relation and bounded-model-checking answer while changing a versioned BTOR2 model through a bounded-recourse canonical encoding.
- Current union / strongest subtractor: generic solver and generic encoding/cache actions are the immediately available subtractors. This is insufficiently target-specific for the assignment and the actual current BTOR2 input-construction union was not source-closed.
- Natural/canonical carrier and oracle: a dated public BTOR2 benchmark/model release plus exact solver/checker acceptance would be required. Neither was frozen here.
- Full-cost denominator required if resumed: construction/update CPU, solver/checker CPU, bytes, peak RSS/temp, and any rewrite/recourse count.
- Minimum falsifier: a two-version BTOR2 model where the encoding changes transition semantics or the same bounded-recourse construction is expressible by the generic solver/encoding union.
- Disposition: `LOCATOR_ONLY__GENERIC_SUBTRACTOR_AND_CARRIER_UNFROZEN`.

## Funnel result

| Stage | Count | Notes |
|---|---:|---|
| Selected locators with Question Cards | 4 | S02, S03, S05, S10 only |
| `FRESH_RAW` | 0 | No card jointly closed identity, same-object action, carrier/oracle, and finite route |
| C0 / D1 / deep review | 0 / 0 / 0 | No promotion by score or quota |
| Grounded brief / `PROPOSE_STAGE0` | 0 / 0 | Legitimate zero-proposal batch |
