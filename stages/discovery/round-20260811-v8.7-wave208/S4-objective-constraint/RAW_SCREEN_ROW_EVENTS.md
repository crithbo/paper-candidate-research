# Raw screen events

| ID | exact native artifact / fixed reader semantics | initial objective tension | initial divergence witness | disposition |
|---|---|---|---|---|
| R01 | Core WebAssembly binary module validated and instantiated by a conforming engine | bytes / decode-startup / producer cost | canonical section and LEB encoding must remain valid; any generic compressor is outside the module constructor | `DEEP_DIVE_REQUIRED` |
| R02 | .NET ReadyToRun (R2R) published assembly loaded by its target runtime | published bytes / cold startup / Crossgen2 CPU-RSS-temp | precompile subset and composite boundary alter the R2R native-code construction while retaining IL fallback | `DEEP_DIVE_REQUIRED` |
| R03 | Erlang BEAM module loaded by the BEAM VM | BEAM bytes / module load / compiler cost | compiler emits the complete chunked module; stripping/compression are existing switches | `DEEP_DIVE_REQUIRED` |
| R04 | V8 startup snapshot consumed by the matching V8 build | snapshot bytes / isolate startup / mksnapshot cost | serialized heap graph must satisfy native deserializer invariants | `NOT_ADMITTED_UNFROZEN` |
| R05 | GNU gettext MO catalog consumed by gettext | catalog bytes / translation lookup/load / msgfmt cost | hash-table emission versus no-hash is already a native `msgfmt` choice | `DEEP_DIVE_REQUIRED` |
| R06 | IANA TZif zoneinfo compiled by zic and read through native timezone APIs | zone bytes / load/parse / zic cost | all required transition semantics must remain representable in TZif | `NOT_ADMITTED_UNFROZEN` |

No raw row is promoted merely because it has a visible size–startup trade-off.

