# Source96 S5 RQ candidate

## S5-96-RQ01

- Seed: SC96-01.
- Exact public anchor: Erlang/OTP ERTS persistent_term API, current OTP 29 documentation (API version 17.0.3), accessed 2026-08-15.
- Stable object and guarantee: a fixed persistent_term key/value API; get/1 and get/2 return the exact stored term in constant time, with stock process-visibility semantics retained.
- Primary RQ: Can a target-native versioned-literal reclamation constructor replace the global update scan caused by persistent_term put/2 or erase/1 with a bounded-recourse update rule while preserving exact get results and constant-time lookup?
- In scope: a runtime-native algorithm and its update/read/memory guarantee for the fixed API.
- Out of scope: application-level caches, changing a value's visibility semantics, changing stored terms, generic RCU wrappers, or choosing when a user invokes put/2.
- Counterfactual consequence: frequent configuration/reference updates could have a bounded update/reclamation cost rather than the documented all-process scan, without weakening read semantics.
- Contribution hypothesis: METHOD_ALGORITHM, N2.
- FINER-lite: feasible CONDITIONAL (current source and a stock runtime oracle are publicly named); interesting CLEAR for BEAM applications with read-heavy state; novelty threat UNKNOWN; scope PASS; relevance CONDITIONAL.
- Precommitted source order: (1) official current ERTS persistent_term documentation; (2) official erlang/otp source at a deterministic released tag; fallback is the matching official generated API documentation only for transport failure.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
