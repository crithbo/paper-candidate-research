# Stage 0 PRIMARY Review — LLVM-BITCODE-ABBREV-PLANNER

## Administrative record

- Assignment: `STAGE0-P1-20260809-LLVM-BITCODE-ABBREV-PLANNER-PRIMARY-V8.7`
- Mode: `PRIMARY`
- Review cutoff: `2026-08-09`
- Decision: `PASS_RECOMMENDED`
- Tier: `TIER_B_Q2_VIABLE`
- Confirmation: `PENDING_CONFIRMATION`
- Stage A/B authorized: `false / false`
- Confidence: `0.82`
- Search status: `SEARCH_BOUNDED_OPEN`
- Structural paper potential: `PASS_CONDITIONAL_ON_GLOBAL_ALGORITHMIC_RESIDUAL`
- Current evidence readiness: `FINITE_FIDELITY_GAP__PINNED_RECORD_TRACE_AND_CURRENT_WRITER_PARITY_REQUIRED`

## Canonical judgment

If successful, the frozen topic has a credible Q2 paper shape: a standard-format, file-local planner that jointly chooses legal LLVM bitcode abbreviation definitions, their scope, abbreviation-ID width, and record assignment while preserving the exact semantic record stream and native reader behavior. The research residual survives a bounded current-source and literature check only when the comparator includes LLVM's complete mixed native action family, not merely `writeBlockInfo`.

The recommendation is not a claim that the planner works or saves bytes. No candidate implementation, natural-corpus result, approximation theorem, or performance result was reviewed. These are Stage A readiness and falsification obligations, not Stage 0 structural STOP conditions.

## 1. Frozen exact object, function, information, and cost

### Input and immutable semantics

The object is one pinned LLVM `Module` and the ordinary native raw `.bc` file produced for it. Before abbreviation encoding, the evaluation harness must freeze a semantic bitstream trace consisting of block nesting and order, record codes, operand vectors, blobs, use-list order, module-hash setting, symbol/string-table content, and all other writer options that affect the decoded module.

The candidate may change only:

1. legal abbreviation grammars constructed from the frozen records;
2. whether a definition is placed in `BLOCKINFO` or an immediate block where LLVM permits it;
3. the abbreviation-ID/code width implied by the selected definitions; and
4. the assignment of each unchanged record to a legal abbreviation or `UNABBREV_RECORD`.

It may not reorder or change records, split or merge modules, change LLVM IR, omit metadata or use-list data, switch codecs, write a thin pack-like derivative, invoke external compression, or require a non-native reader.

### Function and guarantee

The function is:

`f(record_trace, legal_encoding_actions, cost_model) -> ordinary_native_bitcode`

The required guarantee is exact native decodability and semantic identity: the pinned LLVM reader accepts the file; `opt -passes=verify -disable-output` succeeds; baseline and candidate decode to the same canonical module; and an instrumented reader or writer confirms identical semantic block/record traces after abbreviation expansion. A textual `llvm-dis` comparison or `opt` verification alone is insufficient.

### Objective and full cost

The primary objective is raw ordinary bitcode bytes, including `BLOCKINFO`, every `DEFINE_ABBREV`, alignment, record encodings, and abbreviation-ID width. The full ledger also includes trace extraction, candidate-grammar generation, optimization CPU/wall time and peak RSS, writer CPU/wall/RSS, cold and warm reader parse/materialization CPU/wall/RSS, native verification, fallback rate, definition count, and every code-width transition. External-compressed size may be reported only as a secondary negative control, never as the primary claim.

## 2. Current-source reality check

The Discovery phrase “fixed template/ID family” is directionally useful but incomplete. In current `BitcodeWriter.cpp`, `ModuleBitcodeWriter::writeBlockInfo` installs a hard-coded ordered family for repeated constants, function, and value-symbol-table blocks, with asserted abbreviation IDs. However, the native writer also:

- emits block-local abbreviations outside `BLOCKINFO`;
- derives type-index width from the input module;
- selects Char6/fixed-7/fixed-8 encodings for eligible strings;
- chooses abbreviated or unabbreviated instruction records according to record shape and available fields;
- emits specialized metadata and summary abbreviations; and
- exposes writer-affecting options for metadata-index threshold, buffer flush threshold, combined-index memprof context, and use-list preservation.

