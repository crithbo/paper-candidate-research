# Discovery question cards

## QC-S74-01 — GNU Make implicit-rule-chain construction

- Exact public identity: GNU Make implicit rule search, official manual current online edition; checked 2026-08-15.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; a versioned GNU Make regression Makefile plus its declared filesystem snapshot would be required before any later execution.
- Same-object contract: fixed makefile/rules, target, variables and filesystem names; same selected recipe/prerequisite chain and update semantics. Changing recipe text, the target graph, rule order or build scheduling is outside scope.
- Contribution hypothesis: `METHOD_ALGORITHM`, N2; target-native rule-chain construction with an exact or bounded-cost derivation guarantee.
- Initial full cost: parsing/rule database construction, implicit search CPU/RSS, filesystem probes, selected chain length, and resulting build/update work. No measurements were run.

### Five-field identity preflight

Registry/plan surface checked 2026-08-15 with exact terms `gnu make`, `implicit rule`, `rule search`; no exact registered identity was returned. This is `NO_MATCH`, not a novelty or absence claim. The held/terminal identities named in the Source74 contract are different objects. No identity ambiguity was found.

### Minimum evidence and result

- ANCHOR/CURRENT: GNU Make official manual, “Implicit Rule Search Algorithm”. It specifies matching pattern rules, filtering, prerequisite construction, direct applicability, recursive chain search and first applicable result.
- Default/non-default union: built-in pattern/suffix rules unless overridden or cancelled; `-r/--no-builtin-rules` disables built-ins; makefile-defined rule order and `.DEFAULT` are part of the fixed object. These are current documented action/configuration inputs, not a claim that every source path was exhaustively enumerated.
- CONTRARY/direct absorption: the documented algorithm already operates on the complete fixed rule list, matches pattern alternatives, recursively establishes makeability and chooses the first applicable chain. A proposal to choose another chain either changes the rule-order-visible semantics or reduces to generic rule-chain/AND-OR derivation search, not a target-specific new constructor.
- Cheapest falsifier: a two-chain instance with the same selected observable rule chain but a claimed extra action. The manual's steps 2–8 either already cover it, or altering which applicable rule is selected changes GNU Make behaviour. This is a legal structural falsifier; it does not depend on implementation, results or resources.
- Direct-collision status: `DIRECT_FATAL__CURRENT_DOCUMENTED_UNION_PLUS_GENERIC_RULE_CHAIN_KERNEL` for the only RQ selected. Search boundary is official GNU Make documentation and bounded registry terms; no global novelty assertion.

### Disposition

- RQ audit: `RQ_COMPLETE`; RAW_REQUIRED: `INCOMPLETE` because the proposed target-specific non-generic discriminator fails.
- Front-end disposition: `EXCLUDED_BEFORE_RAW`.
- Reason: same-object alternatives are absorbed by the documented native implicit-rule procedure; any residue is generic derivation/search or changes rule-selection semantics. This is structural, not caused by missing source, implementation, resource, or result.
- C0/deep eligibility: NO. No closure queue is created because no missing public source is decision-critical.
