# S6 canonical Discovery log

Assignment: `DISCOVERY-S6-20260814-CANONICAL-RESUME01`  
Method: `v8.7 potential/readiness separated`; `DISCOVERY_QUALITY_MODE=OFF`; `DISCOVERY_CLAIM_PACK_MODE=OFF`  
Snapshot date: 2026-08-14 (public, read-only sources only)

## Result

Six diagnostic families were screened. No grounded brief is proposed. This is a scientific screening outcome, not an implementation, result, resource, or AI-readiness judgment.

| Funnel | Count | Notes |
|---|---:|---|
| raw opportunities | 6 | Fresh against a bounded `registry.yaml` text search; OpenVDB was excluded before counting because registry records a prior S2 family. |
| candidate-grade deep reviews | 2 | Linux eBPF verifier-state construction; LibTIFF image-layout construction. |
| structural drops | 3 | LibTIFF, Open Babel canonical SMILES, CGAL mesh simplification. |
| not admitted / bounded open | 3 | Linux eBPF verifier, Gmsh meshing, an independent geometric-control check. |
| `PROPOSE_STAGE0` | 0 | No complete non-generic residual survived the bounded checks. |

## Neutral source snapshots

All sources below were read on 2026-08-14. A source snapshot means URL, upstream surface, and bounded-source status; no repository clone, build, download, or experiment was run.

1. **LIBTIFF_TIFF_IMAGE_STORAGE_LAYOUT__FIXED_DECODED_PIXELS_AND_STANDARD_TIFF_READER_SEMANTICS** — LibTIFF 4.7.2 documentation: [library I/O surfaces](https://libtiff.gitlab.io/libtiff/libtiff.html), [TIFFOpen mode controls](https://libtiff.gitlab.io/libtiff/functions/TIFFOpen.html), [encoded-strip writer](https://libtiff.gitlab.io/libtiff/functions/TIFFWriteEncodedStrip.html).
2. **LINUX_EBPF_VERIFIER_STATE_EXPLORATION__FIXED_PROGRAM_AND_ACCEPT_REJECT_SEMANTICS** — [kernel verifier documentation](https://docs.kernel.org/bpf/verifier.html) and current [verifier state definitions](https://github.com/torvalds/linux/blob/master/include/linux/bpf_verifier.h).
3. **OPEN_BABEL_CANONICAL_SMILES_CONSTRUCTION__FIXED_MOLECULAR_GRAPH_AND_IMPLEMENTATION_SPECIFIC_CANONICAL_OUTPUT** — [current format/options documentation](https://openbabel.org/docs/FileFormats/SMILES_format.html) and [canonical-code algorithm documentation](https://openbabel.org/api/2.3.0/canonical_code_algorithm.shtml).
4. **CGAL_TRIANGULATED_SURFACE_MESH_SIMPLIFICATION__FIXED_MESH_AND_EDGE_COLLAPSE_RESULT_SEMANTICS** — [CGAL 6.2 reference](https://doc.cgal.org/latest/Surface_mesh_simplification/group__PkgSurfaceMeshSimplificationRef.html).
5. **GMSH_MESH_CONSTRUCTION_AND_HIGH_ORDER_OPTIMIZATION__FIXED_GEOMETRY_AND_MESH_VALIDITY_SEMANTICS** — [Gmsh current manual](https://www.gmsh.info/doc/texinfo/gmsh.pdf) and [first-party implementation paper](https://gmsh.info/doc/preprints/gmsh_paper_preprint.pdf).
6. **GEOMETRIC_MESH_LOCAL_REPAIR_CONSTRUCTION__FIXED_TRIANGULATION_AND_VALIDITY_ORACLE** — a negative control paired with the CGAL/Gmsh primary surfaces; no independent target-specific residual was frozen.

## Canonical decision discipline

* A current-implementation absence was never inferred merely from an issue, future-work statement, or missing result. Relevant official docs and source-facing documentation were checked first; where the bounded inspection could not close a current action union, the result is `NOT_ADMITTED_UNFROZEN`, not an absence claim.
* The potential/readiness correction was applied: missing implementation or positive results did not cause any drop. The three drops are about the fixed object/semantics or an already exposed native action/strong comparator, respectively.
* No V9, shadow, E2, experiment, benchmark, build, install, large download, Stage 0/A/B directory, or shared-control write was performed.