The ordinary module path through `WriteBitcodeToFile`/`ModuleBitcodeWriter`, the separate `IndexBitcodeWriter`, and `ThinLinkBitcodeWriter` were inspected as distinct writer objects. The latter two are not the candidate's ordinary-module object. No file-global planner jointly selecting grammar, scope, assignment, and ID width was found in this bounded check. This is an absence boundary, not a firstness claim.

The source package names short snapshot `de8cb59`. An official LLVM project log established that snapshot at the cutoff, while the public main branch moved during review. The rendered current main source was used for the behavioral audit, but the immutable full commit and source-blob hashes remain a pre-claim archival obligation. A failed immutable fetch/TLS path supplies no scientific inference.

## 3. Strongest fair comparator set

The comparator is finite; an unconstrained union is prohibited.

### B0 — complete current native writer

Pinned `WriteBitcodeToFile` with all applicable fixed `BLOCKINFO` templates, block-local abbreviations, input-sensitive string/type/instruction choices, and relevant flags. This is the deployment anchor.

### B1 — current-grammar subset and assignment oracle

On the same frozen trace, optimize retain/drop and record assignment using only the complete native grammar family, charging definition and ID-width costs. This removes trivial wins from deleting unused definitions or choosing a native alternative more carefully. It may be exact for small inputs and certified/timeout-bounded for larger ones.

### B2 — greedy bounded-grammar planner

Use the same bounded legal candidate-grammar generator and information as the candidate, but repeatedly choose the best immediately positive net definition/scope/assignment action with the exact cost ledger. This is the deployable algorithmic baseline.

### B3 — small-instance exact ceiling

MILP/CP-SAT or exhaustive optimization on small traces is an offline oracle for optimality gaps and bugs, not a deployment baseline and not an automatic fatal union member.

`llvm-bcanalyzer` is an analyzer/oracle, not a constructor. BCDB, compression-friendly alternative LLVM encodings, Zstandard, and generic external compressors change the representation or storage pipeline and are subtractors/negative controls, not same-object comparators for raw native bitcode.

## 4. Structural N1/N2/N3 assessment

- `N1`: weak-to-moderate. The action space is latent in the documented bitstream format rather than a new format.
- `N2`: credible and primary. The paper kernel is a global cost-aware constructor coupling shared versus local definitions, per-record assignment, amortized definition cost, and stepwise abbreviation-ID width.
- `N3`: optional. Stable record-family regularities across natural LLVM modules could strengthen the work but are not required for admission.

For a fixed candidate set and code width, record savings have a coverage-like structure and definition costs are modular. Code-width thresholds and shared/block-local scope introduce discrete global coupling. A publishable mechanism should exploit this structure through a bounded-width dynamic program, approximation guarantee, certified branch-and-bound, or another named algorithm with a meaningful guarantee. Merely pruning unused templates, sweeping a threshold, patching the emitter, using an opaque generic solver, or applying a local byte heuristic would collapse the contribution below Q2.

The mechanism is not a wrapper if it consumes the native semantic record trace, constructs only legal native abbreviation actions, and emits through the existing writer/bitstream interface. A postprocessor that parses and rewrites completed files without a native trace/fidelity contract is outside the admitted mechanism.

## 5. Collision and subtractor result

No current first-party source, official flag, or bounded primary-source literature result was found that directly covers the exact combination of ordinary raw LLVM bitcode, native reader compatibility, file-local joint abbreviation-dictionary and record-assignment construction, explicit definition/ID-width/read-write cost, and a global algorithmic guarantee.

BCDB is the closest important subtractor. It splits/stores modules and deliberately byte-aligns fields to improve downstream database/external compression; its raw bitcode can grow while compressed storage shrinks. It therefore blocks generic claims about “better compression-oriented LLVM re-encoding,” but does not absorb the frozen raw-native objective. Alternative IR encodings likewise do not preserve the native ordinary-bitcode object. The official bitcode format explicitly permits dynamic per-client/file abbreviations and specifies scoping and sequential IDs; that establishes legality and prior design intent, not an implemented planner.

