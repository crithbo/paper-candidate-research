# Provenance Audit

## Mechanical package integrity

All assigned manifests recomputed without mismatch:

| Package | Result | Manifest SHA-256 |
|---|---:|---|
| Discovery | `4/4` | `6A4C17A10A9D40EE50BA676934B7FB5B62A7F60F2ABF8F5E3199851D182238FB` |
| Stage 0 primary | `4/4` | `B378CE5E508338BB37E2F8DE6E068908A63E38BCA244B80CE4285B7FB3116A88` |
| Stage 0 confirmation | `2/2` | `5F44B00EA2A354BDB67C233F2E0042A12FEF089D600C312A066FAAC820968128` |
| Initial Stage A owner | `28/28` | `8A06B69DB8265045DD86EC6492C5A54A5AA4508EC8FA3A68EF9363A19A4F3BB7` |
| Initial independent gate | `8/8` | `5C3B6FAA4BB51693A647F97F8725FECA7EC12A56E53426A00E190AB20E75694B` |
| Revision 1 owner | `18/18`, no extra | `BCDFD4061D2E118C9D5C7C32A043340CF998F1193EBBFB5262BE5C4263A86AF6` |

Revision key files also match mainline:

- `handoff.yaml`: `997D20A36DEBA8B92B0753AF9BD00A637A5FE12EE8645264155D98AF80B8F9A3`
- `STAGEA_REPORT.md`: `D76C27DFCFD8CC7E1D3A0DAF56DFE5B8A665239345C032D4ABC93E188727A89D`
- `HASH_MANIFEST.sha256`: `BCDFD4061D2E118C9D5C7C32A043340CF998F1193EBBFB5262BE5C4263A86AF6`

## Parent-hash discrepancy

The revision contract and handoff declare:

- parent handoff `62962479FD59BD7347A5C5AB142F7506B7529F7BF5D9DA0762C8872DA7FC9A11`
- parent manifest `8A06B69D074DA30278BC3513564961F7C45B6FB2CF3F6644256F8F5AD1A03BB7`

The frozen initial files actually hash to:

- parent handoff `62962408DEEE87A64E5E3FC12833FB9C926B43425640298E930DB4E7FAFB4A11`
- parent manifest `8A06B69DB8265045DD86EC6492C5A54A5AA4508EC8FA3A68EF9363A19A4F3BB7`

Disposition: `LABEL_COPY_ERROR__SCIENTIFIC_INPUT_PATH_CLOSED`.

This is not an execution-input conflict. Static tracing shows that `run_revision_probe.mjs` reads the initial `results/primary_stable.json` from the exact parent directory, requires file SHA-256 `C4FB253A84F118D828CDACCF7E5F8024EA5FA939C1CD79C86EFBBDE64D942F6E`, recomputes the object selection and initial page assignment from the frozen trace, and requires exact equality with each parent epoch. Independent comparison confirms all three selections and initial-page fields are identical. The revision trace is also byte-identical to the parent trace at `E5D16D849BCD2E015C5E54A161E202241E7B7D25696F4055C742D51649DDF2A8`.

The two incorrect parent labels are never read or checked by the executable and do not select data. The revision result embeds the actual contract hash `86A55019EC2A55B8F1ACC83EDC2359E3D01FAED57D11CE3C0419C16EBEF389A4` and the correct parent stable hash.

## Finite non-scientific closure

Mainline may close the package defect without rerunning the probe and without consuming another scientific revision by recording a hash-signed provenance corrigendum that:

1. lists both erroneous declared values and both actual parent values above;
2. attests that the only claim-bearing parent artifact read was the correctly hashed `primary_stable.json` plus the correctly hashed trace;
3. attests that all three parent selection/layout comparisons passed;
4. leaves every frozen owner file unchanged and links this independent audit.

This mechanical closure does not cure the separate scientific defects in the closing review and therefore cannot by itself authorize `STOP`.

