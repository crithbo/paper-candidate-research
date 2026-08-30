# LLVM-BITCODE-ABBREV-PLANNER — Costed native abbreviation planning for LLVM bitcode

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Structural paper potential: `TIER_B_Q2_VIABLE` conditional on a nontrivial natural-corpus Pareto residual; a Q1 outcome requires a broadly stable result and an algorithmic/approximation guarantee.
- Current evidence readiness: `MEDIUM__PRECLAIM_SOURCE_AND_ARTIFACT_ROUTE_ONLY`; no implementation or performance result is claimed.
- Opportunity origin: `O7`
- Contribution route: `N2` (with optional `N1` representation/action interface analysis)
- Frozen cutoff: `2026-08-09`

## Research question

Can a file-local, exact-cost abbreviation dictionary-and-assignment constructor make native LLVM bitcode smaller at equal decoded LLVM IR and current-reader acceptance, while accounting for definition overhead, abbreviation-ID growth, write time, and read time?

## Exact object and contract

The exact object is one current LLVM IR `Module` serialized as ordinary LLVM bitcode, not a database record, archive member, compressed wrapper, alternative IR, or changed module. The contract is: the native LLVM bitcode reader accepts the result and reconstructs the same LLVM IR module under the current `llvm-dis`/reader semantics; `opt -verify` succeeds. The official format makes abbreviation definitions self-describing and explicitly requires readers not to depend on a particular writer abbreviation set: <https://llvm.org/docs/BitCodeFormat.html>.

## Paper genealogy and collision position

- Current anchor/deployment source: LLVM Bitcode Format and upstream `llvm/lib/Bitcode/Writer/BitcodeWriter.cpp`.
- Closest direct subtractor: Bartell's 2021 BCDB byte-aligning bitstream rewrite for external compression: <https://publish.illinois.edu/allvm-project/files/2022/01/bartell-dissertation-2021.pdf>.
- Key predecessor/adjacent encoding exploration: Lindfors 2014: <https://aaltodoc.aalto.fi/items/7ebe69a7-7968-4c11-8b87-b6db30db614a>.
- Historical counter-evidence: 2013 upstream proposal for a smaller encoding: <https://groups.google.com/g/llvm-dev/c/2eNOU1MVCuY>. It does not establish what current LLVM implements.
- Natural artifacts: official LLVM Test-Suite and MLGO corpus utilities: <https://llvm.org/docs/TestSuiteGuide.html>, <https://llvm.org/docs/MLGO.html>.
- Search classification: `DIRECT_SUBTRACT` for BCDB; `METHODOLOGICAL_ADJACENT` for alternative encodings; `SEARCH_BOUNDED_OPEN` only for a direct published native abbreviation-set/assignment optimizer.

## Strongest fair union and residual

The comparator union is current `llvm-as` / `WriteBitcodeToFile`, including `writeBlockInfo()`'s source-coded abbreviations, inline abbreviations, dynamic type-index width, and all exposed relevant writer controls: `preserve-bc-uselistorder`, `bitcode-mdindex-threshold`, `bitcode-flush-threshold`, and `combined-index-memprof-context`. The current source checks fixed expected abbreviation IDs after each hand-built template; source location and option defaults are in the matrix.

The residual action is a complete offline constructor: enumerate legal candidate abbreviation grammars from a module's record stream; compute their definition cost and use cost; solve a budgeted dictionary selection plus record assignment with abbreviation-ID-width feedback; emit the selected legal `BLOCKINFO`/inline definitions and records. This is one joint combinatorial optimization, not adjacent swaps, sampling, a controller, or tuning an existing threshold. `N1` is the explicit costed action interface; `N2` is the planner/approximation with a bounded candidate grammar.

## Competing mechanisms

- **A — fixed expert templates (current union):** negligible planning cost and stable reader behavior; predicts wins on small or heterogeneous modules where definition amortization fails.
- **B — costed file-local planner (candidate):** pays definition and planning cost only where repeated record shapes repay it; predicts a size/read-time Pareto residual on repeated natural IR patterns.
- **C — byte-align then externally compress (BCDB):** changes the full cost and pipeline; it is a mandatory subtractor, not a fair native-reader replacement.

## Same-function, cost, and no-gain region

