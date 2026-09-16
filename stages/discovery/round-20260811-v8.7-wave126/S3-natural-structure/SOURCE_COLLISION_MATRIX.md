# Current-upstream reality and collision matrix

Frozen date: 2026-08-11. Sources are first-party/official. They establish current semantic and writer/reader capability; they do not prove a missing feature.

| Facet | Frozen current reality | Consequence for residual |
|---|---|---|
| Semantic contract | The [wwPDB general FAQ](https://mmcif.wwpdb.org/docs/faqs/pdbx-mmcif-faq-general.html) describes PDBx/mmCIF as dictionary-defined categories/tables with explicit relationships and referential-integrity metadata. The [current dictionary download page](https://mmcif.wwpdb.org/dictionaries/downloads.html) supplies the current PDB Exchange Dictionary. | Equality must preserve all dictionary content/relationships, not just geometry. |
| Syntax and order | The [wwPDB syntax guide](https://mmcif.wwpdb.org/docs/tutorials/mechanics/pdbx-mmcif-syntax.html) defines STAR-derived key-value and loop syntax; the [IUCr CIF primer](https://www.iucr.org/__data/iucr/cif/software/ciftbx3/CIFtbx_Primer.pdf) specifies repeated loop values in data-name order. | Syntax permits representations, but a blanket claim that category/row/column reordering is semantically invisible is not established for all real consumers. |
| Current native reader/writer | The official [wwPDB Python tutorial](https://mmcif.wwpdb.org/docs/sw-examples/python/html/index.html) documents `PdbxReader` and `PdbxWriter` and their container/category model. The current [wwPDB software list](https://mmcif.wwpdb.org/docs/software-resources.html) includes current parsers, writers, validators and BinaryCIF-capable tools. | A proposal limited to serializing/reordering categories is not automatically outside the strongest union. |
| Natural carrier/output alternatives | The official [RCSB download service](https://www.rcsb.org/docs/programmatic-access/file-download-services) distributes natural entries in mmCIF, XML and BinaryCIF and identifies archive snapshots. | Switching representation can change the artifact/interface; it cannot silently count as an improvement to the same mmCIF writer object. |
| Semantic oracle | The wwPDB dictionary is explicitly software accessible and can generate validating parsers, per the [FAQ](https://mmcif.wwpdb.org/docs/faqs/pdbx-mmcif-faq-general.html). | Parser+dictionary validation is necessary but insufficient to prove order invisibility for all consumer contracts. |

Cross-lane/terminal check: this is the sole unresolved Wave118 PDBx/mmCIF record; Wave59/71/81/90/98/103/112/118 terminal or screened objects and all active lane assignments are not reused.
