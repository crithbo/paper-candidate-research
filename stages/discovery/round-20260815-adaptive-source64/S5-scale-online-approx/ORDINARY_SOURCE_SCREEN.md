# Source64 ordinary source screen

| Role | Official source | Result |
|---|---|---|
| ANCHOR/CURRENT | https://ghc.gitlab.haskell.org/ghc/doc/users_guide/separate_compilation.html | Current guide documents object/interface outputs and the recompilation checker. |
| CURRENT | https://ghc.gitlab.haskell.org/ghc/doc/libraries/ghc-9.15-inplace/GHC-Iface-Recomp-Types.html | Current interface state stores source, usage, important-flag, optimisation, HPC, and plugin fingerprints for recompilation checks. |
| CURRENT/CONTRARY | https://downloads.haskell.org/ghc/9.10.2/docs/libraries/ghc-9.10.2-96d4/GHC-Unit-Module-Status.html | Native state distinguishes up-to-date, interface update, and recompilation actions. |

The official union already maintains detailed interface fingerprints/usages and has an update-without-recompile action. The supposed residual therefore cannot be frozen as a new GHC-native atomic action; it reduces to generic dynamic dependency maintenance. No natural versioned carrier or target-specific bound survives this collapse.

S64-RQ-01 is LOCATOR_ONLY, not raw or a scientific STOP. No concrete missing source can close this generic-shell failure; queue is empty.
