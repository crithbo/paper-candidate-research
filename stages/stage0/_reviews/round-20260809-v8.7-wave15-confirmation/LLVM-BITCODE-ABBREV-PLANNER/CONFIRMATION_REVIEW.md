# LLVM-BITCODE-ABBREV-PLANNER — Independent Stage 0 Confirmation

- Assignment: `STAGE0-C1-20260809-LLVM-BITCODE-ABBREV-PLANNER-CONFIRM-V8.7`
- Role: `STAGE0_CONFIRMATION_SENTRY`
- Cutoff: 2026-08-09
- Protocol disposition: **CONFIRM**
- Scientific disposition: **CONFIRM_STAGE0_PASS**
- Quality tier: **TIER_B_Q2_VIABLE**
- Readiness: `FINITE_FIDELITY_GAP__PINNED_RECORD_TRACE_AND_CURRENT_WRITER_PARITY_REQUIRED`
- Confidence: **0.84**
- Stage A/B authorized: **false / false**

## 1. Bottom line

The PRIMARY decision is confirmed, but with two boundary corrections.

First, current LLVM is not a fixed-template writer. The complete current-source baseline includes fixed `BLOCKINFO` definitions, block-local definitions, dynamic abbreviation-ID width, record-shape/type/string-dependent choices, `UNABBREV_RECORD` fallbacks, and every relevant default/non-default writer option. Options that change the semantic block-record trace are not candidate actions and must be frozen identically within a comparison stratum; they cannot be mixed into a metric-wise “best of all traces” union.

Second, BCDB should not be described simply as an object-different external compressor. Its rewrite remains LLVM-decodable bitcode, so it overlaps the native format/reader facet and is a direct subtractor and negative control for generic “LLVM bitcode re-encoding/compression” claims. Its published primary objective and cost pipeline, however, are compression-friendly database/external-compression storage, and the transform deliberately increases uncompressed bitcode size. It therefore does not replace B0–B2 for the frozen raw-native-byte objective unless the candidate later changes its claim to externally compressed storage.

After those corrections, the search-bounded residual is non-empty only as a named global constructor or formal algorithm that jointly chooses legal abbreviation grammar, definition scope/order, record assignment, and the stepwise abbreviation-ID/code-width consequences. A schema patch, flag sweep, unused-template deletion, local byte heuristic, opaque solver, or postprocessor does not meet N2.

No direct same-object current work was found that already performs this joint planning problem. This is a conditional structural-potential PASS, not evidence that the algorithm, natural headroom, or performance result exists.

## 2. Frozen input integrity

All source and PRIMARY files match the hashes registered in the frozen handoffs.

| Package | File | SHA-256 | Status |
|---|---|---:|---|
| Discovery | `LLVM-BITCODE-ABBREV-PLANNER.md` | `A8F04AD9E52E3AFFED974BD16355EEA7950435C2D112D4C19725477954BF0A23` | verified |
| Discovery | `DISCOVERY_LOG.md` | `64C3F496E7E4FFB315A4A87F6A58E676709FF17AD0DA6AC2F684E5C89A942F67` | verified |
| Discovery | `SOURCE_COLLISION_ACTION_MATRIX.md` | `AA4AA20D25687A53B6737BECAE834EE9F9C7E7D60F91BC351106D7D7E0E1D6E8` | verified |
| Discovery | `handoff.yaml` | `65E72461DA07E1513BA0DF763AF28048D7502E13490B48ACBFE42C5DBC6A4097` | verified |
| Discovery | `HASH_MANIFEST.sha256` | `F6F248E2A6D7FF6F1D4CAFBCF43AA943A755842F911935E0050DAAA6BA0B145F` | self verified |
| PRIMARY | `STAGE0_REPORT.md` | `EB5793517AF8FFE9CA7CFA7E6EC7DADE046153E2898F446052541A53A8C61774` | verified |
| PRIMARY | `Q1_COMPARATOR_MATRIX.md` | `6D6A5BA42E8204F6B7485588AEE1CAC1474F7FAB3A58278E31083C9F50955A26` | verified |
| PRIMARY | `SOURCE_AUDIT.md` | `5BD588BBC875601D9B6BA274EA4BE8ED119DCD4C04288207464365B47EDA65B2` | verified |
| PRIMARY | `handoff.yaml` | `CAB57259CDB8AE6993F5FB78694C07A42CF5DB188D926818F2F554604C5505F3` | verified |
| PRIMARY | `HASH_MANIFEST.sha256` | `C4ADD3490038378F574A8496C90D4DA2A8F9053D58E4807E1069FFAE08E07A05` | self verified; 4/4 |

