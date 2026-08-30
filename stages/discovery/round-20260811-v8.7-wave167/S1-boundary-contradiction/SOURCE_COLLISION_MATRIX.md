# SOURCE_COLLISION_MATRIX

| Required surface | First-party evidence | Frozen consequence |
|---|---|---|
| Roles and threat/guarantee | [Petra paper §§3--4](https://www.usenix.org/system/files/conference/usenixsecurity26/sec26_prepub_ishgair.pdf) | Producer, generator, distributor, consumer, verifier and KMS roles; integrity/confidentiality/sameness/non-equivocation boundary. |
| Whole construction | [Petra paper §§4--7](https://www.usenix.org/system/files/conference/usenixsecurity26/sec26_prepub_ishgair.pdf) | SBOM tree, CP-ABE selective redaction, two Merkle passes, proof verification and key paths are native union actions. |
| Public artifact | [Zenodo v1](https://zenodo.org/records/17906622) | Open, reproducible evaluation artifact; links `TSELab/SBOMCtl`. |
| Current source | [SBOMCtl main](https://github.com/TSELab/SBOMCtl) | `privateSBOMExchange` is the current prototype implementation; Apache-2.0; not production-ready. |
| Direct subtractor | Petra's own complete policy/redaction/proof/KMS mechanism | Absorbs policy choice and wrapper/controller variants. |

Latest bounded collision: no post-paper first-party source was found in the exact Petra object that introduces a separate same-contract whole action. This is not generalized into an absence claim.
