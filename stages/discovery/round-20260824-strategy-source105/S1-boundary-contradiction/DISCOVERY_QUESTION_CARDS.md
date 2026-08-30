# Source105 S1 — Public PIM Command-Timing Question Cards

## Shared evidence boundary

- Exact public carriers: Ramulator2 2.1 current command/timing state model; Samsung PIMSimulator `dev` HBM2-PIM command/CRF model; UniNDP HPCA'25 artifact at commit `c8b21684358441d29fc81fa0866d07cec20582ed`; DCC ISCA'26 public repository/paper.
- Public natural/canonical workload carrier: UniNDP Llama2 7B/13B decode/prefill MM/MVM artifact descriptions and HBM-PIM MVM validation shapes.
- Current source finding: UniNDP local source commit contains `backend/hbm_pim.py` and `backend/hbm_pim_verify.py`, but a full-tree static search found no `CRF`, `programCrf`, or `HAB_PIM` token. This is a bounded current-source observation, not a global absence claim.
- Forbidden inputs respected: Source105 A3 audit and group repository were not read.

## `RQ-S1-105-01` — generic request-to-command mapping

- Current sources: Ramulator2 already distinguishes prerequisites, timing readiness, issue, and state update; UniNDP emits HBM-PIM instruction traces with command/row metrics.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: generic simulator/request mapping wrapper; no new PIM command action survives the current union.

## `RQ-S1-105-02` — CRF-resident HBM-PIM epoch scheduling

- Exact public identity: SAIT PIMSimulator `dev` HBM2-PIM `PIMKernel::executeGemv()` command contract, applied to a sequence of public Llama2 MVM shapes from UniNDP.
- Carrier kind: `CANONICAL_BENCHMARK_ONLY` with public LLM operator-shape carrier; no deployment-performance extrapolation is claimed.
- Exact object and semantics: same FP16 HBM-PIM GEMV output, the stock CRF instruction semantics (each PIM memory command advances CRF PC), SB/HAB/HAB_PIM mode state, GRF result/reset semantics, and PIMSimulator address/mode protocol.
- Primary RQ: 对一串依赖已冻结、CRF template 相同的 Llama2 GEMV sub-operators，是否存在一个 CRF-resident epoch scheduling algorithm，可在 32-entry CRF、每条 command 推进 PC、mode transition 与数据依赖约束下最小化合法 reprogram/park/mode epochs，同时保持 stock PIMSimulator result trace？
- Contribution type: `COMPILER_TOOL`; route: `N2`.
- Claim endpoint: target-native action — a legal command/mode/CRF epoch plan, not a simulator wrapper.
- Counterfactual consequence: the compiler chooses a different epoch boundary only when the CRF program/mode state is reusable; otherwise it reverts to stock per-GEMV sequence.
- Non-generic discriminator: CRF program capacity and PC advancement are coupled to the DRAM command sequence; standard instruction queue, generic layout mapping, or request scheduling does not itself encode the finite CRF-residency state.
- Current source loci: PIMSimulator `src/tests/PIMKernel.cpp` lines 113–139, 205–223, 338–411; UniNDP commit `c8b2168…` `backend/hbm_pim.py` / `hbm_pim_verify.py`; UniNDP artifact's LLM MVM and command-count interfaces.
- Strong baselines: stock `PIMKernel::executeGemv()` per invocation; UniNDP HBM-PIM instruction-driven compiler/simulator; DCC data-centric code/data-layout co-optimizer; simple per-operator no-reuse schedule.
- Full-cost boundary: CRF programming writes, park-in/out, SB↔HAB↔HAB_PIM transitions, barriers, input broadcasts, MAC/DRAM transactions, GRF reset/readback, row changes, and host-visible latency.
- Minimum falsifier: a two-GEMV same-template witness where reuse either exceeds 32 CRF instructions, changes PC/mode/result trace, gives no saved legal transition, or is already encoded by current UniNDP/DCC action.
- Bounded closure debt: exact DCC source-level coverage of CRF program/mode state; current PIMSimulator `dev` commit pin; frequency of reusable adjacent Llama2 GEMV templates; static result-trace oracle implementation. Owner: `DISCOVERY_DEEP / STAGE0 / STAGEA_PRECLAIM`.
- Current collision: `SEARCH_BOUNDED_OPEN`; no known direct fatal. UniNDP and DCC are named strong subtractors, not claims of absence.
- FIDELITY_CLOSURE_PLAN: extend neither simulator semantics nor object; emit stock-compatible command traces with CRF-resident epochs, replay on a small public GEMV witness, and compare output/PC/mode trace plus full cost. Public source acquisition is already localized; future build requires its own Stage A resource preflight.
- Quality hypothesis: `TIER_B_Q2_VIABLE` conditional on a nontrivial epoch algorithm, demonstrable reuse families, and DCC/UniNDP residual surviving Stage 0; possible Q1 only with broad model/architecture evidence.
- RAW_REQUIRED audit: `COMPLETE` with bounded closure debt.
- Disposition: `EVIDENCE_QUALIFIED_RAW`; eligible for C0: `YES`.

## `RQ-S1-105-03` — generic prerequisite certificate

- Current sources: Ramulator2 already supplies prerequisite/timing readiness semantics; UniNDP tracks hardware states and data dependencies.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: generic trace certificate/checker without distinct epoch action.

## `RQ-S1-105-04` — timing interference mapping

- Current sources: Ramulator2 scoped timing constraints and UniNDP global countdown/resource model already represent command interference at the intended abstraction.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Disposition: `LOCATOR_ONLY`.
- Reason: no PIM-specific atomic mapping construction beyond controller configuration was frozen.

## `RQ-S1-105-05` — address decomposition

- Current sources: UniNDP encodes data mapping and DCC jointly optimizes data rearrangement/compute code for HBM-PIM and LLM kernels.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: current mapping union/ordinary address-map tuning absorbs the proposed action.

## `RQ-S1-105-06` — generic issue/retire overlap

- Current sources: UniNDP instruction queue chooses issuable instructions under PU/buffer/DRAM countdowns.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: ordinary instruction scheduling; the CRF-specific residual is retained only in RQ-02.

## `RQ-S1-105-07` — functional/timing correspondence wrapper

- Current sources: UniNDP already validates HBM-PIM MVM latency against PIMSimulator; PIMID and other full-system tools are strong adjacent validation mechanisms.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: cross-simulator validation wrapper lacks a target-native action.

## `RQ-S1-105-08` — generic state-space search

- Current sources: Ramulator2's state machine and UniNDP/DCC compilation spaces.
- RAW_REQUIRED audit: `INCOMPLETE`.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: `GENERIC_SHELL` without a CRF-specific action or fixed operator endpoint.

## Front-end result

| Metric | Count |
|---|---:|
| Non-evidence seeds | 8 |
| Frozen primary RQs | 8 |
| `EVIDENCE_QUALIFIED_RAW` | 1 |
| C0 / D1 / deep review | 1 / 1 / 1 |
| Clean Stage 0 briefs | 1 |

No open source-closure queue remains. The one clean brief has explicit current-union and fidelity debt; it does not assert main results or an absence claim.