- Same function/quality: decoded module and verifier result, not textual byte identity.
- Full-cost denominator: output bytes; writer CPU/wall time and peak RSS; reader CPU/wall time and peak RSS; `llvm-bcanalyzer` structural validation; all required native decode/verify passes. External compressor/database time and storage are excluded rather than silently omitted.
- Natural corpus: LLVM Test-Suite modules plus MLGO-generated corpus modules preserving their recorded compile commands.
- Expected no-gain region: tiny modules, low repetition, modules whose current fixed template is already optimal, and modules for which added definitions/ID-width inflation erase savings.
- Why not routine tuning: it emits a new legal dictionary and assignment over the whole abbreviation interface; no current option requests that action.

## Current upstream reality check

- Checked upstream/date: LLVM upstream main snapshot `de8cb59` (official Google mirror current-main listing, observed 2026-08-09); actual source inspected at upstream GitHub path <https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/Bitcode/Writer/BitcodeWriter.cpp>.
- Official current docs: <https://llvm.org/docs/BitCodeFormat.html> and <https://llvm.org/docs/CommandGuide/llvm-bcanalyzer.html>.
- Source facts: `ModuleBitcodeWriter::writeBlockInfo()` (observed lines 3764–4041) creates templates and asserts their ID order; `ModuleBitcodeWriter::write()` invokes it. This supports only the limited claim that the observed writer is hand-template based, not an absolute claim that no other upstream tool exists.
- Flags/configurations inspected: hidden defaults `bitcode-mdindex-threshold=25`, `bitcode-flush-threshold=512`, `preserve-bc-uselistorder=true`, build-dependent `combined-index-memprof-context`; their documented/source purpose is metadata index, flushing, use-list preservation, and memprof context, respectively—not general abbreviation-dictionary selection.
- Contrary evidence: the format itself permits dynamic per-file abbreviations, and BCDB rewrites bit layout for external compression. Both are incorporated: the first makes the candidate legal; the second is the closest subtractor.

## Fidelity closure plan

- Status: `READY_TO_CLOSE_IN_STAGEA`
- Native semantic boundary: standard current LLVM reader and verifier, no modified reader or decoder.
- Finite pre-corpus witness: one checked-in LLVM `.ll` module; emit baseline and planned `.bc`; require `llvm-dis` parse, `opt -verify`, normalized reassembly/reparse equivalence, and `llvm-bcanalyzer` structural decode for both.
- Finite Stage A killer: on a fixed public 100-module stratified LLVM Test-Suite/MLGO sample, stop if any planned file fails native parse/verification, or if the all-module byte median is not strictly smaller than the strongest union after including planner time and the read-time non-regression bound fixed before execution. This does not assert an outcome.
- Resource route: public LLVM source/tools and public CPU corpus only. AI can implement the planner and harness, but a compiler maintainer must review any upstream-compatibility claim.

## Seed distance and paper shape

BCDB changes bit alignment for a compressor/database pipeline. This candidate holds raw native bitcode and reader semantics fixed, changes the decision variable to self-described abbreviation grammar plus globally costed record assignment, and charges definition/reader cost. Deleting names such as LLVM/bitcode leaves a clear problem: construct a minimum-cost self-describing dictionary and encoding assignment accepted by an unchanged decoder.

At Q2 shape, a paper needs the planner, a proof/derivation for its cost model or approximation behavior, native semantic closure, fair BCDB/current-writer/naive legal-dictionary comparisons, and heterogeneous natural corpora. Three explicit near-Q1 calibration papers/venues are: LLVM's original representation-and-size evaluation at CGO 2004 (<https://llvm.org/pubs/2004-01-30-CGO-LLVM.html>), BOLT at CGO 2019 (<https://arxiv.org/abs/1807.06735>), and *Register Allocation for Compressed ISAs in LLVM* at CC 2023 (<https://pp.ipd.kit.edu/uploads/publikationen/fried23cc.pdf>). They calibrate the expected complete compiler-algorithm shape (native semantics, construction algorithm, full cost, natural programs), not this candidate's novelty and not a license to compare across objects. Stage 0 must still complete the direct-collision update.

## Non-relaxable audit

- Same object: frozen LLVM module → ordinary native LLVM bitcode.
- Fair baseline: current source-coded writer union plus BCDB subtractor, without invalid external-pipeline substitution.
- Latest collision: current source/docs inspected; published search remains bounded open, not novelty proof.
- Reproducibility: public upstream source, Test-Suite/MLGO corpus tooling, CPU-only finite killer.
- Claim ceiling: no performance, compression ratio, compatibility across all LLVM versions, or novelty conclusion is claimed at Discovery.
