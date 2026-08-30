# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION Stage A Report

- Lane id: `CANDIDATE-EXECUTION-LANE-1`
- Assignment id: `STAGEA-L1-20260811-ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION-INITIAL-V8.7`
- Input freeze SHA-256: `C6F9024A0906AD0E7768E17E5B7463B2F57B792BF1865DDDDFF2679CC49C4148`
- Cross-assignment contamination declaration: `false`
- Decision: `REVISE_ONCE`
- Quality tier: `TIER_B_Q2_VIABLE` only as unresolved conditional paper potential; no Stage A PASS
- Evidence ceiling: `IMPLEMENTATION_FIDELITY_FAILURE__NO_NATURAL_SUPPORT_OR_STOP_INFERENCE`
- Novelty route: `N2`
- Stage semantics: a bounded real risk pilot; it neither establishes nor rejects the paper's main claim.

## Outcome

The native Arrow catalog, tiny exact oracle, stock-reader witness, and measured
preclaim implementation passed. The first natural run then exposed an omitted
deterministic-tie obligation in RP-FDP component pruning. Eleven frozen January
NYC windows completed; the twelfth failed before serialization because RP-FDP
and the explicit product oracle retained different equal-cost intermediate
backpointers. The cost frontiers, final static optimum, and final selected plan
on that failing window agree. This is an implementation-fidelity failure: the
partial natural observations support neither PASS nor a scientific STOP.

No candidate correction, later window, February/Adult carrier, replay2, or Stage
B work was run after the failure. A separately frozen Stage A `REVISE_ONCE` is
recommended.

## Pre-claim contract fidelity gate

- Gate status at launch: `PASS`; final assignment status: `FAIL_CLOSED` after a
  natural adversary falsified the claimed all-boundary backpointer fidelity.
- Frozen atomic actions mapped to implementation paths: every row-boundary cut;
  complete reduced injective ordered physical dictionaries; validity-null and
  physical-null realizations; INITIAL, NO_EVENT, both DELTA arms, REPLACEMENT;
  stock `pyarrow` 25.0.0 writer/reader. See `scripts/preclaim.py`.
- Comparator audit: exact Cartesian-product DP; RP-FDP; independent complete
  local-frontier cut-pool plus exact restricted product reoptimization; current
  writer/cut/dictionary grid; matched delta true/false arms.
- Native parity: the PyArrow/C++ wheel is 25.0.0. Its five decisive IPC source
  blobs are byte-identical to the Stage0-pinned Arrow commit
  `42694575d0219f6a3a78b1f344bb071a60df6a4e`.
- Metric parity: whole IPC stream bytes include schema, messages, bodies and
  padding; reader equality concatenates ordered logical rows and retains nulls
  and schema; planner/construction/writer/reader/validation costs are separated.
- Full-cost paths: wall/CPU, peak RSS, deep temporary bytes, process I/O,
  planning transitions/labels/dominance/backpointers, first-batch and total
  decode latency, stream bytes, failures and fallback.
- Small witness: both delta arms produce the exact stock-reader-accepted
  `1576/1568/1576 B` crossing (`5u/4u/5u`, `u=8 B`) with identical schema and
  concatenated ordered-value/null digests.
- Retained controls: failed digest-denominator attempt 1 and corrected attempts
  2/3 are immutable. Attempt 3 result SHA-256 is
  `ED4496744DA33846D45651A7B5BCC0BCD1EE0B45318FE7B389DAE056562BAD45`.
- Claim-bearing run started only after mechanical PASS: `true`.

The preclaim adversaries covered same-Q, event branches, predecessor dictionary
order, and cross-field shared cuts, but did not include two equal-cost components
whose statewise lexicographic backpointer preferences differ. The later natural
failure therefore invalidates the completeness of that preclaim certificate.

## Frozen contract

`EXPERIMENT_CONTRACT.yaml` (SHA-256
`EF1286412421F8AEE3E5FE6C0322DA1FE268D829B3B0C32CCD4D932F83E6A37C`)
freezes two 2025 NYC TLC months plus UCI Adult, 40 deterministic 16-row
windows, all 15 candidate boundaries, the complete reduced dictionary catalog,
both delta arms, an exact product feasibility cap, rank/product killers, five
matched repetitions with one warmup, and six-dimensional p50/p90 Pareto tests.

Natural inputs were hashed before decode:

| Carrier asset | Bytes | SHA-256 |
|---|---:|---|
| NYC TLC Yellow 2025-01 | 59,158,238 | `9AF277E4C0D3F9DEB30644DA822981E1E7DF6AF58313170FD3AA8A474485488A` |
| NYC TLC Yellow 2025-02 | 60,343,086 | `037CBA555A73663F3A51A2C27816E40E3FEB364769942BDF122B9DA31E377BD3` |
| UCI Adult archive | 620,237 | `7537312DD56C2B98035880805CE99E68183A30EE468AA5329D6DF0FBB3CC21BB` |

## Headroom and algorithmic gap

Stage0's static opportunity remains an output-sensitive exact representation:
`O(N^2 L^2 R sum d_f^2)` versus explicit product materialization. Stage A has
not validated that guarantee end to end because the dominance-pruning
implementation did not preserve the exact deterministic backpointer at every
state. The defect does not change the observed cost frontier on the failing
window, but correcting it can increase surviving rank `R`; therefore natural
rank/headroom must be rerun rather than inferred.

## Minimal mechanism and strongest baselines

- Candidate: reset-prefix factorized min-plus DP (`RP-FDP`) with native
  equality/prefix/replacement masks and an exact separable lower envelope.
