# CASE-D — blind executor record

Assignment: `BACKTEST-EXECUTOR-L1-20260814-RQ-REFINEMENT-STAGED-EVIDENCE-V1`  
Cutoff: `2017-11-30`  
Final decision: **DROP**

## 1. Non-evidence seed pool and pre-evidence convergence

| Seed | Engine / perspective | Conclusion-first test (not evidence) | Pre-evidence state |
|---|---|---|---|
| D-S1 | Boundary / compiler-backend engineer | A compilation-scope action might alter the implementation of graph operations without altering graph semantics. | Retain for one bounded coverage check. |
| D-S2 | Problem reframing / operator | Fine-grained compilation scope could be a concrete action rather than a global backend choice. | Merge with D-S1. |
| D-S3 | Negation / maintainer | If the cutoff API already exposes compile enablement, selective matching, and gradient scope, an action-gap premise fails. | Preserve as precommitted falsifier. |
| D-S4 | Contradiction / measurement reviewer | A release date and source entry together can disprove a putative API absence. | Preserve as precommitted falsifier. |

Coverage advisory: `PASS`. No conclusion about absence was made during seed generation.

## 2. Same-object RQ versions frozen before evidence disposition

All versions hold the same dataflow graph semantics and compiler-scope contract fixed.

| Version | Same-object RQ |
|---|---|
| D-RQ1 | Does the cutoff framework lack a scoped action to enable or disable compilation for graph operations? |
| D-RQ2 | Does the cutoff framework lack a selective compilation-scope action that preserves graph outputs while controlling gradient scope? |
| D-RQ3 | Can a distinct same-semantics compilation-scope action be defined after accounting for the native configuration interface? |

Selected: **D-RQ2**, because it has an immediate, inexpensive direct-coverage falsifier. FINER-lite: feasible `CLEAR`; interesting `CONDITIONAL`; novelty threat `HIGH`; ethical/scope `PASS`; relevant `CONDITIONAL`. This is not a score and did not admit the item to raw.

## 3. Evidence disposition and hard-gate result

| Locator | Local supplied material | Effect |
|---|---|---|
| D-L1 | `sources/E01.md` | Documents the graph framework and heterogeneous deployment context. |
| D-L2 | `sources/E02.py` | Exposes a scoped experimental compilation action with enable/disable, callable selection, and separate-gradient controls. |
| D-L3 | `sources/E03.json` | Dates the official release before the cutoff. |

The native source in D-L2 directly expresses the alleged action space, and D-L3 establishes temporal availability. This is a known `DIRECT_FATAL`, not missing documentation or a closure debt. A renamed annotation, configuration wrapper, selector, or convenience interface would retain no non-generic same-object residual.

Question Card audit: RQ audit `RQ_COMPLETE`; RAW_REQUIRED audit `INCOMPLETE_BY_DIRECT_FATAL`; closure debt `STRUCTURALLY_UNCLOSABLE`; front-end disposition `EXCLUDED_BEFORE_RAW`; eligible for C0 `NO`. Source-closure queue `NOT_NEEDED`. Final decision is **DROP**, with no Stage 0 handoff. This does not make any claim about a later target or outcome.
