# Mainline PACKER acceptance decision — V8.8-R3R1

- approval_id: `V8_8-R3R1-BOUNDED-CALIBRATION-20260810`
- decision: `REJECT_PACKER__FAILED_NOT_DISPATCHABLE__MISSING_CONTROL_ARM`
- evidence_class: `METHOD_CONTRACT_INTEGRITY_FAILURE`
- executor_started: `false`
- auditor_started: `false`
- production_changed: `false`

## Mechanical checks that passed

- resume2 final files: 49; non-self manifest entries: 48; manifest verification: 48/48.
- blind cases: 10; complete primary artifacts: 30.
- network bytes: 3,546,199 / 52,428,800.
- final directory bytes: 3,627,141 / 104,857,600.
- executor-visible old-case, URL and source-identity scan: 0 hits.
- final handoff SHA-256: `5631233E44E92D6D79B027B235ED3F40ABAE01B55EF96119D47FEDE7161729D1`.
- final manifest SHA-256: `856FD1DE777B0F40542FFC58D4934CDA78F78AA6A57192AA7CAF24A756584AB5`.
- blinded input root SHA-256: `77D7905F15912398E36897360F9C7FB38D96233D2A04B5109329DE1935A80A0F`.

## Fatal dispatchability gap

The user-approved R3R1 contract fixes exactly 20 executor case-runs: ten `control v8.7` runs plus ten `proposed R3R1` runs. The sealed executor allowlist contains:

- `EXECUTOR_INSTRUCTIONS.md`;
- one `sealed_method_contract.yaml` defining only the R3R1 ordered disposition table;
- one `scoreability_schema.yaml` defining a single disposition/output record;
- ten opaque `EXECUTOR_INPUT/**/case.yaml` files.

It contains no control-v8.7 method specification, no arm/run identifier, no control output schema, and no frozen 20-run output layout. `EXECUTOR_INSTRUCTIONS.md` asks for one evaluation per opaque case. The same sealed contract also forbids the executor from reading any file outside this allowlist, so the executor cannot recover the control method from authoritative project rules.

Supplying a control prompt or contract now would change the sealed executor input after PACKER completion. That would be an unapproved repack/revision, would invalidate blindness and scoreability, and is forbidden by the R3R1 one-failure stop rule.

## Consequence

The packet is not dispatchable. The current v8.8 lineage is `FAIL / NOT_CALIBRATED`; no EXECUTOR or AUDITOR assignment may start, and no automatic R3R2, repack, replay, shadow or production cutover is allowed. Production Discovery remains v8.7+R5-P0 with `DISCOVERY_QUALITY_MODE=OFF`.

This decision says nothing negative about any research candidate. It is a method-contract integrity failure. A future attempt would require user review and approval of a separately named full redesign, not another automatic revision of R3R1.
