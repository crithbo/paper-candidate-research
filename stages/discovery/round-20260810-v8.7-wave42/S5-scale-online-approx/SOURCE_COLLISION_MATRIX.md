# SPLIDT potential rescreen — source and collision matrix

| Item | First-party evidence | Frozen conclusion |
|---|---|---|
| Anchor and exact object | [SPLIDT NSDI '26 paper](https://www.usenix.org/system/files/nsdi26-parvez.pdf) and [official project](https://splidt-decision-trees.github.io/) | Partitioned, window-based stateful DT construction/training and P4 deployment; not generic streaming classification. |
| Current artifact | [Official GitHub artifact](https://github.com/SpliDT-Decision-Trees/SpliDT-Artifact-NSDI26) | `main`; visible submodule references `dse-and-training-framework@712f49d` and `hypermapper@3dfa8a7`; README documents baselines, datasets and configuration-driven training. |
| Natural carrier | Official artifact README | Seven named real traffic datasets are publicly released by the authors; no data was downloaded or analyzed. |
| Current action union | Paper/project artifact | Partitioned subtrees, per-partition features, recirculation resource reuse, training/DSE, range marking, baseline configurations and target feasibility. |
| Current source/config reality check | Official repository page plus raw official URLs attempted 2026-08-10 | Raw training/config files returned cache-miss through the available read-only fetch. No source-symbol, flag, threshold or configuration absence claim is made. |
| Direct collision outcome | Paper/project | No direct collision is asserted against a future complete delta-construction algorithm; no such algorithm was specified. `SEARCH_BOUNDED_OPEN` is not a novelty conclusion. |
| Structural admission outcome | Six-dimensional residual test | Without a complete atomic constructor, guarantee and finite action-divergence witness, a brief would be a renamed “online retraining” proposal. `COMPLETE_ZERO_PROPOSALS`. |

## Minimum action-divergence witness required before any later proposal

Fix two sequential labeled flow-window batches, one target resource budget, and a complete output contract (prediction, TTD, target feasibility). The candidate must transform the prior partition/tree/rule state via a named constructor. The current union must be replayed under the same data and cost ledger. A result that merely changes DSE search cadence, a threshold, feature count, partition count, or retraining frequency is a selector/configuration change and fails admission.
