# Mechanical intake

## Frozen inputs

| Package | Manifest entries | Mismatches | Manifest SHA-256 | Handoff SHA-256 |
|---|---:|---:|---|---|
| Initial Stage A | 17 | 0 | `2C67E5D16D99736631E58E713A473E0F1E63AF91790E09F3D05A2C9DED3A7A43` | `C7942144046BD53F7C8B8C77C5E1CBAD075D37F452C7573DE8FD5E0CE2566502` |
| Revision 1 | 17 | 0 | `3655AF4B3A3327C1C527895AD69B30DD30D03949B2652940A882F256F912F50E` | `CF153E8997FB8B76CF241EC41848EC1206CEF03406F0A53001C87F94CF15FB0B` |

The revision hashes exactly match the mainline delivery. Important sealed revision files also match the manifest:

- Contract: `DA677333B52750B7DAB196B867CA6754550AB1A6FD1F40610028676C571CDC89`
- Stage A report: `4AD391D391EE4DECF17101BF7881183C47DD7119104E853A52227D35B3902DF8`
- Results report: `8318441907E5A1EFE25718ECBC0061BF20A380E8150A4B97F20EDC4D3D36A0C5`
- User packet: `844D033F4203D92C4F35CE759D6F61CE3751946635E6388D348D359946F3DBBB`
- Raw natural source: `8301352A6B70D0D79BD0EEECFDFF39081E3F565B000CCABC8BA5CA63653B05D8`
- Locked projection: `5BC1E058CEC71BE79FD7097D815B3EA476F8D34513E6E5AB71E79ABEE2B20B1C`
- Run 1: `2E4C8C93AA479CDB4C0FE7CE9DD5871105B88479BED7219CABF791BF065A305B`
- Run 2: `398C56D029F96ECD1061B4321BE7FD16DF40301E4D48A76A11D7AD1B4D53ED4C`
- Validation: `6CFA6AB9F53E3541F2D99A3415B6BC930BCA8B8A399E8CD2958A832D07EDEF7A`

## Reviewer actions

The reviewer performed only read-only intake actions: byte hashing, manifest comparison, static source inspection, JSON field recomputation, semantic run comparison, source/projection consistency checks and an independent replay of the 81 serialized schedules. The reviewer did not execute `prepare_natural.py`, tests, `run_revision.py`, `validate_revision.py`, the candidate solver, a new research experiment or Stage B work.

No input was missing. The resource-blocker branch is therefore inapplicable.
