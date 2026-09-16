# Discovery log — Wave327 fresh end-to-end verified bottleneck-transfer breadth

## Freeze

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE327-FRESH-ENDTOEND-VERIFIED-BOTTLENECK-TRANSFER-BREADTH.
- Cutoff 2026-08-11; v8.7+R5-P0; DISCOVERY_QUALITY_MODE=OFF.
- Frozen controls: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan 38BBCA80B816879AF06494D2B826F19CB79063430E7F7B859E0F5871855D88F6; registry DDDA54F13B9A59949A5A65AD6F1E35D47C25C5203C55A2588555A5EA552B6761; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.

## Funnel: eight fresh end-to-end families

| Family | Fixed verified/equivalent object and oracle | Status |
|---|---|---|
| Android APEX package verification and mount | Fixed APEX payload, signatures, package identity and stock apexd acceptance/mount outcome. | Deep; NOT_ADMITTED_UNFROZEN. |
| TPM reference integrity manifest plus event-log replay | Fixed RIM, ordered event log/PCR quote and verifier result. | Deep; NOT_ADMITTED_UNFROZEN. |
| UEFI/PC firmware measurement event-log verification | Fixed boot measurement sequence, PCR reconstruction and verifier outcome. | Deep; NOT_ADMITTED_UNFROZEN. |
| Linux IMA appraisal/load | Fixed measured file/signature and kernel acceptance. | Raw; action union not closed. |
| UEFI Secure Boot authenticated variable update | Fixed authenticated payload and firmware acceptance. | Raw; no legal witness. |
| OpenPGP signed release verification | Fixed release bytes/signature/keyring and verifier result. | Raw; no whole action. |
| Sigstore bundle verification | Fixed artifact digest, certificate/rekor bundle and verifier result. | Raw; action domain unclosed. |
| Python package wheel RECORD verification | Fixed wheel contents/RECORD and installer result. | Raw; source/action union unclosed. |

## Deep audits

### Android APEX

AOSP states the APEX file format is signed with APK Signature Scheme v3. The exact APEX package and mount/verification behavior make the signed bytes and signature representation part of the object. Repacking, reordering payload, changing signing block, changing verifier or applying an external materialization wrapper changes the guarantee or object. No stock-accepted two-package action witness with a target-specific joint constructor was frozen.

### TPM RIM/event log

TCG defines RIM information and an ordered event log whose hashes extend PCRs; a verifier validates quote/log/reference information. Event ordering is itself integrity-relevant. Any action that changes ordering, records, digest representation, quote/replay verifier or reference data changes the attestation guarantee. No union-external construction action beyond generic log packing/cache was frozen.

### Firmware measurement event log

TCG firmware measurement material similarly requires order-aware event logging and PCR reconstruction. The bottleneck may migrate from measurement to replay/verification, but a changed layout or batching without a stock verifier guarantee changes the event-log object. No target-specific N1/N2 action and proof was found.

## Finite carrier, full-cost, killer

Future finite carriers are version-pinned AOSP APEX fixtures and public TCG RIM/event-log conformance artifacts, 20–50 bounded cases. Stock oracles are apexd verification/mount and TCG verifier/PCR replay. Full cost includes producer/signing CPU-RSS-temp-bytes, transfer/materialization, verification/replay CPU-RSS, cold/warm mount/query and stored bytes. Within 72 hours fail closed if any action changes signed/digested/ordered representation, stock verifier or guarantee, or is only generic packing/cache/transport wrapper/scheduler/flag.

## Decision

COMPLETE_ZERO_PROPOSALS. Three deep lines are NOT_ADMITTED_UNFROZEN; five remain raw. This is not an implementation/result/resource/AI-readiness decision and not a terminal STOP.
