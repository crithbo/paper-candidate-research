# RQ candidate — Source53 S6

## RQ01

- **Seed:** S01.
- **Tentative public anchor:** current GHC User's Guide, `SpecConstr` documentation; official GHC source locus `compiler/GHC/Core/Opt/SpecConstr.hs`, frozen at the first ordinary current-source lookup.
- **Stable object / immutable envelope:** a fixed GHC Core program and compilation flags; emitted program retains Haskell observable behavior and declared optimization semantics.
- **Primary RQ:** For a fixed recursive Core call graph and semantics, can a non-generic, target-specific algorithm construct legal specialisation variants and call rewrites with an exact/FPT/certified-Pareto guarantee over specialization benefit, code growth and compilation-state cost beyond the current SpecConstr composition?
- **Decision consequence:** a positive answer would change the compiler's whole recursive-specialization construction; a negative answer narrows the surface to the current producer or a generic clone-selection kernel.
- **Contribution type / hypothesis:** `COMPILER_TOOL / N2`; no alternative RQ because object, semantics and endpoint are not ambiguous.
- **FINER-lite:** feasible `CONDITIONAL` through official docs/source and GHC testsuite; interesting `CONDITIONAL` because it can alter compilation versus runtime tradeoffs; novelty threat `HIGH` and must be checked; ethical/scope `PASS`; relevant `CLEAR` only if a target-specific recursive-call invariant survives.
- **Precommitted evidence route:** ANCHOR = official current GHC documentation; CURRENT = official source path and options; CONTRARY = existing compiler specialisation / generic clone-selection objection.  Transport-only fallback is the official GHC GitLab raw source view.
- **Pre-RQ closure:** `NONE`.  The anchor, object and answerable question are already sufficiently typed for ordinary Terra closure; no strong-model packet is requested.
- **Disposition:** `RQ_READY_FOR_ORDINARY_CLOSURE`.