- Current native/local union: fixed chunks and natural value-change cuts with
  minimal, cumulative, and stable dictionaries under both delta settings.
- Independent-field union: complete local frontiers, pooled cuts, and exact
  joint reoptimization restricted to that pool.
- Exact Cartesian-product DP: same action family and information, used as the
  finite oracle/ceiling rather than a deployable superiority target.

All completed streams use the same logical rows/schema and unmodified stock
writer/reader. No emitter patch or postprocessor is part of the candidate.

## Natural workload and mechanism-specific prediction

The prediction was that many product dictionary tuples would collapse into a
small separable envelope while a compromise cut unavailable to independent
local frontiers would survive full-cost comparison. The frozen useful threshold
was rank ratio at most 0.75 on at least 10/40 windows, strict compression on at
least 20/40, plus full-cost non-dominated residual on at least 10/40 including
2/8 Adult windows. Because execution stopped at 11/40, none of those aggregate
predictions was evaluated.

## Highest-risk probe result

- Risk-bearing premise: RP-FDP exactly reproduces product costs and
  deterministic backpointers at every boundary/state before natural benefit is
  interpreted.
- Scope executed: 11 complete January windows and the planning phase of frozen
  January window 11 (zero-based), delta-false first failure.
- Exact failure: at offset `2548487`, boundaries `10,13,14,15,16` have equal
  Pareto cost frontiers but different intermediate signatures. First example:
  product `[0,4,10]`, RP-FDP `[0,9,10]`, both cost `(123,41,3)` for the same
  dictionary tuple. Final static cost and final signature are equal.
- Diagnostic SHA-256:
  `88FF37EF0BCF32CCFBD0666D77F9361D6B33C95A567D721579BAF24B1E9556C6`.
- Negative-result meaning: current implementation is not contract faithful; the
  natural threshold cannot be interpreted.
- Positive-result ceiling: none. The 1/11 provisional residual is invalid for
  support and is retained only as an execution record.

## Directional increment

No valid directional performance claim is made. Across the 11 completed
windows, all eight arms were native-equivalent and deterministic, and all had
the same 10,376-byte aggregate stream total. RP-FDP's aggregate p50 planning
wall was about 1.001 s (delta false) and 1.007 s (delta true), versus about
0.141--0.142 s for the current grid and 0.307--0.308 s for the independent
baseline. These incomplete values are descriptive only; carrier preparation
was fully charged and dominated end-to-end wall time.

## Current critical-cost analysis

The partial ledger includes stream bytes, p50/p90 end-to-end wall, peak RSS,
temporary bytes, first-batch and total decode, planning CPU/wall/I/O, writer,
construction, validation, fallback, and deterministic hashes. `RESULTS.md` and
`artifacts/natural_primary/PARTIAL_SUMMARY.json` contain exact sums. No 40-window
median, p90 claim, product killer, or Pareto success is reported.

## Required scientific revision

The revision must remain same-object and change only exact pruning fidelity:

1. Component dominance may use strict cost dominance, or equal cost only when
   the dominating label's deterministic signature is no larger for that exact
   state; equality of costs alone is insufficient.
2. Cost-only component deduplication must be replaced by a projection including
   `(cost, signature)` for every state, or preserve all signature tradeoffs.
3. Add the observed equal-cost cut adversary to preclaim and require exact
   boundary/state backpointers under both delta arms.
4. Rerun the full preclaim and the unchanged 40-window primary plus independent
   replay from a new `revision1` directory. Recompute `R`; do not reuse partial
   benefit values.

This change was not made or executed here, so the Stage A scientific revision is
`not consumed` by this assignment.

## AI execution ledger

- AI executability class: `PUBLIC_CPU_REPRODUCIBLE_BUT_REVISION_REQUIRED`
- Measured AI core fraction: `1.0` for this bounded implementation/probe package.
- Reproducible artifacts: pinned sources/wheels, input hashes, scripts, complete
  preclaim trees, 11 window ledgers/streams, diagnostic and partial summary.
- Human-only items: mainline authorization/freeze of the one Stage A revision;
  later Stage B approval remains a separate user decision.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_NOT_PLAUSIBLE` at this checkpoint.
- Evidence already comparable: same-object native catalog, strong union design,
  stock-reader witness, deterministic artifacts, and complete cost schema.
- Executable gap: correct backpointer-aware pruning, rerun exact fidelity,
  complete 40 natural windows/replay2, then assess rank and full-cost residual.
- Human/resource-dependent gap: none for the bounded revision; Stage B still
  requires independent gate and explicit user approval.

## Non-relaxable quality audit

- Same-object: closed for all completed streams.
- Latest collision/current upstream: source-pinned native actions closed; broader
  literature remains `SEARCH_BOUNDED_OPEN` from Stage0.
- Strong fair baselines: implemented, but aggregate comparison incomplete.
- Natural input/evidence: real hashed inputs acquired; evidence invalidated at
  11/40 by fidelity failure.
- Full-cost: schema implemented and 11-window ledgers retained; aggregate gate
  incomplete.
- Reproducibility: strong for the failed construct and diagnostic.
- Evidence/claim honesty: PASS/STOP and natural benefit claims are withheld.

## Supported and unsupported claims

Supported: the finite native catalog/witness exists; the preclaim cases pass;
the first 11 natural windows serialize deterministically and decode equally; the
twelfth exposes an exact equal-cost backpointer pruning defect.

Unsupported: all-boundary exact RP-FDP fidelity on the natural corpus, useful
rank compression, p50/p90 full-cost residual, Q2 Stage A viability, scientific
STOP, Stage B readiness, or a paper main result.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not requested until revision.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: `null`
- Stage B authorized: `false`

