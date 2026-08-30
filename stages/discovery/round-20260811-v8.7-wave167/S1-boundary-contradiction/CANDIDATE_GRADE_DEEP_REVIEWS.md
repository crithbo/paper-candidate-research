# CANDIDATE_GRADE_DEEP_REVIEW — Petra

## Current contract and source union

The paper precisely separates the roles: producer authors the policy; generator creates and preserves it while generating SBOMs; distributor stores/relays; consumer obtains authorized fields; verifier checks generator correspondence and artifact composition; KMS handles key generation, onboarding, distribution, revocation and expiration. Implementation includes an ecosystem-agnostic generator, client query/proof-verification tool, a separate Merkle-tree verifier and a Fulcio-backed KMS. `SBOMCtl` currently names `privateSBOMExchange` as its privacy-preserving SBOM prototype. These establish the complete same-information comparator.

## Witness and action-gap test

Witness: a field can legally be visible to one authorized consumer and redacted for another. The producer's policy and CP-ABE attributes select that view; the verifier checks the same redacted-tree/proof contract. Choosing another visibility rule, encryption attribute or key distribution is policy tuning/deployment control inside the frozen union, not a whole action.

The apparent alternative—semantic-aware redaction that preserves a new notion of SBOM utility—is expressly a future extension in the paper and cannot establish current absence. More importantly, it changes the frozen function from cryptographic integrity/confidentiality of selected fields to an additional semantic-utility guarantee. A new format/vulnerability ontology similarly changes object/guarantee. Thus neither supplies an admissible same-object N1/N2/N3.

## Finite StageA falsifier (not run)

If a later proposal claims an allowed action, within 72h freeze one natural composed SBOM from the public carrier and the exact policy/attribute set; construct the claimed redacted and plaintext trees; use the native proof/decryption/verifier oracle; charge all generation, CP-ABE, Merkle/proof, KMS, storage and consumer costs. Reject if it is expressible by policy/attribute choice, fails proof/sameness/non-equivocation, or requires an additional semantic/threat guarantee. No artifact download, execution or benchmark occurred here.

## Decision

`DROP__POLICY_TUNING_OR_GUARANTEE_CHANGE`; zero brief. This is a structural decision, not a readiness/resource decision.
