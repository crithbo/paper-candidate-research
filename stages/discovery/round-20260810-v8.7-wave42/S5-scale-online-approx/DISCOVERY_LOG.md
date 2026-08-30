# DISCOVERY-S5-20260810-V8.7-WAVE42-SPLIDT-POTENTIAL-RESCREEN

**Result:** `COMPLETE_ZERO_PROPOSALS`  
**Cut-off:** 2026-08-10  
**Method:** production v2/v8.1, v8.6 fidelity admission, v8.7 current-upstream reality. The blocked two-axis v8.2r2 method was not used.

## Frozen real object

The object is not generic online decision trees. It is the authors' public SPLIDT artifact object: construct a partitioned decision tree from labeled packet-flow data; compile its feature collection, range marking and subtree inference into a resource-feasible P4 data-plane deployment; infer one class for each flow over packet windows at line rate. The output is the classifier prediction and target-feasible P4 realization. The frozen quality boundary includes classification quality, time-to-detection, line-rate operation, match-action/register resources, recirculation, and target feasibility. Training and construction cost is part of the object, not free offline preprocessing.

The public artifact identifies the official repository branch `main`, training submodule reference `712f49d`, HyperMapper `3dfa8a7`, baseline instructions, and seven natural traffic datasets (CIC-IoMT2024, CIC-IoT2023 variants, ISCX-VPN2016, CampusTraffic, CIC-IDS2017, CIC-IDS2018). No dataset, source tree, or experiment was downloaded or executed.

## Structural paper potential versus current readiness

| Dimension | Assessment |
|---|---|
| Structural paper potential | An online/delta construction algorithm for resource-feasible partitioned DTs could in principle be a nontrivial N2 if it maintained a named prediction/resource guarantee while changing only affected partition/rule state, with bounded update work relative to whole reconstruction. This is a conditional research shape, not evidence that such an algorithm exists. |
| Current evidence readiness | Insufficient to freeze a Stage0 contract. The actual training source and YAML configuration contents required to determine the current complete action space could not be read in this assignment. No upstream absence claim is made. |
| Admission decision | No brief: the putative action is still only a label (“incremental update”), not a complete atomic action with a proof/approximation contract and finite action-divergence witness. |

## Candidate action attempts and six-dimensional test

| Attempted N2/N3 action | Decision rule | Information / resource | Guarantee and full cost | Generalization / no-gain | Result |
|---|---|---|---|---|---|
| Delta rebuild only affected partition subtrees after labeled-flow drift | Needs a deterministic affected-subtree criterion and a rule-state transformation, not a retraining cadence or threshold. | Must use the same labeled flow windows, target constraints and resource model available to SPLIDT; count tree construction, rule generation/install, control-plane update, recirculation, MAT/register use, training and inference. | Must preserve a stated classifier/TTD/line-rate/target-feasibility guarantee; no bound or action interface was available to freeze. | Potentially useful only under localized drift; stationary/global drift is a no-gain or whole-rebuild case. | Not a complete atomic action; no proposal. |
| Approximate replacement of stale subtrees under bounded prediction loss | Needs an explicit approximation objective and replacement construction, not a policy choosing when to retrain. | Same features/labels/windows and target resource budget; count approximation construction and deployment cost. | A permitted prediction-loss/TTD/resource bound was not specified and cannot be inferred from the existing DSE. | Benefit would depend on low-dimensional/local drift; adversarial global shift defeats locality. | Not a complete guarantee-bearing action; no proposal. |
| Learn stable cross-dataset partition regularity (N3) | Needs a natural reproducible invariant that predicts a construction improvement. | Seven public datasets are a possible carrier but were not analyzed. | Must still count target compilation and all model/resource costs. | Without an observed invariant, this is a measurement hypothesis only. | No N3 observation; no proposal. |

## Strong fair baseline union and collision

The union is: original one-shot data-plane DT baselines, NetBeacon/Leo as named by the SPLIDT paper, SPLIDT partitioned feature collection/inference, its training/DSE/rule-generation framework, and feasible configurations under the same target resource model. An offline whole-reconstruction is a ceiling only when it receives equivalent training data, target constraints and full cost.

This union does **not** automatically prove that an algorithmic online/delta method is impossible. Conversely, it cannot be declared outside the union merely because the visible README does not describe it. The source/configuration inspection needed to distinguish these cases did not complete: official GitHub raw-file retrieval returned a cache-miss error. This is documented as a bounded source-access condition, not as an implementation absence or scientific negative result.

## Fidelity closure and finite killer decision

No `FIDELITY_CLOSURE_PLAN` can be honestly issued for a proposed atomic action. A valid future plan would first close the current-source ledger, then define a tiny witness consisting of two labeled flow-window batches and a fixed target budget where the claimed delta constructor either (a) produces a target-feasible transformed partition/rule state with the frozen prediction/TTD guarantee, or (b) fails and triggers `DIRECT_FATAL`/structural rejection. Natural carrier would be the authors' released traffic datasets; full cost would include construction, rule compilation/installation and inference resources.

That path is deliberately not a Stage-A plan here: it lacks the named constructor, guarantee and complete current-action comparison. No experiment, benchmark, artifact download, Stage0/A/B action, or master-control change occurred.
