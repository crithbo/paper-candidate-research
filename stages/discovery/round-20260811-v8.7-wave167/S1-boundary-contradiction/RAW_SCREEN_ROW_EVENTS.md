# RAW_SCREEN_ROW_EVENTS

| ID | Exact same-object contract | Minimal legal action-divergence witness | Outcome |
|---|---|---|---|
| R01 | A producer supplies an artifact and an SBOM access policy; a generator produces plaintext and redacted SBOM trees plus proofs; distributors relay; a consumer decrypts only authorized fields; a verifier checks tamper/sameness; KMS issues/revokes keys. Guarantee: composition/redistribution retains integrity, declared confidentiality, semantic confidentiality/collusion resistance and non-equivocation—not general SBOM completeness/accuracy. | Two admissible redactions may reveal different fields. The only immediately enumerable difference is policy evaluation/field encryption under the same generator/proof action. | `STRUCTURAL_DROP__POLICY_TUNING_OR_GUARANTEE_CHANGE` |

The paper's producer-to-generator-to-consumer/verifier flow and artifact source make this a closed current action surface, rather than Wave162's earlier unfrozen row.
