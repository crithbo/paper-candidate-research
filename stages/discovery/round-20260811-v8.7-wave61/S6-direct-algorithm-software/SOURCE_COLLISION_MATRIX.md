# Source and collision matrix — Wave61

| Family | Primary/official source | Current action/checker | Result |
|---|---|---|---|
| QRP | [QRP proof-system paper](https://doi.org/10.1007/978-3-642-02777-2_15) | Native QRP derivation/checking | Proof-producer not frozen beyond generic compressor. |
| QRAT | [QRAT paper](https://doi.org/10.1007/978-3-319-08867-9_17) | Native QRAT derivation/checking | Direct proof family. |
| QBF witness | [QBFEVAL](https://www.qbflib.org/qbfeval20.php) | Solver witness extraction/check | Existing solver/witness union. |
| SCIP | [SCIP documentation](https://www.scipopt.org/doc/html/) | MIP solve/solution verification | Solver-output wrapper risk. |
| HiGHS | [HiGHS documentation](https://highs.dev/) | LP basis/primal-dual certificate | Current solver union. |
| SPIN | [SPIN documentation](https://spinroot.com/spin/Man/) | Trail replay | Search/trail union. |
| nuXmv | [nuXmv](https://nuxmv.fbk.eu/) | Symbolic witness/invariant output | Current model-checking union. |
| TLC | [TLA+ tools](https://lamport.azurewebsites.net/tla/tools.html) | Error trace replay | Current exploration/output union. |

No retained candidate depends on an implementation-absence claim; all current actions are treated as strong same-information baselines.
