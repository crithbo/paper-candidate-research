# Six finite-state native writer families

All semantic objects fix decoded payload and stock reader behavior; any candidate must regenerate every native reference and charge writer/read/checker CPU, wall, RSS, temporary space and bytes.

| ID | Family | Current union / action state | Natural carrier | Decision |
|---|---|---|---|---|
| F1 | Apache Avro object-container writer | Schema, codec, sync and block-flush configuration/implementation; block boundary is legal format freedom. | Versioned public Avro datasets/record streams. | `NOT_ADMITTED_UNFROZEN` |
| F2 | OpenEXR scanline/tiled chunk writer | Header, chunk/tile layout, compression, line order and offset table; finite chunk state. | Official OpenEXR image corpus. | `NOT_ADMITTED_UNFROZEN` |
| F3 | libtiff strip/tile and IFD writer | Tile/strip geometry, codec, strile offsets, directory flush/checkpoint and tags. | Public TIFF imagery. | `NOT_ADMITTED_UNFROZEN` |
| F4 | Apache Thrift compact protocol | Field-ID delta state and field/message emission. | Versioned Thrift RPC traces. | `STRUCTURAL_DROP` |
| F5 | GNU tar/pax archive writer | Header/block padding, sparse/pax records, member sequence. | Reproducible source-tree archives. | `STRUCTURAL_DROP` |
| F6 | cpio newc archive writer | Header, alignment/padding, entry emission. | Initramfs/source-tree archives. | `STRUCTURAL_DROP` |

For F1–F3 a possible paper shape would be an exact/FPT dynamic program jointly selecting legal finite-state boundaries/layout under an explicit size-versus-decode/seek/temporary-space budget. This is only a proposition: present sources do not close complete upstream unions or rule out direct same-object algorithms. F4–F6 cannot preserve the fixed object while gaining a nontrivial joint decision, or reduce to ordering/packing.
