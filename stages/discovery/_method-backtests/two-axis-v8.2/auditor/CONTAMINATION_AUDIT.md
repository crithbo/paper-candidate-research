# Contamination and integrity audit

## Recomputed frozen-file hashes

All supplied PACKER and EXECUTOR manifest entries match the on-disk SHA-256 values: sealed manifest `249EEEE1371293218575DBFE6BFECF07CD4B0F3655F49E4163AF8AA60F32900D`, sealed packets `FF85DD0DFF5E537CFD9010E1AD2443F77D15E9782F7F39EFD55BEC4BDE0E806F`, auditor key `C7FC104DA1ACB92BB9F6BC80DE837DD558D50FC107E5AD054C2470DE61C62014`, executor results `1AC48E83002D04534ED20437CFA5ECB6EB9EB05887E4F2861CA6585EF6983804`, executor report `A53FB83FF9D206B0C69E274709A13E67F61703C711D1D7CDEC059727FC531AC7`, method output `310FE6978FC0D4738964C6B12EA86DB46C58E3C9AE085EE8524449B734ABEB21`, and command log `71308E0226F000C5F474E42F1A2F8AF80B4806B5873B5A79005E86C778070A53`.

## Pre-unseal controls

- Inventory: 30 sealed packets = 18 positive + 12 negative; executor results contain 30 packet entries and all required fields.
- Executor log and handoff declare no auditor-key read/search, target identification/search, external/post-cutoff use, experiment, or candidate creation. The command log is consistent with that declaration.
- The deidentified packet text contains no literal target title, DOI, URL, abstract, or target-method/results text visible to this auditor. This is a packet-text finding, not proof of source-level timing.

## Cutoff failures

| Packet | Target publication | Declared cutoff | Finding |
|---|---|---|---|
| L5-P01 | 2001-09-11 | 2003-12-31 | Target predates cutoff: invalid holdout. |
| L5-P03 | 2013-04-14 | 2015-12-31 | Target predates cutoff: invalid holdout. |
| L6-P02 | 2017-04-08 | 2017-12-31 | Target predates cutoff: invalid holdout. |

The other 15 target dates are after their stated cutoffs according to the canonical records held in the key.

## Unresolved provenance failure

The key's own policy requires retrieval and byte-hash recomputation of a frozen source record before unsealing. No source record, source URL/date list, snapshot, or per-source byte hash is present in `sealed_input_manifest.yaml`, `sealed_packets.yaml`, or `auditor_key.yaml`; the executor-visible `sources` values are only generic labels. The input-file hash proves the digest was frozen, but cannot prove that every summarized source was publicly available by its packet cutoff or that no target-derived knowledge entered the digest. This is why all lens verdicts are `CONTAMINATION_UNKNOWN`, not `CALIBRATED`.

## Decision

No direct executor misconduct is evidenced. Nevertheless, the invalid holdouts and uncheckable source-level cutoff chain prevent a calibration decision. Do not repair or overwrite frozen upstream material; create a new sealed pack and fresh execution for any rerun.
