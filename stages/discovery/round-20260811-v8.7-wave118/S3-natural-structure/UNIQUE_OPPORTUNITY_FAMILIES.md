# Unique opportunity families

| ID | Stable natural phenomenon | Exact object, complete action and natural oracle | Strongest current union / action-divergence result | Outcome |
|---|---|---|---|---|
| UF-118-01 | WSI has sparse tiles and repeated resolution-local image regions. | Fixed DICOM WSI pixels/metadata; construct all pyramid frames/tiles; DICOM reader validates pixel/multiframe semantics. | Tiled multi-frame images, `TILED_FULL`, sparse tiles, frames and compressed pixel-data path already express the action. | `DROP` |
| UF-118-02 | PDB entries repeat coordinate/residue/assembly structures. | Fixed PDBx/mmCIF dictionary instance; construct a valid representation that preserves the entry. Dictionary parser is oracle. | Only a new serialization/BinaryCIF/sidecar was identified; no standard-valid union-external atomic constructor. | `NOT_ADMITTED_UNFROZEN` |
| UF-118-03 | Seismic traces have temporally local sample regimes around events. | Fixed miniSEED samples, headers and timing; construct records/encodings/extra headers; libmseed/FDSN parsing validates. | Current miniSEED v3 record layout, encodings and headers are the named action space. | `DROP` |
| UF-118-04 | PDFs repeat resources/object subgraphs across pages. | Fixed PDF observable rendering and document semantics; construct object streams/references; compliant PDF reader is oracle. | Current writer object/reference/stream construction is the whole named action; no external action frozen. | `DROP` |
| UF-118-05 | glTF assets exhibit repeated buffers and sparse morph changes. | Fixed scene/rendering semantics; construct buffer/bufferView/accessor/sparse-accessor graph; Khronos validator/reader route. | The specification explicitly exposes these construction degrees of freedom. | `DROP` |
| UF-118-06 | Sparse volumes retain active leaf/voxel and tile locality. | Fixed OpenVDB grid/tree/transform semantics; construct nodes/tiles/leaves; reference library reads. | Current OpenVDB tree configuration, tiles, leaves and transform are native construction. | `DROP` |

Six unique families were admitted and deep reviewed. None yields a Stage0 brief because no complete union-external constructor survived.
