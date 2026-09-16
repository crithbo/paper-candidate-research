# Source and collision matrix

| Family | First-party/current source check | Primary locator / direct subtractor | Current-union / collision result | Decision |
|---|---|---|---|---|
| RelProp relational reachability | `https://github.com/carolinager/RelProp` (current README + `relprop.py`; repository redirects from historic URL); documented semantic and computation controls reviewed | Gerlach et al., *Efficient Probabilistic Model Checking for Relational Reachability*, CAV 2025, arXiv:2505.16357; Storm expected-reward solvers | CAV method already is the specific relational product/reward constructor; residual becomes generic quotienting | Structural drop |
| Omega-regular certificates | `https://github.com/Ipouyall/Omega-Regular-Stoch-Cert` current main, README, `Documents/Instruction.md`, `Documents/input_format.md`, `src/` | Henzinger et al., *Supermartingale Certificates for Quantitative Omega-regular Verification and Control*, CAV 2025 | Native constraint-synthesis kernel is the fair comparator; no target-specific independent certificate constructor found | Structural drop |
| INTERLEAVE MEC | CAV 2025 artifact source/implementations named BASIC, LOCKSTEP and INTERLEAVE | *INTERLEAVE: A Faster Symbolic Algorithm for Maximal End Component Decomposition*, CAV 2025 | The proposed global symbolic construction is the primary method itself | Raw drop |
| rIC3 | Primary CAV 2025 paper/artifact locator only; no current-source triad completed | *The rIC3 Hardware Model Checker*, CAV 2025 | no current-union conclusion made | Not admitted unfrozen |
| FuzzFlesh | `https://github.com/ambergorzynski/control_flow_fleshing`, current source and `ecoop-2025` artifact branch | Gorzynski & Donaldson, *FuzzFlesh*, ECOOP 2025 | generator is a test workflow; no direct same-object optimization residual | Raw drop |
| CAISAR | official primary tool-paper/artifact locator, current upstream not boundedly closed | *The CAISAR Platform*, 2025 | proposed work is backend/pipeline control; no source-supported constructor residual | Raw drop |

All paper limitations/results were used solely to locate material. No limitation, issue, or missing implementation was treated as proof that a current action is absent.

