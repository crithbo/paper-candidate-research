# Rule Audit Report

## Identity and scope

- `audit_id`: `RULE-AUDIT-20260813-R11A-R13B-BATCH02-PARTIAL-PREFLIGHT-RECOVERY-R15`
- `status`: `USER_POLICY_DECISION_REQUIRED`
- `recommended_option`: terminate Batch02, charge/quarantine issued Request1, invalidate unissued Request2, and move to original Batch03 only after explicit approval and a mechanically proven structured-transport gate
- `shared_files_modified`: `false`
- Candidate identities, returned content, private denylist/plaintext, outcomes and scientific evidence were not read. No retrieval, PACKER contact or downstream run occurred.

## Frozen evidence

- Blocker: `R14A_BATCH02_PROVIDER_RETURN_ORDER_UNOBSERVABLE_BLOCKER.yaml`, SHA-256 `D68E513B15293B0D535704E323E831122C484B6257A6FEA65AF9CD19A5BC7DCE`.
- R14A implementation manifest: `A1382A6ED09F21A0018607790414D74973C041195F81635CC1142DD4571BE4ED`.
- R14A supplement: `05E426CA5E309564F929CF78B590AC3086D802513904667DB9CC7F5224FFB178`.
- R13B rolling control: `2861E3D439BFCDDA8D9AB615D112FB9929C34F91C1D8B1BBCFBF082092A4D176`.

Request1 reserved and consumed 12 raw slots. Its three-query web call returned a combined unstructured text stream without observable query boundaries, provider-row ordinals or a machine-readable `ref_id/title/url` row collection. Request2 was not issued. There was no order freeze, semantic filtering, identity hash, commitment, private intersection, qualification or scientific inference.

## Exact counters and reachability

- Before Request1: raw used/remain `44/44`.
- After permanently charging Request1: raw used/remain `56/32`.
- Unique used/remain stays `4/68`.
- Eligible stays `2`.
- Request2 consumes `0`, because it was not issued; invalidating its reservation does not restore or consume raw.
- If Batch02 is closed, original Batch03 and Batch04 remain, with original raw caps `24` and `12`, but both are constrained by global raw remaining `32`. If Batch03 consumes 24, Batch04 can consume at most 8.
- Blind core 24 remains arithmetically reachable because `eligible 2 + remaining raw 32 = maximum 34`; this is only an upper bound and gives no yield guarantee. A 30 pool is also arithmetically possible. A 36 pool is no longer arithmetically possible under current counters.

## Least-privilege options

| Option | Finding | Decision |
|---|---|---|
| Continue the remaining 12 Batch02 slots through three single-query calls of four slots | A single query restores a query boundary, but the current web-search tool contract still does not guarantee a machine-observable ordered row array or required fields. It would also change the frozen Request2 call shape. | Reject now; necessary conditions are not proven. |
| Use a deterministic local call to Crossref, OpenAlex or arXiv | Such endpoints may conceptually expose JSON/Atom rows, but no current frozen tool/endpoint/schema/version/order/parser contract was available without retrieval. R14A froze the Codex web-search route and forbade substitution/new services. Crossref/arXiv may be potentially compatible with Phase1 source categories; OpenAlex scope is more ambiguous. None is currently proven callable under the frozen contract. | Do not authorize or assume in R15. A later route qualification must establish authority and mechanics before any call. |
| Close Batch02, quarantine issued Request1, invalidate unissued Request2, move to original Batch03 | Selects no failed output, preserves all consumed cost, does not transfer unused Batch02 capacity, and retains arithmetic reachability of core 24. | Recommend, with fresh user approval. Batch03 remains non-dispatchable until the structured-transport gate passes. |
| Terminate R13B | Fully safe and bounded. | Fallback if the user does not approve recovery or no structured transport can be proven. |

## Structured-transport gate for any future Batch03 call

Single-query-per-call is necessary but not sufficient. Before reserving or issuing any Batch03 raw slot, mainline must freeze and mechanically validate all of the following without reading candidate semantics:

1. One literal query per call; the query text/hash, provider/endpoint identifier, parser version/hash, sort/order parameters and row limit are frozen before the call.
2. The callable contract explicitly yields a machine-observable ordered row collection, not a prose rendering or combined stream.
3. Raw response bytes are frozen append-only before parsing, filtering or model exposure; transport response SHA-256 and byte count are recorded.
4. Each row is mapped mechanically by `request_ordinal → provider_row_ordinal`, with stable locator/provider id, title and URL. No inferred boundary or model-created row order is permitted.
5. Each call is separately reserved before issue. Suggested shape for Batch03 is at most six calls × four slots, but only if the proven transport supports it; issued slots are consumed even if fewer than four rows return.
6. Duplicate/unhashable/ambiguous handling, normalization, cross-batch dedup, opaque commitment, private intersection and qualification retain the R13B order.
7. A tool contract that returns only `unknown`/rendered text fails this gate. Merely observing that one prior response looked ordered is insufficient.
8. An official/public API route may pass only if mainline proves it is already inside Phase1 authority and is not a new service/install/download authorization. Any ambiguity requires a new user decision; no endpoint is implicitly approved by this report.

## Recommendation and rollback

Decision: `USER_POLICY_DECISION_REQUIRED`.

The R14A approval requires a new user decision after any new raw activity. Adopt the exact R15A wording in this package. Mainline may then create additive aggregate quarantine/counter/Batch02-closure/Batch03-pending-gate artifacts. It may not dispatch Batch03 until the structured-transport gate passes.

Rollback before a Batch03 call means revoke/withhold its resume gate and remain blocked with raw `56/32`. After any later issued call, all bytes and counters remain append-only and consumed; rollback never restores capacity. Any unknown order, schema, authority, collision, leakage or counter inconsistency fails closed without scientific inference.

No scientific/statistical gate, total/per-batch cap, budget, blind rule, Phase2/downstream authority, OFF mode or production state changes.
