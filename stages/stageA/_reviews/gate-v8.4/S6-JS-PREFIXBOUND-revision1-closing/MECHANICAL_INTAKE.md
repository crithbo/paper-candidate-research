# Mechanical Intake

## Scope and authority

- Assignment id: `STAGEA-G2-20260809-S6-JS-PREFIXBOUND-R1-CLOSING`
- Topic id: `S6-JS-PREFIXBOUND`
- Read scope: latest project entry files, Stage A reviewer rule, academic-research-suite instructions, and only this topic's discovery/Stage 0 lineage, initial Stage A package, initial gate, and revision1 package.
- Write scope: this closing-review directory only.
- Candidate run: `false`
- Stage B run: `false`
- Network dependency for closing: `false`
- Blocker: `none`

## Independent hash intake

| Package | Manifest entries | Verified | Missing | Mismatch | Manifest SHA-256 | Handoff SHA-256 |
|---|---:|---:|---:|---:|---|---|
| Initial Stage A | 13 | 13 | 0 | 0 | `536A2B96A2216EA8525C6EBEBC9ED5AB3F51C60475611BD97BE4FCEB5323C5ED` | `7E5F1C6B76714F3817DD348B1C57A70D6EFFCF9E9EC795E5D6F242E3FE7404F8` |
| Initial independent gate | 7 | 7 | 0 | 0 | `DF2705EAB4683D4848041C68FD258FFAE33994A1F0C49B1333733E36FDE4553F` | `9C43D3BF0C652BAE44A1B1D7C0B8D1B4C37BC4D98E5F772E00C64496B2D6A654` |
| Revision1 | 12 | 12 | 0 | 0 | `0F3D3515ADCFD6DF110E0A2C3421895518B6AFF0501BC4EF91875FFAD0A1C36A` | `73B1A6DFC20B3862299C59B454D1B416E8B55C2B05EE2AABD2779AB6E6F2652B` |

The two revision hashes match the values supplied by mainline.

## Frozen-input checks

- Revision contract SHA-256: `3F0C3E5C169060E3B3CCD1281972141F93E6A78894E670CF0287B23741310EBD`
- JOB 4a input: `450 B`
- JOB 4a SHA-256: `C80E515F37A633ADCA3AB45BBD5CBA20E760C80A71D7841B51E64154B1008065`
- Frozen formal-family size: `19,440`
- Primary and replay JSON: exact equality after removing only the six preregistered wall/CPU/peak fields.

The reviewer did not rerun `run_revision.py` or `validate_replay.py`; the intake is a static source/artifact and independent recomputation audit of the already completed runs.

