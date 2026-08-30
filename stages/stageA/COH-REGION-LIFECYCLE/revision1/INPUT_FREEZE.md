# Frozen-input verification

- Verification result: `PASS`
- Fail-closed triggered: `false`
- Candidate manifest: `17/17` entries matched
- Gate manifest: `8/8` entries matched

| Required frozen input | Recomputed SHA-256 | Expected-by |
|---|---|---|
| `../handoff.yaml` | `42E2DB9DC82DAA1BDB07D687A1991939167F31F69713F2C8CC7828ECF44CAB31` | registry, candidate manifest, gate handoff |
| `../STAGEA_REPORT.md` | `D6D813D4E5E26143D7924A4D644A8ED91D14001F04A1543D8FFFDF6213AC8424` | registry, candidate handoff/manifest, gate handoff |
| `../USER_REVIEW_PACKET.md` | `F400D3E34FB661754A783F593368E50BDD8284B5A59FE0C9663EE643787064DC` | registry, candidate handoff/manifest, gate handoff |
| gate `handoff.yaml` | `02324399A1DFBE7A51C41B886655AF3846B6B973E9FD8223F3FFDEFFAA91741C` | gate manifest |
| gate `GATE_REPORT.md` | `8733C16290079D148BD6D64FFDD329EDE4A4334AA794808E2BB19A768E1E0B21` | gate manifest |
| gate `HASH_MANIFEST.sha256` | `05D88467E190D438B2E0F8CFB661563198E7717CEC3902FBE7281150A818B119` | delivered frozen package hash recorded by this assignment |

Additional candidate manifest SHA-256: `5A8322590B24D9B0C53A4F93A06E1E2895830722047202EEA16D8B863816E513`.

No initial candidate or gate file was modified.

