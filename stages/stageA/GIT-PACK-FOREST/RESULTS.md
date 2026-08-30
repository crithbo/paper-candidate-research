# GIT-PACK-FOREST Stage A Results

## Outcome

Decision: `STOP`. Quality tier: `BELOW_Q2_STOP`.

The proposed N2 was implemented as a real Git-format-constrained, bounded-depth forest plus locality-aware legal write-order constructor. It did not collapse to the classic comparator: its forest differed from classic maximum-weight branching on 18 of 20 repositories. Nevertheless, all 832 selected useful candidate edges in each claim-bearing run were absorbed by the strongest conservative Git 2.55 union action space. Aggregate, p50 and p90 residual were all zero, below the preregistered 0.10 minimum. The candidate also had no reproducible pack-size or access benefit.

Evidence ceiling: `BOUNDED_NATURAL_20_REPOSITORY_GIT_2_55_NEGATIVE__NO_GENERAL_IMPOSSIBILITY_CLAIM`.

## Claim-bearing runs

Only these directories carry scientific inference:

- `work/codec-final-initial/` with `results/codec-final-initial/`
- `work/codec-final-replay/` with `results/codec-final-replay/`

They started only after `PRE_CLAIM_CONTRACT_FIDELITY_GATE` passed native Git delta, native Git zlib, object-identity, strict-checker, full-cost and small-witness checks. The first useful-edge claim-bearing observation was `hellogitworld` at `2026-08-09T20:46:34.8929917+08:00`, SHA-256 `F801377F44A9DA2B44995B50E6A3A19B8668CDBB8227DA6660B207EAC41B3755`.

All earlier runs remain immutable controls:

| Output | Classification | Why non-claim-bearing |
|---|---|---|
| `results/initial/` | `CODEC_OR_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING` | Git-format delta program was not Git 2.55 `diff-delta`. |
| `results/native-initial/`, `native-replay/` | `FULL_COST_INSTRUMENTATION_CONTROL__NON_CLAIM_BEARING` | Python allocation peak was mislabeled as OS RSS. |
| `results/claim-initial/`, `claim-replay/` | `INDEX_CONSTRUCTION_COST_CONTROL__NON_CLAIM_BEARING` | Custom index construction time/CPU was not merged into method construction cost. |
| `results/final-initial/`, `final-replay/` | `COMPRESSOR_VERSION_CONTROL__NON_CLAIM_BEARING` | Python zlib 1.3.1 differed from frozen Git zlib 1.3.2. |

These pre-claim corrections did not consume scientific `REVISE_ONCE`.

## Corpus

- 20 pinned public natural repositories/commits: 7 source-heavy, 7 renamed/vendored, 6 low-similarity controls.
- 7,016 complete reachable canonical objects; 50,091,889 canonical bytes.
- 89,346,888 cloned bytes.
- Full lock SHA-256: `22985F5747AC66717BF35557951FE542AEE43BB6FE4B141DCB819EB1B418A1DB`.
- Per-repository URL, default ref, commit, selection rule, complete object manifest, canonical SHA-256 and detected license are frozen in `inputs/corpus.lock.json` and `inputs/manifests/*.jsonl`.
- No shallow clone, object filtering, promisor omission, external delta base, content change or cross-repository collection was used.

## Native codec and small witness

- Git: `2.55.0.windows.1`; Git v2.55.0 source commit `e9019fcafe0040228b8631c30f97ae1adb61bcdc`.
- `diff-delta.c` SHA-256: `A7318C006CDED6394DAB8DA932C4BFCAACB8CD44BAEF61F96B790199E8768F9A`.
- Frozen Git zlib 1.3.2 DLL SHA-256: `93E9243A44C29200EEACAF9658EFE2558581770E4B11CA4B500E18E424A6E3B5`.
- Natural-edge parity: 38/38 byte-exact Git `diff-delta` programs and 38/38 byte-exact zlib level-6 streams across 19 repositories. Artifact: `results/GIT_NATIVE_CODEC_PARITY.json`.
- Small witness: 115/115 canonical objects equal; one legal base-before-child REF_DELTA at depth 1≤8; `index-pack --verify --strict=0`; `fsck --strict=0`; native delta and zlib parity; fixed cold/warm sample. Artifact: `results/PRECLAIM_WITNESS_NATIVE_CODEC.json`.

## Strongest union and comparator semantics

The union contains individually realizable same-information configurations, not a fictional configuration that enables incompatible actions together:

1. Git default reuse and no-reuse.
2. `window={20,40,80}`, `depth=50`, `window-memory=64m`, no-reuse.
3. name-hash versions 1 and 2.
4. path-walk with name-hash versions 1 and 2.
5. a single semantically compatible delta-island ref.
6. deterministic full-object and prior-edge constructors.
7. classic Edmonds maximum-weight branching, depth repair and legal Git-family order.
8. a five-node exact enumeration as an offline ceiling only.

PPC/JSS, MinHash, Finesse, LoopDelta and generic clustered delta graphs were not presented as equal-object baselines when their collection, codec or access contract differed.

