# SOURCE / COLLISION MATRIX

| Boundary | First-party source | Consequence |
|---|---|---|
| Official release/version chain | [IANA release list](https://www.iana.org/time-zones/releases), [tz-link](https://data.iana.org/time-zones/tz-link.html), [published tzdb index](https://data.iana.org/time-zones/tzdb/?version=published) | Named historical releases, version file and code/data bundles make a finite natural three-version route available. |
| Source change semantics and compiler | [tz how-to](https://data.iana.org/time-zones/tz-how-to.html), [official tz source](https://github.com/eggert/tz) | Rule/Zone/Link data plus `zic` determine generated zone files; change must be traced at source level, not inferred from bytes. |
| Reader/output contract | [RFC 9636](https://www.rfc-editor.org/rfc/rfc9636.html) | Transition/type/designation, leap and footer semantics; reader compatibility caveats forbid altered-reader shortcuts. |
| Current data theory | [tzdb theory](https://data.iana.org/time-zones/tzdb-2025c/theory.html) | POSIX-tail/proleptic behavior is semantic, not ignorable layout. |
| Strongest distribution comparator | [RFC 3284 VCDIFF](https://www.rfc-editor.org/rfc/rfc3284) | Equal-information delta baseline; not a contribution. |

No old issue/future-work material is used to claim that zic lacks functionality. The decisive negative is structural: the only frozen legal recourse is standard dependency-target reuse/rebuild.
