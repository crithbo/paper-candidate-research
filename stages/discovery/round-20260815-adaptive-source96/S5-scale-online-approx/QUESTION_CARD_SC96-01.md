# DISCOVERY_QUESTION_CARD — SC96-01

## Identity and contract

- Exact public identity: ERLANG_OTP_PERSISTENT_TERM_EXACT_CONSTANT_LOOKUP__VERSIONED_LITERAL_RECLAMATION.
- Project/version/date: Erlang/OTP; official API documentation for OTP 29.0.3 / ERTS 17.0.3, accessed 2026-08-15. The source-closure target is official erlang/otp tag OTP-29.0.1 (2026-05-27) under the single frozen project rule.
- Carrier kind: IMPLEMENTATION_CARRIER_ONLY. A natural deployment trace is a bounded later debt, not asserted to be available now.
- Network-security exclusion: PASS.
- Five-field identity preflight: object NONE, action NONE, endpoint NONE, guarantee NONE, full-cost boundary NONE against the locally searched registry surface. No-match is not a novelty or absence claim; broad runtime/cache similarity is RELATED_ONLY if encountered.

## Problem and insight

- Problem: persistent_term gives constant-time reads, but an update/delete of a non-immediate prior term invokes a global garbage-collection pass that scans processes and may copy retained terms; this matters for otherwise read-heavy state with online updates.
- Proposed insight: a research contribution may exist through a BEAM-native versioned-literal reclamation action, distinguishable from a controller because it changes the runtime's reclaim/ownership transition while preserving the API's exact read value and constant-time lookup boundary.

## RAW_REQUIRED evidence

- Same-object estimand: exact results of get/1 and get/2, including stock missing-key behavior, for the fixed persistent_term API.
- Claim endpoint: target-native bounded-recourse runtime update/reclamation guarantee, conditional on later source-level legality closure.
- Current official locus: OTP 29 persistent_term API documents constant-time lookup, fast equal-value put/2, global GC after replacing/deleting a previous term, the special immediate-term deletion case, and the +MIscs literal-area setting.
- Strongest immediate objection: the all-process scan may be inherent to safe reclamation of values held on process heaps; an epoch/indirection proposal may merely be a generic RCU wrapper or may trade an unbounded memory backlog for scan work.
- Non-generic discriminator: candidate action must specify BEAM literal/process-heap ownership and an exact reader-observable equivalence rule; a generic update scheduler or cache policy fails the card.
- Initial full-cost boundary: update CPU/latency, scanned or deferred process work, old-literal memory residency, peak RSS, literal allocator area, exact lookup cost, and recovery/termination semantics.
- Minimum falsifier: official current source shows an existing native versioned/deferred-reclamation action expressing the same transition, or any bounded variant necessarily changes exact lookup/visibility semantics or leaves unbounded retained literal state.

## Debt and disposition

| Debt | Status | Finite route / consequence |
|---|---|---|
| Complete source-level current union | OPEN_BOUNDED | Inspect one official project/tag for the persistent_term BIF, literal allocator, global-GC trigger, and +MIscs-related configuration. If native union already has the transition, direct subtract. |
| Current flags/config | OPEN_BOUNDED | Enumerate documented default/non-default controls; docs currently identify +MIscs only as reserved literal virtual address, not an update-reclamation action. |
| Small legality witness | OPEN_BOUNDED | Two-process hold/update/read trace against stock semantic oracle; Stage 0 or Stage A preclaim owner. |
| Natural carrier | OPEN_BOUNDED | Versioned public Erlang application configuration/reference update history; implementation-carrier ceiling remains until selected. |
| Current collision/genealogy | OPEN_BOUNDED | One bounded primary-paper/current-runtime contrary route; no global-first claim before it closes. |

- RQ audit: RQ_COMPLETE.
- RAW_REQUIRED audit: COMPLETE.
- Closure debt: OPEN_BOUNDED.
- Front-end disposition: EVIDENCE_QUALIFIED_RAW.
- Eligible for C0: YES, but not for a Stage 0 brief in this assignment.
- Claim ceiling: raw mechanism hypothesis only; no novelty, Q2, bounded-update, or performance claim.
