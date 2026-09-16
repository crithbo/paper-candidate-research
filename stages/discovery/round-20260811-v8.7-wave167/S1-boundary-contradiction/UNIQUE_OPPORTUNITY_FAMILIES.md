# UNIQUE_OPPORTUNITY_FAMILY — Petra confidential SBOM exchange

Exact object: one software artifact and its composed SBOM tree as it is generated, selectively redacted, redistributed, consumed, and cryptographically verified in Petra. Same-object function is confidential but verifiable SBOM exchange—not ordinary SBOM generation, a new metadata format, vulnerability scoring, policy deployment, or a different attacker/guarantee.

Current union is complete at the native protocol level: producer policy; generator plaintext/redacted tree production; CP-ABE-based selective disclosure; Merkle commitments and authenticated trees; sameness/membership proofs; distributor exchange; consumer key/decryption/query; verifier integrity checks; and Fulcio-backed KMS signing/redaction-key path. The public `SBOMCtl` source repository contains the prototype `privateSBOMExchange`; the Zenodo record identifies it as reproducible paper software.

Natural carrier: Zenodo's accompanying `bom-shelter` SBOM dataset and compositional package/SBOM trees stated by the paper. Native/formal oracle: proof verification, decrypted-field authorization, Merkle-root/sameness and non-equivocation checks, together with preservation of the artifact-to-SBOM composition relation. Full cost: SBOM-tree construction, commitment/encryption/proof sizes and time, key issuance/attribute handling, distribution/storage, consumer query/decryption, verifier work, policy update/redistribution effects, and normal supply-chain operation.

No union-external whole N1/N2/N3 action was frozen.
