# COH-REGION-LIFECYCLE Stage A Results

## Material Passport

- Origin Skill: `academic-research-suite / experiment-agent`
- Origin Modes: `plan → run → validate`
- Origin Date: 2026-08-09
- Verification Status: `VERIFIED` for deterministic software replay
- Version Label: `COH-RL-A1-ATS-TRACE-20260809`
- Evidence class: `ANALYTICAL_TRACE_SOFTWARE_ONLY`

## Outcome first

The narrow premise received `PRELIMINARY_SUPPORT`: under the frozen analytical cost grid, both locked natural CUDA programs contain at least one region-wise mixed lifecycle plan whose charged cost is lower than every **single uniform** B0–B3 policy. This result does **not** establish a GH200 speedup or show that a deployable tuned region selector is beaten.

The result is deliberately non-universal. Pathfinder is fragile: 1,032/3,456 grid points (29.86%) have a positive mixed residual, the maximum normalized residual is only 0.113%, and 2,424/3,456 points (70.14%) are absorbed by a single policy or lose after planner cost. BFS is structurally stronger: 3,118/3,456 points (90.22%) are positive, 2,666 (77.14%) exceed a 5% normalized residual, but 338 points (9.78%) are still counterexamples. Grid frequency is sensitivity coverage, not probability; normalized residual is not elapsed-time speedup.

## Frozen object and program extraction

The object is GH200 in ATS hardware-coherent mode with CUDA 12.4.0 / R550.54.14, 64 KiB system pages, access-counter migration enabled, and AutoNUMA disabled. CUDA reports ATS hardware coherency through `cudaDevAttrPageableMemoryAccessUsesHostPageTables`; NVIDIA documents ATS as a single host-page-table addressing mode in which system `malloc` memory is GPU-addressable. CUDA 12.4 also enables Grace Hopper access-counter migration by default. These facts are contract inputs, not locally measured facts.

The program source is Altis commit `042e2926d1fe9a5ea5b3e2d659b75bf925b152cc`:

| Program | Immutable-after-init regions | Lifecycle structure extracted | Source lock |
|---|---|---|---|
| Pathfinder size 1 | `wall[1:rows]`, seed row | CPU seeded construction; one-pass immutable wall; long-lived GPU ping-pong state; final CPU-visible row | `pathfinder.cu` blob `2b90097b…` |
| BFS 65,536 | graph-node table, graph-edge array | CPU file load; immutable irregular graph; repeated GPU frontier/visited/cost state; host-visible continuation flag | `bfs.cu` blob `cee59c09…`; input blob `66b114a7…` |

Both programs are natural benchmark programs used in the GH200 characterization lineage. The locked Pathfinder data are deterministic internal generation with seed 7; BFS uses the immutable Altis `bfs_65536` file. This Stage A probe uses their region/phase structure only and does not claim natural GH200 performance evidence.

## B0–B4 full-cost ledger

| Item | B0 system-first-use | B1 demand UVM | B2 advised/prefetched UVM | B3 explicit copy | Candidate/B4 |
|---|---|---|---|---|---|
| Representation | `malloc` under ATS | `cudaMallocManaged` | `cudaMallocManaged` | host + `cudaMalloc` | per-region selection from B0–B3 |
| Initialization | exact CPU or legal exact GPU initializer | same | same | same; H2D if CPU-origin bytes are required | same-function initializer legality frozen per region |
| First materialization | PTE/remote access; delayed access-counter migration | demand fault/migration | advice + prefetch + sync | explicit H2D | selected pre-phase action |
| Steady access | C2C until/except migrated hot pages | GPU-local after migration; CPU may access over ATS | GPU-local after prefetch | GPU-local | selected per region |
| Return/control | coherent direct access | direct managed access or migration proxy | direct/prefetch minimum | D2H and control copies | selected per transition |
| Fixed/metadata | system allocation/PTE proxy | managed allocation/fault proxy | advice/prefetch metadata | device allocation/copy metadata | extraction + planning overhead |
| Status | deployable named baseline | deployable named baseline | deployable tuned baseline | deployable named baseline | B4 is oracle ceiling; candidate charges planning overhead |

Unchanged kernel computation is omitted from the *difference* because it is identical across policies. Allocation, initialization, PTE/remote access, migration/prefetch, H2D/D2H, C2C, sync/metadata, phase transitions, extraction/planning, and fallback are charged. No measured time, bandwidth, faults, energy, PPA, or silicon metric appears in this ledger.

## Mechanism-specific findings

- Pathfinder's recurring mixed pattern keeps the large, one-pass immutable wall in B0 system memory while using demand UVM for the repeatedly accessed ping-pong state. The best positive grid point has only 0.113% normalized residual after planner cost, so this is a structural witness, not meaningful performance evidence.
- BFS commonly keeps immutable graph nodes/edges in B0 while assigning repeated frontier state to B1 or B2 and the tiny alternating flag to B1. The best grid point uses three actions and has 57.83% normalized residual, but that magnitude is entirely model-conditioned.
- B4, the per-region union oracle, absorbs the physical action set by construction. The candidate cannot beat B4 and is worse by exactly the charged planner overhead. Therefore the surviving N2 residual is an implementable finite-horizon selection algorithm and cost model, not a new memory primitive.
- Counterexamples are present in both programs. In some Pathfinder regimes low remote-access cost makes B0 uniform best; in some BFS regimes demand UVM is already uniform-best and planner overhead makes the mixed candidate lose.

## Reproducibility validation

Two canonical runs produced byte-identical outputs:

| Artifact | Run 1 SHA-256 | Run 2 SHA-256 | Verdict |
|---|---|---|---|
| `summary.json` | `CD7341F341249588F2CCF167B78AC2BC705D6A79D350FD738BD7C59ADD54AC98` | same | exact match |
| `grid.csv` | `BA53B59365936D421B4BAC2B1A4FF7F173A300152F90A5952C5446447C2C53E3` | same | exact match |

`VALIDATE_SCRIPT.py` checked 6,912 rows, finite numeric values, the B4 oracle bound, candidate = oracle + planner cost, the rule that a positive residual requires a mixed plan, two-program identity, and the explicit no-GH200/no-main-claim ceiling. All checks passed. The first preflight run had a reporting-only mixed-plan-count bug; its output was not accepted, the counter was corrected, and both canonical runs were regenerated.

## Evidence ceiling and claim ledger

| Evidence class | Present? | Claim ceiling |
|---|---:|---|
| Analytical sensitivity | yes | mixed decision space is non-empty in frozen model |
| Trace/program-structure extraction | yes | two public program region/lifecycle contracts are definable |
| Executable software | yes | exhaustive selector and counterexample scan replay exactly |
| Local RTX 4070 GPU | inventory only | no candidate performance claim; not the same object |
| GH200 GPU/driver measurement | no | no speedup, causal PTE/migration, or Pareto claim |
| RTL/synthesis/P&R/FPGA/silicon | no | no hardware implementation or PPA claim |

Supported: `PRELIMINARY_SUPPORT` for a non-empty lifecycle combination space relative to any one uniform B0–B3 policy; `NOT_FALSIFIED` for the need to test a deployable lifecycle selector on GH200.

Unsupported: measured advantage over tuned UVM/advice/explicit-copy; superiority over a deployable per-region selector; cross-driver or CDMM generality; energy/PPA claims; `MAIN_CLAIM_ESTABLISHED`.

