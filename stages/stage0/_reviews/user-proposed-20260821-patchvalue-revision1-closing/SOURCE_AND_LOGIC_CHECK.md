# PATCHVALUE Revision1 Closing — Source and Logic Check

## Scope

- Assignment: `STAGE0-C2R1-20260822-PATCHVALUE-COUNTERFACTUAL-REVISION1-CLOSING`
- Network routes used: `0`
- Persisted new resource bytes: `0`
- Search status: inherited `SEARCH_BOUNDED_OPEN`; no absence inference.
- Review mode: independent static re-review of frozen revision1 against prior confirmation and PRIMARY.

## Frozen package integrity

| Package | Handoff SHA-256 | Manifest SHA-256 | Canonical validation |
|---|---|---|---|
| Revision1 | `B8E71202F4EDDEE48E2ECD4869D7253E280C613739D6D5104AC07FE4ACBBDB7E` | `9B41F0F9B4F60714F8F4739C60A8C2460C6DA7765EE476932C220E389D0800F2` | `8/8 PASS` |
| Prior confirmation | `3F0C1F786F2C5FB37E1EF772A9E53F057419A1CD4F1240FAA1047F3C1E633F25` | `F3C003FBFA1287541635DEA7C2A393458E30AF157694532CF0ED782C49241350` | `4/4 PASS` |
| PRIMARY | `7D2B39D18820EE840892D2E118A16DCA2B16E94FCD8D509186B5A48EABA8DB4E` | `D04BFEFA3C49051A0278B343CACAA73061199ED085F97B50B8F4B7F3215AF60F` | `11/11 PASS` |

Revision1/PRIMARY manifests contain two comment metadata lines; these are not hash entries. Every canonical hash entry matches.

## Source-to-claim consistency

| Claim | Frozen evidence | Closing result |
|---|---|---|
| Current native fork copies conversation/event/agent state | Prior confirmation's independent official-doc/source check | Consistent; correctly treated as baseline. |
| `LocalConversation.fork()` shares workspace | Prior confirmation's independent official-source check | Consistent; establishes a fidelity gap, not novelty by itself. |
| Current native catalog is complete | Revision facet matrix lists only conversation fork, local fork, state persistence and BaseWorkspace | Not established; no exhaustive pin/current symbol map or explicit remote/server/navigation exclusion. No absence inference made. |
| CAR is confined to historical attribution | Prior confirmation records state-level `do_action/do_context/do_policy` plus forward replay | Inconsistent/over-narrow; future stop/continue policy is not excluded from CAR's intervention family merely by occurring after the prefix. |
| FailFast and agentic-scaling locator corrections | Revision source correction log inherits prior independently resolved identifiers | Mechanically consistent; no effect on the closing failure. |

## Exact-treatment proof

Frozen treatment: `do(N=h)`, where `N` is completed future native LLM calls.

Revision treatment: assign a cap/grant `G=h`, retain native terminal at `N<h`.

If `P(N<h | G=h)>0`, then `E[Y|do(G=h)]` is not `E[Y|do(N=h)]`. Retaining terminal outcomes prevents outcome deletion but identifies the ITT of `G`, not the per-protocol exact dose `N=h`. Revision1 supplies no compliance/principal-stratum identification and may not change the frozen treatment. Result: `NONIDENTIFIED_BRANCH_EFFECT`.

## Bound recomputation

For independent `Z_r∈[-1,1]`, Hoeffding gives

`P(E[Z]-mean(Z) >= epsilon) <= exp(-R epsilon^2 / 2)`.

Thus a one-sided Bonferroni lower bound over a pre-fixed family of size `m` may use

`mean(Z)-sqrt(2 ln(m/alpha)/R)`.

Revision's `sqrt(2 ln(2 n |H|/alpha)/R)` is conservative if `|H|` denotes a finite pre-registered horizon set. It does not fail because of arithmetic. It fails the atomic gate because:

1. that horizon set is not defined and `H` is overloaded with the evaluator;
2. it is a generic bounded-mean result;
3. no bound covers cost vectors or comparator dominance;
4. no mathematical Pareto/frontier relation is specified.

Therefore the phrase `simultaneous_lower_confidence_frontier_with_full_branch_cost` is unsupported by the actual property.

## Static checker audit

Named inputs and expected strings are present, but the following executable-static elements required by the frozen revision assignment are absent:

- versioned manifest schema and required/optional types;
- canonical serialization and content-hash algorithm;
- reset transcript grammar, command ordering and post-reset equality test;
- writable-alias discovery across worktree, process, tool service, model session and evaluator cache;
- fail-closed handling of unenumerated external mutable parents;
- cost-unit schema, completeness rule and cost/frontier validation.

This finding blocks PASS but is not used alone as a scientific STOP.

## Decision test

| Allowed closing decision | Test | Result |
|---|---|---|
| `CONFIRM_PASS_RECOMMENDED` | all five conjuncts statically closed | `NO` — C3/C4 fail; C1/C2/C5 incomplete |
| `DISAGREE_STOP__FAILURE_SENTINEL_TRIGGERED` | direct CAR relabel or nonidentified branch effect | `YES` — both branches triggered |
| `DISAGREE_INCONCLUSIVE_POLICY_HOLD__REVISION_CONSUMED_NO_VALID_PASS_OR_STOP` | no valid PASS and no scientific STOP evidence | `NO` — formal negative evidence is present |
| `PROVENANCE_FAIL` | frozen decisive inputs cannot be trusted | `NO` — hashes and canonical entries validate |

