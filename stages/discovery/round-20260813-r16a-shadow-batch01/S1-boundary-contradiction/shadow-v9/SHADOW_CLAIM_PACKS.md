# V9 shadow claim-pack comparison

Noncanonical artifact. Input is exactly `../neutral-source-snapshot/`; canonical manifest `1C95762FDA63B37D9628F91948AB47823994D0F5C4C949ACE6838CAF32B18E80` was frozen before this file.

| Family | V9 claim-pack audit coordinates | Shadow disposition | Source/action correction relative to canonical |
|---|---|---|---|
| F01 CPython import | `A1_OPEN_WITHIN_EVIDENCE`, `C0_DIRECT_COVERED`, `D2_DECISION_READY_FACETS`, `E1_STATIC_PREFLIGHT` | `SHADOW_DROP` | V9 makes the existing loader's preinsert/remove behavior explicit as all eight direct-coverage predicates for any proposed atomic-publication action; canonical already dropped it. |
| F02 glibc dlopen | `A1_OPEN_WITHIN_EVIDENCE`, `C0_DIRECT_COVERED`, `D2_DECISION_READY_FACETS`, `E1_STATIC_PREFLIGHT` | `SHADOW_DROP` | V9 names the reserve-before-constructor/update-after-constructor construction and recursive pending-add accounting; canonical already treated it as direct absorption. |
| F03 Rust Once | `A1_OPEN_WITHIN_EVIDENCE`, `C0_DIRECT_COVERED`, `D2_DECISION_READY_FACETS`, `E1_STATIC_PREFLIGHT` | `SHADOW_DROP` | V9 separates the state-machine guarantee from application closure choice; no nontrivial mechanism survives. Canonical unchanged. |
| F04 robust mutex | `A1_OPEN_WITHIN_EVIDENCE`, `CU_UNKNOWN`, `D1_BASIC_MATERIALS`, `E1_STATIC_PREFLIGHT` | `SHADOW_NOT_ADMITTED_UNFROZEN` | V9 exposes the missing application invariant, natural carrier, comparator, and direct-coverage predicates. It does not interpret incompleteness as a structural negative. Canonical unchanged. |

There is no shadow brief, no shadow `PROPOSE_STAGE0`, and no shadow material may enter a Stage 0 packet.
