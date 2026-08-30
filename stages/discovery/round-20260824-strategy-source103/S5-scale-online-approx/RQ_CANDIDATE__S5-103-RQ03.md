# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S5-103-RQ03`
- Discovery lane / assignment: `DISCOVERY_S5` / `DISCOVERY-S5-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S5-103-03` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: vLLM paged KV-cache blocks and quantized/offloaded cache paths.
- Exact public anchor and version/date: `vllm-project/vllm`, current KV cache manager/quantized-cache source and documentation; commit/date to be frozen.
- Stable object and immutable guarantee envelope: one specified cache representation and a fixed error/quality contract.
- Decision-relevant counterfactual consequence: a cache block changes legal representation or residency under context growth.
- Single anchor question: which native cache-block representation update actions and error interfaces exist today?
- Co-defined field bundle to close: `carrier / atomic action / estimand`.
- Contribution type hypothesis: `SYSTEM_ARCHITECTURE`

## Candidate research questions

1. For a version-frozen vLLM KV-cache carrier with a fixed numerical-error contract, can a hierarchical online block representation maintain legal precision/residency changes at lower complete conversion, metadata and transfer cost than the native policy?

## Scope and answerability

- In scope: one cache manager, block invariants, conversion/metadata/transfer cost and a fixed error boundary.
- Out of scope: claims about all LLM runtimes or unmeasured multi-node memory systems.
- Candidate methodology or evidence route: `PARETO_APPROXIMATION`.
- Minimum public carrier/oracle route: current source, documented configuration and a small cache-block numerical witness.
- Earliest falsifier: native current union already implements equivalent dynamic representation change or no fixed error interface exists.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL`.
- Interesting: `CLEAR` if carrier provides a public local witness.
- Novelty threat: `HIGH` — KV quantization and offload literature.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL`.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: S5 的近似/层次表示假设必须先扣除 vLLM 当前 KV 量化、offload 与 cache manager 联合动作。
- Alternative explanation or null hypothesis to test: 现有 KV quantization/offload 已覆盖全部 block-level recourse。
- Precommitted primary evidence route: vLLM official docs and current repository source.
- Precommitted fallback route for transport/resource failure only: official tagged source archive and documentation snapshot.
- Forbidden outcome-aware reformulation: 不得把无固定误差合同改写成普通 eviction/controller。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`
- Exact anchor and stable object/guarantee frozen: `NO`.
- One outcome-independent anchor question: block-level representation, legality and numerical contract are jointly defined where?
- Co-defined `carrier/action/estimand` bundle: `cache block / representation change / error-full-cost`.
- Named primary sources: `TWO`.
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: direct coverage, absent fixed semantic interface, or one frozen residual action.
- Requested model route: `TERRA_HIGH_ORDINARY`
- Packet result: `NOT_RUN`

## Disposition

- `PRE_RQ_CLOSURE_NOMINATED`

