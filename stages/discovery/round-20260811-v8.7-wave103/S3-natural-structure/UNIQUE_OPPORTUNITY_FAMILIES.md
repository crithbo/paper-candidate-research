# Unique opportunity families

| ID | Exact object / same-object semantics | Natural carrier and verification oracle | Candidate N2/N3 action | Required union-external witness | Outcome |
|---|---|---|---|---|---|
| UF-103-01 | Fixed alignment records, headers and reference interpretation. | Public alignment corpus; SAM/CRAM reader and reference checks. | Joint CRAM container/slice/codec constructor from coordinate/read-group locality. | A legal construction not expressed by current CRAM encoder container/slice/codec actions. | `DROP` |
| UF-103-02 | Fixed packet bytes, timestamps, interface mapping and PCAPNG reader result. | Public capture plus PCAPNG parser/spec. | Construct blocks/options from flow/time locality. | A frozen legal block action outside the actual writer/spec union. | `NOT_ADMITTED_UNFROZEN` |
| UF-103-03 | Fixed N-dimensional array values and Zarr v3 read result. | Public Zarr array; standard reader/checksum. | Globally construct chunk/shard/inner-chunk shape/layout under observed locality. | A complete action beyond Zarr's native chunk-grid and sharding codec. | `DROP` |
| UF-103-04 | Same app semantics for one frozen device configuration and valid signatures. | Public AAB plus bundle/apksigner verification. | Construct configuration/module APK split set from cohort repetition. | A packaging action beyond current AAB-to-APK generation while retaining signed artifact semantics. | `DROP` |
| UF-103-05 | Fixed FITS pixel/table semantics and FITS reader result. | Public FITS image; CFITSIO/fits verifier route. | Joint rectangular tile and codec constructor from local pixel regimes. | A non-native legal tiled-image compression action. | `DROP` |
| UF-103-06 | Fixed OpenEXR pixels/channels/deep samples and reference-library reader result. | Public production EXR; OpenEXR reference reader. | Joint tile/level/chunk construction from spatial/deep-data locality. | A legal action not already exposed by tile/level/compression construction. | `DROP` |

No object passed the complete constructor + union-external witness gate. No generic clustering, reorder-only layout, cache policy or synthetic witness was retained.