No provenance or ownership conflict was found.

## 3. Exact object and fidelity contract

The same object is:

> A pinned LLVM `Module` and its frozen expanded semantic block-record trace, encoded as one ordinary raw native LLVM bitcode file, accepted by the pinned unmodified native reader, yielding canonical decoded IR equality and passing native verification.

Permitted actions are limited to format-legal abbreviation grammar construction, legal `BLOCKINFO` versus immediate-block definition scope/order, induced abbreviation identifiers and code widths, and assignment of an unchanged record to a legal abbreviation or `UNABBREV_RECORD`.

The following are object drift: changing IR; changing the expanded semantic record values or order; deleting, splitting, or merging records; module splitting/merging; alternative codecs; external compression as the primary measured object; or a non-native reader.

### Writer-option normalization

The current writer exposes options and build-dependent paths that can affect emitted records, ordering, auxiliary blocks, or representation. Every relevant default and non-default option must be enumerated in the action audit. But a trace-changing option is a frozen stratum variable, not an abbreviation-planning action. B0, B1, B2, and the candidate must receive the same pinned module, semantic trace, and option setting within each comparison. This preserves same-information fairness while still preventing omission of current native behavior.

## 4. Independent current-source and format audit

The official [LLVM Bitcode Format](https://llvm.org/docs/BitCodeFormat.html) confirms that abbreviations are self-describing, may be block-local or installed through `BLOCKINFO`, receive sequential IDs beginning after the reserved codes, incur definition cost, and affect the current block's abbreviation-ID width.

The current upstream [`BitcodeWriter.cpp`](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Bitcode/Writer/BitcodeWriter.cpp) and [`BitstreamWriter.h`](https://github.com/llvm/llvm-project/blob/main/llvm/include/llvm/Bitstream/BitstreamWriter.h) show a richer native action family than “fixed templates”:

- fixed `BLOCKINFO` abbreviations and immediate-block abbreviations;
- explicit entry code length and sequential abbreviation IDs;
- type-, operand-, instruction-, and record-shape-dependent abbreviation selection;
- string choices including fixed/array/blob-style and character-class-sensitive encodings;
- abbreviated versus unabbreviated record emission;
- hidden/default writer options and build-dependent auxiliary behavior.

LLVM review [D150371](https://reviews.llvm.org/D150371) is an important current-source subtractor: it adds a schema-based abbreviation for `TargetExtType` to amortize redundant fields. It demonstrates that a one-record schema patch or emitter-local abbreviation is already ordinary upstream engineering and cannot be counted as the candidate's N2.

The bounded audit of the current writer, official format/tool documentation, upstream reviews, and exact-object searches found no current native facility that jointly constructs abbreviation grammars, chooses shared/local definition scope, assigns records, and optimizes definition amortization together with abbreviation-ID/code-width steps. This is an absence statement only within the recorded search boundary, hence `SEARCH_BOUNDED_OPEN`.

`llvm-bcanalyzer` and related native inspection facilities are analysis/accounting oracles, not constructors. They belong in the reproducibility and exact-accounting route, not as N2 baselines.

## 5. BCDB boundary correction

The BCDB dissertation describes rewriting LLVM-produced bitstreams so fields align to byte boundaries while remaining decodable by LLVM; the resulting stream is larger uncompressed but improves the downstream compression/database objective. Therefore:

- classification: `DIRECT_SUBTRACTOR / SAME_NATIVE_FORMAT_AND_READER_NEGATIVE_CONTROL__DIFFERENT_PRIMARY_OBJECTIVE_AND_PIPELINE`;
- it directly subtracts generic claims of first LLVM-compatible re-encoding or first compression-oriented bitstream transformation;
- it must be reported as a negative control where relevant;
- it is not the strongest baseline for the frozen objective of minimizing ordinary raw native `.bc` under abbreviation-only actions and full native reader/writer costs;
- if the candidate later counts external compression or changes the storage pipeline, BCDB becomes a direct fair baseline and the object must be re-reviewed.

Source: Nicholas Bartell, [*Improving Compression and Interoperability of LLVM Bitcode* / BCDB dissertation context](https://publish.illinois.edu/allvm-project/files/2022/01/bartell-dissertation-2021.pdf).

## 6. Claim and collision matrix

| Candidate claim or component | Strongest current comparator | Collision class | Confirmation ruling |
|---|---|---|---|
| Legal abbreviation definitions and use | LLVM format + complete current writer | direct absorption | Not novel. Included in B0. |
| Fixed `BLOCKINFO`, local abbreviations, dynamic ID width | `BitstreamWriter` and current `BitcodeWriter` | direct absorption | Not novel. Included in B0/B1. |
| Schema-specific abbreviation/emitter patch | LLVM D150371 and current schema choices | direct/methodological absorption | Insufficient for N2. |
| Delete unused definitions or sweep flags/thresholds | current writer family + subset oracle | methodological/product collision | Insufficient for N2. |
| Choose among a preregistered current grammar for each record | B1 current-grammar assignment oracle | direct baseline absorption | Candidate must strictly exceed B1 action space or guarantee. |
| Greedy candidate grammar/definition/assignment planning | B2 greedy full bounded planner | methodological absorption | A greedy/local byte heuristic is not residual. |
| Exact optimization on small traces | B3 small-instance exact ceiling | ceiling, not scalable baseline | Useful only to quantify headroom/approximation gap. |
| Generic LLVM-compatible re-encoding for downstream compression | BCDB | direct subtractor / deployment-objective collision | Cannot be claimed; raw abbreviation-only objective remains distinct. |
| Joint global grammar + scope/order + assignment + ID-width-step planner | no same-object current constructor found | search-bounded residual | Conditional N2 only with named algorithm/formal property and fidelity proof. |

No `DIRECT_FATAL` collision was found for the narrowed residual. The result is not a priority or “first” claim beyond the bounded source audit.

## 7. N2 non-product gate

The only confirmed residual is:

`GLOBAL_COSTED_NATIVE_ABBREVIATION_GRAMMAR_SCOPE_ASSIGNMENT_PLANNER__SEARCH_BOUNDED_OPEN`

To remain claim-bearing, a future mechanism must expose a named algorithm or formal guarantee that jointly reasons about:

1. construction of candidate grammars within a frozen bounded legal grammar class;
2. shared `BLOCKINFO` versus local definition scope and definition order;
3. record coverage, legal assignment, and fallback to `UNABBREV_RECORD`;
4. exact definition amortization and stepwise abbreviation-ID/code-width cost;
5. explicit planning, write, read, memory, and output-byte costs.

The following do not satisfy N2: unused-template deletion; one-schema patches; flag/threshold grids; a local marginal-byte heuristic; an emitter-only patch; a postprocessor without expanded-trace proof; or an opaque generic solver with no structural formulation, algorithmic result, or guarantee.

## 8. Finite fair baselines

- **B0 — Complete current native writer:** pinned LLVM commit, full relevant source/action audit, and matched trace-affecting options.
- **B1 — Current-grammar subset/assignment oracle:** best legal subset/scope/use assignment over the complete current native grammar family under the same frozen trace and accounting model.
- **B2 — Greedy full bounded grammar planner:** same bounded grammar generator and selection budget as the candidate, with greedy marginal net-bit choice and legal assignment, charging definitions and ID-width transitions.
- **B3 — Exact small-instance ceiling only:** exhaustive or exact optimization on preregistered small traces; a ceiling/diagnostic, not a universal scalable baseline.

Comparisons are executable points, not a synthetic union taking the best metric from different option settings. Candidate and B1/B2 must share the same candidate grammar bounds and resource budget where applicable.

## 9. Stage A preclaim route (not authorized)

A finite CPU/open-source route exists, so lack of an implementation or current positive result is readiness risk rather than a Stage 0 STOP reason. If mainline later authorizes Stage A, the preclaim gate should freeze:

- an immutable LLVM commit and hashes for all relevant writer, bitstream, reader, analyzer, and verifier source blobs;
- the expanded semantic block-record trace and all matched writer options for every arm;
- complete current-native action enumeration and B1 parity;
- native parse, canonical decoded-module equality, and `opt -passes=verify -disable-output`;
- exact bit accounting for `DEFINE_ABBREV`, `BLOCKINFO`, alignment, payload, fallback, and every abbreviation-ID-width transition;
- a small diagnostic witness that crosses at least one ID-width step;
- 100 preregistered natural public modules with commits, licenses, build commands, module hashes, and workload strata.

The finite killer asks whether at least 10% of natural modules expose a legal retained action outside B1/B2 and whether any candidate point is non-dominated against B0–B2 on raw bytes plus planning/write/read CPU, wall time, RSS, and median/tail behavior. Any semantic-trace, native-parse, canonical-equality, or verifier failure kills the claim. If all actions or gains are reproduced by B1/B2, or full cost erases the point, the structural residual closes.

A positive Stage A observation would only mean that the highest-risk premise was not falsified and received preliminary support. It would not establish the main algorithmic or paper claim; that belongs to later research execution and Stage B evidence closure.

## 10. Structural potential versus readiness

### Structural paper potential

**TIER_B_Q2_VIABLE, conditional.** If the named joint planner and its formal/algorithmic property exist, preserve the exact native object, strictly exceed B1/B2 in action or guarantee, and retain a full-cost non-dominated point on natural modules, the contribution has a coherent systems/format-optimization paper shape: N1 is exact native-format semantics and cost modeling; N2 is the global constructor; N3 is reproducible same-object/full-cost evaluation.

### Current evidence readiness

**Low but finite.** No planner, equality artifact, natural headroom result, or performance result is presently established. Those are future evidence tasks, not Stage 0 scientific failures. The largest risks are current-writer action parity, disappearance of residual headroom under B1/B2, and the possibility that a proposed method collapses to local emitter engineering.

## 11. Search and claim ceiling

The current-source/latest-collision result is `SEARCH_BOUNDED_OPEN`, not exhaustive novelty proof. The bounded sources covered official LLVM format/tool documentation, current upstream writer/bitstream source, relevant upstream schema-abbreviation changes, exact-object planner searches, and BCDB's primary artifact description. A remote Git commit resolution attempt failed with a local credential-provider error; no scientific inference is drawn from that resource failure, and immutable commit pinning remains mandatory before any Stage A work.

Permitted claim now:

> A conditional, search-bounded Tier B residual may exist for a global costed planner over legal native LLVM bitcode abbreviation grammar, scope/order, record assignment, and abbreviation-ID-width steps, under frozen expanded-record equality and complete current-writer/B1/B2 baselines.

Prohibited claims now include: first LLVM bitcode abbreviation optimization; fixed-template current writer; first LLVM-compatible re-encoding/compression; demonstrated natural headroom; demonstrated size/performance gains; an established global algorithm; Tier A potential; or Stage A/B authorization.

## 12. Final confirmation

- Decision: `CONFIRM_STAGE0_PASS`
- Tier: `TIER_B_Q2_VIABLE`
- Protocol: `CONFIRM`
- Direct same-object fatal collision: `false`
- Revision required: `false`
- Structural residual: `GLOBAL_COSTED_NATIVE_ABBREVIATION_GRAMMAR_SCOPE_ASSIGNMENT_PLANNER__SEARCH_BOUNDED_OPEN`
- Readiness: `FINITE_FIDELITY_GAP__PINNED_RECORD_TRACE_AND_CURRENT_WRITER_PARITY_REQUIRED`
- Stage A authorized: `false`
- Stage B authorized: `false`
- Experiments/implementation authorized: `false`
- Master files modified: `false`
- Lane return: `IDLE_REUSABLE_AWAITING_MAINLINE`