## Main measurements

| Measure | Codec-final initial | Codec-final replay |
|---|---:|---:|
| Correct repositories | 20/20 | 20/20 |
| Candidate forest differs from classic | 18/20 | 18/20 |
| Selected useful candidate edges | 832 | 832 |
| Outside conservative union | 0 | 0 |
| Residual aggregate / p50 / p90 | 0 / 0 / 0 | 0 / 0 / 0 |
| Candidate size residual p50 | -55.2955% | -55.2955% |
| Candidate size residual p90 | -6.8404% | -6.8404% |
| Cold-access residual p50 | -3.5896% | -4.3020% |
| Warm-access residual p50 | -15.8706% | -19.9295% |
| Repositories with primary benefit | 0 | 0 |
| Driver PeakWorkingSet | 102,514,688 B | 105,988,096 B |

Coverage reasons per run were 719 directly observed union edges, 112 same-path path-walk superset edges, and 1 conservative window-80 proxy edge. Conservative coverage intentionally overestimates rather than understates the union action space.

Category residual p50/p90 were zero in all three strata. Candidate size residual p50 was negative in source-heavy, renamed/vendored and low-similarity strata; see `results/AGGREGATE.json`.

## Correctness and self-containment

All 280 method outputs in each claim-bearing run passed:

- self-contained, non-thin, unfiltered Git pack v2 plus index;
- `git index-pack --verify --strict`;
- isolated-repository `git fsck --strict --no-reflogs <frozen-commit>`;
- complete per-object type, size and canonical SHA-256 equality;
- exact manifest object count.

There were zero failures, inapplicable methods, fallbacks or canonical mismatches in both claim-bearing runs.

## Full cost

| Cost | Codec-final initial | Codec-final replay |
|---|---:|---:|
| Measured total CPU | 721.203125 s | 769.859375 s |
| Driver CPU | 710.750000 s | 760.015625 s |
| All-method construction wall sum | 358.072061 s | 357.977119 s |
| Candidate construction wall sum | 121.532840 s | 121.472544 s |
| Candidate construction CPU sum | 119.609375 s | 119.593750 s |
| Candidate index wall sum | 1.747889 s | 1.785801 s |
| Graph/precompute wall sum | 21.569678 s | 21.145507 s |
| Strict verification wall sum | 78.431887 s | 78.621650 s |
| Cold / warm access wall sum | 13.398633 / 1.317082 s | 13.525896 / 1.321713 s |
| Candidate pack+index bytes sum | 15,014,469 B | 15,014,469 B |
| All-method pack+index bytes sum | 145,517,919 B | 145,485,734 B |

All recorded pilot/control runs have a deliberately conservative CPU upper bound of 7,773.765625 seconds (2.1594 CPU-hours), below 14,400 seconds. Network acquisition CPU was not individually instrumented before the first claim; its locked setup records include 89,346,888 cloned bytes and 62.168541 seconds of manifest-freeze wall time, while the recorded-run upper leaves 6,626.234375 CPU-seconds of budget headroom. The post-analysis, pre-manifest workspace checkpoint was 3,039,633,317 bytes, below 4,294,967,296 bytes; final manifest scope bytes are recorded by `MANIFEST_VERIFICATION.json`. The immutable failed Lua acquisition attempt occupies 27,306 bytes. Full accounting is in `results/FULL_COST.json`.

## Reproducibility

Assessment: `SCIENTIFIC_DECISION_REPRODUCED__BYTE_HASH_PARTIAL`.

- Candidate joint pack/index: 20/20 hash pairs identical.
- Deterministic simple constructors: 40/40 hash pairs identical.
- Classic comparator: 19/20 identical; p-map chose one equal-byte, equal-edge-count maximum-branching tie.
- All methods: 224/280 pack/index hash pairs identical.
- Git's default `pack.threads=0` auto-detects online CPUs; several Git configurations selected different legal equal-purpose delta layouts across runs.
- Despite partial byte identity, every candidate edge's covered flag, every repository's outside count, all size residuals and all tiny exact ceilings were identical. The STOP decision therefore reproduced.

See `results/REPRODUCIBILITY.json`, `results/METHODS.csv` and `results/RESIDUAL_EDGES.csv`.

## Tiny exact ceiling

Nineteen repositories ran the preregistered exact five-node (four for spoon-knife) order/parent enumeration as `EXACT_CEILING_ONLY`. Hello-world had no eligible graph and is marked `INSUFFICIENT_GRAPH`. The exact solver is not treated as deployable or as evidence of a candidate benefit.

## Scientific interpretation

The highest-risk premise was that the coupled constructor would select useful Git-legal actions outside the complete union. It did not: residual was 0/832 in both final runs. Because the frozen rule requires at least 10%, this is direct strong-baseline absorption and a valid scientific STOP. The candidate also lacked a reproducible pack-size/access primary benefit, so it cannot survive as a cost-only mathematical Pareto point.

This result does not prove that no future Git pack constructor can improve Git, nor that every repository is covered. It stops this exact N2, constructor, union definition and frozen 20-repository contract.
