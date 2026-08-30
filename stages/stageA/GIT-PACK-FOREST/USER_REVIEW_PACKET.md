# GIT-PACK-FOREST User Review Packet

## Requested disposition

Accept the Stage A owner handoff as `STOP / BELOW_Q2_STOP`. Do not authorize Stage B and do not create a project directory.

## Why this is a scientific STOP

- The real candidate mechanism exists and is distinct from classic branching on 18/20 repositories.
- Every one of 832 selected useful candidate edges per run is already inside the strongest conservative Git 2.55 union action space; residual aggregate/p50/p90 is 0 twice, below the frozen 10% minimum.
- Candidate pack+index size is worse: p50 -55.30%, p90 -6.84% relative to the best union member.
- Cold and warm access p50 are negative in both runs; zero repositories have a preregistered primary benefit.
- The result is not a resource failure, AI inability, same-object failure or weak-baseline artifact.

## Trust checks

- 20 pinned public natural repositories; 7,016 complete reachable objects.
- 38/38 byte-exact native Git 2.55 delta programs and 38/38 byte-exact native Git zlib streams.
- 20/20 repositories pass strict index, strict fsck and every-object canonical equality in initial and replay.
- Candidate pack/index hashes reproduce 20/20; scientific decision reproduces despite expected/tied baseline byte variation.
- Full cost includes index construction, graph/optimization, CPU/wall, OS peak RSS, strict verification, access, failures and workspace.
- Conservative recorded pilot/control CPU upper: 2.1594 CPU-hours; pre-claim network acquisition CPU is separately disclosed; final workspace about 3.04 GB.

## Claim ceiling

Supported: this exact coupled constructor has no useful residual or primary benefit under the frozen Git 2.55, 20-repository contract and should stop before Stage B.

Not supported: a general impossibility theorem for Git packing or delta forests.

## Files to review

- `STAGEA_REPORT.md` — formal decision and fidelity gate
- `RESULTS.md` — measurements, costs, controls and interpretation
- `EXPERIMENT_CONTRACT.yaml` — frozen object, union and stop rules
- `Q1_COMPARATOR_MATRIX.md` — paper-shape calibration
- `results/AGGREGATE.json` — machine-readable decision evidence
- `results/FULL_COST.json` — complete cost ledger
- `results/REPRODUCIBILITY.json` — replay and hash audit
- `results/GIT_NATIVE_CODEC_PARITY.json` and `results/PRECLAIM_WITNESS_NATIVE_CODEC.json` — native codec and final-path witness evidence
- `HASH_MANIFEST.sha256` and `MANIFEST_VERIFICATION.json` — final integrity

## Stage B gate

- `stageb_user_approval_id: null`
- `stageb_authorized: false`
- `PENDING_USER_STAGEB_REVIEW: no`

No user action is required to unblock execution. Mainline should mechanically accept or reject this Stage A package, then return the lane to reusable idle state.
