# Raw screen row events

| ID | Fresh heuristic/oracle family | Official source | Intended oracle/natural route | Result |
|---|---|---|---|---|
| R1 | KaHIP graph partition construction | https://github.com/KaHIP/KaHIP | Cut/balance verifier; public graph collections | `NOT_ADMITTED_UNFROZEN`: heuristic moves lack union-external atomic witness |
| R2 | MiniZinc flattening/model transform | https://github.com/MiniZinc/libminizinc | FlatZinc solver result; MiniZinc challenge models | `NOT_ADMITTED_UNFROZEN`: transform choice not separated from solver pipeline |
| R3 | COIN-OR CBC primal heuristic construction | https://github.com/coin-or/Cbc | MIP feasibility/objective oracle; MIPLIB | `NOT_ADMITTED_UNFROZEN`: candidate is generic solver heuristic |
| R4 | OGDF planarization/layout construction | https://github.com/ogdf/ogdf | Planarity/crossing oracle; public graph inputs | `NOT_ADMITTED_UNFROZEN`: output contract/action union not frozen |
| R5 | OpenMesh mesh decimation construction | https://github.com/OpenMesh/OpenMesh | Mesh validity/error oracle; public meshes | `NOT_ADMITTED_UNFROZEN`: local collapse actions do not yield witness yet |
| R6 | SUNDIALS nonlinear solve/preconditioner construction | https://github.com/LLNL/sundials | Residual/convergence oracle; public ODE models | `NOT_ADMITTED_UNFROZEN`: method selection is solver/control space |
| R7 | LLVM Polly schedule construction | https://github.com/llvm/llvm-project | Program equivalence/runtime oracle; PolyBench | `NOT_ADMITTED_UNFROZEN`: schedule freedom collides with generic polyhedral optimization |
| R8 | Ceres bundle-adjustment ordering construction | https://github.com/ceres-solver/ceres-solver | Residual/convergence oracle; BAL datasets | `NOT_ADMITTED_UNFROZEN`: ordering/preconditioner proposal is generic solver machinery |

All rows remain raw. No missing implementation/result/resource was used as a decision basis.
