# Source / current-union / collision matrix

| Family | First-party or primary source | Current action evidence | Strongest subtractor / contrary evidence | Result |
|---|---|---|---|---|
| OpenACM | Zhou et al., *OpenACM: An Open-Source SRAM-Based Approximate CiM Compiler* (2026), `https://github.com/ShenShan123/OpenACM` | paper describes integrated configurable multiplier library, accuracy-energy mapping and physical-design flow | paper itself is a direct same-object whole-algorithm subtractor | structural drop |
| DX100 | Khadem et al., *DX100*, ISCA 2025, arXiv:2505.23073; artifact `https://github.com/arkhadem/DX100` / Zenodo 15103397 | native DX100 actions reorder/interleave/coalesce accesses; MLIR passes construct offload programs | paper itself supplies cross-layer constructor; prefetchers are weaker historical baselines | structural drop |
| Type-constrained TS | 2025 PACMPL paper; `https://github.com/eth-sri/type-constrained-code-generation` | constrained decoding/type oracle | grammar/type-state search is generic | raw drop |
| QSS/qe compiler | IBM Quantum Engine Compiler paper; `https://github.com/openqasm/qe-compiler` | target localization/lowering path | hardware scheduling and source union not boundedly closed | raw drop |
| CPerf-Smith | CC 2026 primary proceedings/artifact | feature-controlled generation | test workflow, not same-object constructor improvement | raw drop |
| CHEHAB | CC 2026 primary locator/current public source route | not boundedly inspected | no current docs+source+flags triad; no absence claim | unfrozen |

Recent papers and artifacts were locators only. Neither a stated limitation nor an unavailable full source audit was used as proof of an action gap.

