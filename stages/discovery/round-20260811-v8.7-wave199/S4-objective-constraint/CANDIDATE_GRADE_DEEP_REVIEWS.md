# Candidate-grade deep reviews

## R01 — Lean: `STRUCTURAL_DROP__CURRENT_PROOF_TERM_AND_DUAL_CHECK_UNION`

The fixed contract includes the trusted theorem statement, environment, serialized proof term, official kernel acceptance and—where selected—the comparator's external-checker acceptance. Lean's current source pipeline already comprises tactics/elaboration, kernel proof-term checking, serialization, and comparator replay by the official and external checker. A different tactic is producer selection; deleting information can alter elaboration/environment; using only one checker changes guarantee. Natural Lean theorem modules yield a route; the native oracle is the theorem plus dual check. Full cost is producer CPU/RSS, artifact bytes, build/export, official check and external check CPU/RSS/latency. A 72h killer would use 20 fixed theorem modules and fail if the new producer maps to existing elaboration/serialization or changes any checker acceptance. No union-external whole constructor is frozen.

## R02 — Rocq: `STRUCTURAL_DROP__CURRENT_CIC_PROOF_TERM_KERNEL_UNION`

The same object is a fixed CIC theorem accepted by the Rocq kernel. Tactics are explicitly untrusted producers of proof terms, while the kernel checks term type when the proof is closed/registered. Any proof sharing/compression that requires changing transparency, universes, theorem statement or trusted environment changes the guarantee; a tactic or flag choice is not a certificate constructor. Standard-library modules give a public route and kernel acceptance is the oracle. Full cost charges tactic/elaboration CPU/RSS, proof artifact bytes and kernel check CPU/RSS/latency. A finite killer replays the proposed term under the original environment and stops on checker mismatch or current-term encoding. Absorption is structural.

## R03 — Isabelle: `STRUCTURAL_DROP__CURRENT_RECONSTRUCTION_EXPANSION_REPLAY_UNION`

The fixed theorem is checked by reconstructing an implicit/full proof term and replaying primitive inferences in the kernel. Current operations include reconstruction, expansion of nested theorem bodies and `Proof_Checker.thm_of_proof`; these are the alleged certificate-size/check-cost axes. Omitting context or type/theorem information must still reconstruct under the same theory, otherwise it changes the certificate guarantee. Public proof-term examples form the natural route. Full cost includes producer/reconstruction CPU/RSS, proof-body bytes, expansion, primitive replay and latency. The 72h killer requires 20 fixed theories, exact theorem identity, and no replay by current reconstruction/expansion; no witness remains.

## R04 — Metamath: `STRUCTURAL_DROP__CURRENT_EXPLICIT_PROOF_DATABASE_VERIFIER_UNION`

The fixed object is a theorem in a fixed Metamath database accepted by its verifier(s). The current proof language records explicit steps and database references, while verifiers replay those stated steps without making logical inferences. A postprocessed proof stream, alternate checker, or theorem/database change is excluded; a different step sequence is the already permitted producer space. The Proof Explorer and independent verifiers give a public natural route and acceptance oracle. Full cost includes producer/search CPU/RSS, step/database bytes and verifier CPU/RSS/latency. A 72h killer checks exact statement/database/verifier acceptance and current language expressibility. No whole producer constructor outside the union is frozen.

All deep outcomes are same-object, current-union conclusions—not an inference from unavailable hardware, implementation, result, resource, or AI readiness.
