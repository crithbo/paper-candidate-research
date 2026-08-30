# Source/collision matrix

| Family | Primary source | Source-grounded fact | Collision/closure result |
|---|---|---|---|
| OpenEXR | [Official OpenEXR repository](https://github.com/AcademySoftwareFoundation/openexr) | Project supplies specification and reference implementation; supports multi-part/channel image storage and performance-sensitive read/write/compression. | Current union and direct algorithm literature unclosed. |
| libtiff | [Official libtiff release](https://gitlab.com/libtiff/libtiff/-/releases) and [current reader source](https://gitlab.com/libtiff/libtiff/-/blob/master/libtiff/tif_dirread.c) | Current release/source exposes strile, directory and offset/bytecount handling. | Writer/default/config union and direct collision unclosed. |
| Avro | [Apache Avro repository](https://github.com/apache/avro) | Official upstream locator for object-container writer/reader source. | Current writer union not source-pinned in this assignment. |
| Thrift | [Apache Thrift repository](https://github.com/apache/thrift) | Official upstream locator for compact protocol producer/reader. | Structural drop before collision review. |
| tar | [GNU tar manual](https://www.gnu.org/software/tar/manual/) | Official archive semantics/source documentation. | Structural drop: member sequence/order contract or generic packing. |
| cpio | [GNU cpio manual](https://www.gnu.org/software/cpio/manual/) | Official native archive documentation. | Structural drop: no nontrivial same-object joint residual. |

Cutoff is 2026-08-11; only official/upstream sources were used. No limitation/future-work statement is gap evidence.
