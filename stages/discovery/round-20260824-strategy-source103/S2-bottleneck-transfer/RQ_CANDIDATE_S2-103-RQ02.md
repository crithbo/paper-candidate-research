# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S2-103-RQ02`
- Discovery lane / assignment: `DISCOVERY_S2` / `DISCOVERY-S2-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S2-103-03` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: a public GPU–NDP LLM-inference operator/graph carrier with explicit placement, transfer and fallback semantics.
- Exact public anchor and version/date: `https://arxiv.org/abs/2408.06003` (version/date to be read from the public record before source closure).
- Stable object and immutable guarantee envelope: the anchored work's named model/operator and public execution boundary; any candidate must retain output/precision semantics and charge GPU, NDP, transfer, conversion and fallback costs.
- Decision-relevant counterfactual consequence: choose GPU or NDP placement with an attached representation/transfer boundary rather than treating an NDP component in isolation.
- Single anchor question: does the anchor define a same-object, public placement decision for which transfer/fallback terms and a CPU/single-GPU or model-level falsifier can be specified?
- Co-defined field bundle to close: `carrier / atomic action / estimand`.
- Contribution type hypothesis: `SYSTEM_ARCHITECTURE`.

## Candidate research questions

1. Primary RQ: For one public LLM-inference carrier with explicit GPU–NDP interfaces, can a constrained partition decision jointly choose placement and the required transfer/fallback boundary to improve a declared full-cost metric under unchanged output semantics versus a GPU-only or anchored current baseline?
2. Optional same-object alternative B and the genuine ambiguity requiring it: none.
3. Optional same-object alternative C and the genuine ambiguity requiring it: none.

## Scope and answerability

- Selected or merged RQ: primary RQ.
- Exact phenomenon, decision or estimand being asked about: a legal heterogeneous placement decision inclusive of required transfer, conversion, launch and fallback costs.
- In scope: public trace/model/simulator or source carrier; analytical/trace-level mechanism validation; resource-realistic CPU/single-GPU evidence path.
- Out of scope: assumed group hardware, server execution, unmeasured PIM/NDP throughput, multi-node disaggregation.
- Immutable semantic/quality boundary: unchanged named model/operator result, precision and fallback correctness.
- Candidate methodology or evidence route: source/trace plus an explicitly limited full-cost model or executable public simulator.
- Minimum public carrier/oracle route: anchored paper artifact/source and a current public baseline or simulator definition.
- Earliest observation that could falsify the question's motivating premise: no same-object GPU–NDP placement action exists, or required costs cannot be observed without unavailable private hardware.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — must have an accessible public carrier and finite non-hardware mechanism route.
- Interesting: `CONDITIONAL` — placement is decision-relevant only if full-cost terms can reverse an otherwise local choice.
- Novelty threat: `HIGH` — generic heterogeneous scheduling and direct work at the anchor are likely.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL` — only a bounded public-model conclusion is permitted absent stronger evidence.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: 直接对应 GPU–NDP/NDP 数据搬运的长期主线，但先以公开、可证伪、不能假定硬件可用的 full-cost 路线筛查。
- Alternative explanation or null hypothesis to test: existing GPU-only, anchored NDP mapping, or generic placement/scheduling already covers the decision once all costs are included.
- Precommitted primary evidence route: anchored paper and its public artifact/source; then current first-party baseline and one contrary deployment/generic placement source.
- Precommitted fallback route for transport/resource failure only: a named public simulator/trace released by the anchor authors.
- Forbidden outcome-aware reformulation: replacing unavailable hardware results with a different object, omitting fallback, or claiming a device-level speedup from an analytical model.

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`
- Exact anchor and stable object/guarantee frozen: `YES`
- One outcome-independent anchor question: does the public anchor supply a complete same-object GPU–NDP action and a finite public evidence carrier for full-cost accounting?
- Co-defined `carrier/action/estimand` bundle: `carrier/action/estimand`
- Named primary sources: `TWO` — anchored paper record and its identified public artifact/repository.
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: absence of a public same-object carrier or finite public evidence route; direct absorption by the anchor/current union.
- Requested model route: `TERRA_HIGH_ORDINARY`
- Frozen nomination timestamp: `2026-08-24T02:30:00+08:00`
- Packet result: `EARLY_FATAL`
- Evidence locators / provenance: the frozen anchor resolves to arXiv:2408.06003, *LUT Tensor Core: A Software-Hardware Co-Design for LUT-Based Low-Bit LLM Inference*, not a GPU–NDP placement/fallback carrier.

## Disposition

`EXCLUDED_BEFORE_LOCATOR__ANCHOR_IDENTITY_MISMATCH`