The novelty status remains `SEARCH_BOUNDED_OPEN`. Stage A must repeat the current-source check at its pinned full commit and search code history/issues before the first claim-bearing observation.

## 6. Natural evidence and 100-module killer

The finite natural corpus plan is structurally executable on CPU. Freeze 100 non-duplicate build-derived modules from public LLVM Test-Suite and MLGO-associated corpora, with repository commits, licenses, build commands, compiler flags, source hashes, module hashes, and the exact LLVM toolchain. Stratify at least by module size, optimization level, debug-information mode, and source language; exclude handcrafted bitcode and generated duplicate variants from the primary denominator.

Before the large run, one small hand-checkable witness must demonstrate:

1. baseline and candidate semantic record-trace identity;
2. exact accounting of definition bits and an abbreviation-ID width transition;
3. native read, canonical decoded-module equality, and `opt` verification; and
4. B1 and B2 parity on the shared action set.

The preregistered Stage A killer is finite:

- any semantic trace, native parse, verify, or canonical equality failure stops the frozen mechanism;
- if fewer than 10% of natural modules expose a legal candidate action beyond B1/B2, the global mechanism lacks natural headroom;
- if all candidate gains are reproduced by the current-grammar subset oracle or greedy comparator, the claimed N2 is absorbed;
- if no candidate point is non-dominated against B0–B2 on raw bytes plus planning/write/read/RSS at both median and tail summaries, stop;
- if gains depend on external compression, altered module content/order, omitted records, or a non-native reader, stop for object drift; and
- if candidate generation/optimization consumes the byte or time benefit under the declared full-cost envelope, stop or cap the claim to a non-deployment algorithmic study.

No positive outcome is asserted now. Tiny or heterogeneous modules, current templates already near-optimal, definition overhead, and abbreviation-ID width jumps are expected negative controls.

## 7. Q1/Q2 shape and claim ceiling

The present shape is `TIER_B_Q2_VIABLE`: exact object, a bounded nontrivial N2, public CPU artifacts, strong finite baselines, and a decisive same-object killer are all definable. Q1 potential is not yet established. It would require a clear formal or approximation contribution, stable cross-corpus results across multiple frontends/build modes, thorough native-writer ablation, and upstream-quality integration without reader regressions.

Current claim ceiling:

> A conditional standard-format LLVM bitcode abbreviation planning algorithm with exact native fidelity and full-cost evaluation.

Not currently supportable: firstness, optimal compression, universal compiler benefit, reader speedup, upstream readiness, or superiority under external compression.

## 8. Scores and AI core fraction

### Academic potential (53/70)

- Importance and relevance: 7/10
- Exact-object clarity: 9/10
- Novelty after subtractors: 8/15
- Algorithmic/theoretical contribution potential: 12/15
- Evaluation design: 8/10
- Reproducibility path: 9/10

### AI executability (26/30)

- Public CPU-accessible object and tooling: 9/10
- Core algorithm/harness work AI-addressable: 9/10
- Finite debugging and validation path: 8/10

Total: `79/100`. Estimated AI core fraction: `0.82`. This score ranks execution; it is not the scientific gate.

## 9. Risks and required fidelity closure

The highest risk is not lack of code; it is comparator drift. A weak comparison to `writeBlockInfo` alone would manufacture headroom already available through native inline and input-sensitive choices. Before any claim-bearing run, the candidate owner must archive the full immutable LLVM snapshot, enumerate the actual native grammar/action family on the same trace, implement B1 parity, and prove trace-level/native fidelity on the small witness.

Other risks are small absolute raw-byte headroom, solver overhead, read-time regressions from less decoder-friendly grammars, and a contribution that reduces to ordinary dictionary selection. These are all falsifiable under the proposed plan.

## 10. Decision

`PASS_RECOMMENDED / TIER_B_Q2_VIABLE / PENDING_CONFIRMATION`.

This does not authorize Stage A or Stage B. The long-lived confirmation sentry should independently test the corrected current-writer baseline boundary, BCDB classification, and whether the named N2 remains more than emitter engineering.
