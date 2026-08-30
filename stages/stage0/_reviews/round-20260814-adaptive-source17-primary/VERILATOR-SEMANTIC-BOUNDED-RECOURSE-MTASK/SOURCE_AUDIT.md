# Source and collision audit

## Frozen input integrity

| File | Contract SHA-256 | Local result |
|---|---|---|
| Brief | `7BE3B8A54914BE0BBAFE03B43DB50FF768065AAD380F7F21930E141C4FDACF04` | readable; scope consistent |
| Collision matrix | `1638CA5E1F24A1DAA959F4ABFDE22FA2645CD3973CDD592678BBE9AE927C88F8` | readable |
| Discovery log | `B5D5A20350C7297EF72880594CFABF06F17809241D88D00AC145CEE644B56182` | readable |
| Discovery handoff | `666C23D6D3EC6D90D109B5ABD4E1B709435BD08838EEB8F296A5E2DB537594B7` | readable |

## First-party current-source audit (2026-08-14)

| Source | What was independently verified | Impact |
|---|---|---|
| [internals.rst](https://github.com/verilator/verilator/blob/master/docs/internals.rst) | `V3Sched::schedule` is static Verilation-time scheduling; `V3Order` builds statement DAG; `V3Partition` coarsens it; MTasks run atomically; runtime uses static thread assignment/order, with prerequisite blocking only | confirms exact semantic and static-action boundary |
| same, multithread TODO sections | runtime graph follower is unsupported; efficient dynamic scheduling and static runtime repack are described as future work; PGO changes MTask scheduling but not packing | directly narrows, rather than proves performance of, the residual |
| [simulating guide](https://verilator.org/guide/latest/simulating.html) | Thread-PGO writes `profile.vlt` during one executable run, then requires a later Verilation with that profile | static recompile baseline, not in-process epoch action |
| [argument reference](https://verilator.org/guide/latest/exe_verilator.html) | default `--threads 1`; `--threads N`; `--threads-dpi` modes; `--threads-max-mtasks` compile-time partition count | finite equal-information configuration union |
| [official repository](https://github.com/verilator/verilator) | current upstream repository and emitted multithreaded model scope | source-location authority |

## Pin caveat

An attempted read-only `git ls-remote https://github.com/verilator/verilator.git HEAD` failed locally: `schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS`. No absence inference was made. Revision must record a commit SHA and blob URLs using an available official path before a claim-bearing Stage-A run.

## Collision conclusion

Current native mechanisms are subtractors, not direct fatal collision: their action is static compile-time assignment or re-Verilation from PGO. Generic macro-dataflow scheduling is outside the same full semantic and generated-model contract. Broader direct-paper search remains `SEARCH_BOUNDED_OPEN`; this report does not assert literature absence.
