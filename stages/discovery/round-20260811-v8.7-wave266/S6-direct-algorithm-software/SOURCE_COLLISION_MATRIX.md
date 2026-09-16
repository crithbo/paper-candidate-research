# Source and collision matrix

| Source | Evidence / consequence |
|---|---|
| [GNU MO format](https://www.gnu.org/software/gettext/manual/html_node/MO-Files.html) | Sorted originals, parallel translations, optional hash, offsets, context/plural/charset encoding. |
| [GNU gettext manual](https://www.gnu.org/software/gettext/manual/gettext.html) | `msgfmt` alignment/endianness/`--no-hash` action union and reader behavior. |
| Static hash-table and byte-layout construction | Direct generic algorithm family; cannot be renamed as a catalog-specific N2. |

The native union and fixed sorted-table contract absorb the witness; no claim is made that a missing writer feature proves novelty.
