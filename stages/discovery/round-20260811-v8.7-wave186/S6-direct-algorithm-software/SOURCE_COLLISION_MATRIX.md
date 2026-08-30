# Source collision matrix

| primary/official source | significance |
|---|---|
| [veriT official site](https://www.verit-solver.org/) | Establishes active proof-producing SMT solver and external proof-checking use. |
| [Fine-grained formula processing paper](https://www.verit-solver.org/papers/jar2020.pdf) | Directly documents proof-producing preprocessing, ruling out a generic “make presolve certified” claim. |
| [SCIP exact mode](https://www.scipopt.org/doc-10.0.0/html/EXACT.php) | Establishes exact MIP certificate production and VIPR/CakeML checking route. |
| [SoPlex official site](https://soplex.zib.de/) | Establishes presolving and exact rational solution mechanics, but not complete independent certificate/lifting union. |
| [CAQE official page](https://finkbeiner.groups.cispa.de/tools/caqe/) | Establishes certifying QBF solver and first-party source availability. |
| [QRATPre+ paper](https://arxiv.org/abs/1904.12927) | Direct proof-system-level preprocessing collision. |
| [Certified MaxSAT Preprocessing](https://arxiv.org/abs/2404.17316) | Direct same-object end-to-end certified preprocessing collision. |

No old paper, issue or future work is used as current-absence evidence. All four deep reviews remain unclosed rather than claiming that a producer lacks a rule or flag.

