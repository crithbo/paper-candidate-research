# Source106 evidence-qualified raw gate

## Result

`NO_RAW_ADMISSION__ZERO_DEEP__ZERO_BRIEF`.

The assignment requires a public, same-object refresh/row-buffer timing boundary for an LLM-related PIM/DRAM carrier, plus a non-generic atomic action. No RQ meets both requirements. This is a bounded abstention, not a claim that no such work exists.

## Current-upstream reality check

The current public Ramulator2.1 guide configures `FRFCFS`, `AllBank` refresh, `Open` row policy and address mapping as separate controller components. It also exposes scheduler/plugin extension points and built-in command counting/trace recording. Therefore, a proposal phrased only as “make refresh and row-hit decisions jointly”, “add a refresh/row statistic”, or “add a timing-aware scheduler” fails the non-generic/action-residual test unless it identifies a tighter public PIM/LLM protocol and a current uncovered action.

The public PIMSimulator material establishes HBM2 PIM bank/row mapping and configurable open-page, mapping and round-robin scheduling fields, but not an LLM-native refresh-specific transformation with a frozen semantics-preserving action. Its knobs cannot be converted into a paper claim by relabeling them as a compiler policy.

The public Ramulator and PIM artifacts inspected either provide generic/input trace frontends or trace formats whose LLM provenance and refresh-specific action were not established. PAPI's advertised GPT traces are generated from model parameters; that is not, by itself, the required native carrier for the fixed refresh interaction. No source was cloned or run because none cleared this admission gate.

## Collision boundary

`RH+: Row-Hit-Optimized Scheduling for PIM-based LLM Inference` (arXiv:2606.05511v1, 2026-06-03) already targets LLM-PIM GEMV row locality via address stride. It is not treated as proof that every refresh-specific idea is absorbed. It does, however, eliminate an ordinary row-hit/stride formulation as a residual: any continuing candidate must prove a distinct refresh action, same-object carrier, legality/full-cost contract, and current-source absence.

## Per-RQ decision

| RQ | Gate failure | Disposition |
|---|---|---|
| RQ-S106-01 | no public LLM-native PIM refresh action/command carrier frozen | no raw |
| RQ-S106-02 | generic configurable controller extension; no specific current gap | no raw |
| RQ-S106-03 | no source-visible same-semantics LLM lowering→timing carrier | no raw |
| RQ-S106-04 | current statistics/plugins make a bare diagnostic routine; no natural estimand/carrier | no raw |
| RQ-S106-05 | command tracing exists; no public native producer proves unrecoverable operation identity | no raw |
| RQ-S106-06 | candidate artifacts are generated, generic, or architecture-specific without fixed refresh action | no raw |
| RQ-S106-07 | no independently available phase-shift action or non-tautological carrier | no raw |

## Scope and resource record

- CRFEPOCH exact/contains identity: excluded solely through the authorized registry terminal hold; no Stage0 output/chat was read.
- Group repository / Rule-Audit outputs: not read.
- Resource actions: `0`; no download, clone, build, run, cache, or inventory update.
- Experiments: `0`.
- State transitions: `0`; the lane remains MAINLINE-owned `ACTIVE` pending handoff acceptance.

## Finite conclusion

No eligible raw package can freeze exact object, natural/canonical carrier, non-generic action, current-source locus, falsifier and full-cost route simultaneously. The standard funnel stops here; `0` briefs is compliant.
