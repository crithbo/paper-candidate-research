# Rule freeze

- Assignment: `DISCOVERY-S6-20260811-V8.7-WAVE201-ECMA335-METADATA-ROW-ASSIGNMENT-DEPTH`
- Frozen date/cutoff: 2026-08-11. Authority: v8.7 + R5-P0, `DISCOVERY_QUALITY_MODE=OFF`; no R7/v8.8 production semantics.
- Control hashes: plan `CFB9F43ABC534F063D30A51B9EABD407B5E1C8CC26D066A250B8D43F2D80D58B`; registry `F753554DB84F2DB5129F8B5B3CC64612384113118BA89F40A5789511646708EF`; ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Post-dispatch provenance only: `plan.md` `17FB33BEC9564ACF995C0E6A90E30A67F11758402743A2754E09C1262BCB8BF8`; `registry.yaml` `F44FFB7A20546CA853A25AC15737A2CECD6A27134D4F94FC3785C48C37328208`. It records mechanical S2 Wave195 control-plane intake and does not alter this assignment's frozen semantics, contract, or write boundary.
- Evidence: ECMA-335, official Microsoft documentation, and current `dotnet/runtime` upstream source renderings. No candidate experiment, benchmark, asset download, automation, or downstream-stage action occurred.

## Frozen same-object contract

The logical assembly, IL, resources, public reflection behavior, metadata-token values, and stock .NET/PE reader-verifier contract are held fixed. Row/table/heap construction is a candidate action only if it preserves this complete observable contract. Re-signing is allowed only as a necessary validity operation, never as a substitute for changed semantic identity.

## Decision rule

A reordered table that regenerates every direct reference but changes `MemberInfo.MetadataToken` or an IL token is not same-object under this contract. Therefore it cannot be rescued by a better byte layout, a generic packer, or an external postprocessor.
