# Raw screen row events

| Row | Current primary evidence | Question | Finding |
|---|---|---|---|
| R1 | ECMA-335 and Microsoft metadata documentation | Is a metadata table row identifier purely an invisible writer choice? | No. A metadata token identifies a particular table row and is persisted in CIL. |
| R2 | `System.Reflection.Metadata.Ecma335.MetadataTokens` official API | Can a stock consumer observe the token? | Yes. The supported API gets a token from an entity handle/reader. |
| R3 | Current `MetadataRootBuilder` source | Does the native builder enforce ECMA ordering? | Yes by default: serialization calls `ValidateOrder`; the only exposed switch is `SuppressValidation`, which does not create a same-object semantic exemption. |
| R4 | Current `MetadataSizes` source | Are row/heap thresholds a local field choice? | No. table row counts and heap sizes jointly determine 2/4-byte simple and coded index widths throughout the metadata stream. |
| R5 | bounded official/primary collision scan | Can an externally visible token permutation be a current same-object global N2? | No. The same-object contract fails before novelty can be evaluated. No absence claim is required. |
