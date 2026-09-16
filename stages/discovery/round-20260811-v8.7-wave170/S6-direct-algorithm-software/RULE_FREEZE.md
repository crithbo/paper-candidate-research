# Rule freeze

- assignment: `DISCOVERY-S6-20260811-V8.7-WAVE170-ELF-GNU-HASH-DYNSYM-JOINT-CONSTRUCTOR-DEPTH-REDTEAM`
- rules revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`
- `DISCOVERY_QUALITY_MODE=OFF`; frozen date 2026-08-11.
- Object: fixed exported symbols, versions, visibility/binding and dynamic-loader resolution semantics. Legal internal `.dynsym` permutation is allowed only when every symbol/version/relocation reference is consistently updated. Generic hash tuning, postprocessing, export-interface change, external compression and generic ILP are excluded.
- Static review only; no DSO build/load/lookup experiment was executed.
