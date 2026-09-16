# Source64 RQ

## S64-RQ-01

- Anchor: GHC current user guide, separate compilation/recompilation checker (9.15 branch), accessed 2026-08-15.
- Exact object: GHC interface and object recompilation state under unchanged separate-compilation semantics.
- Primary RQ: Can a GHC-native bounded-recourse interface/object-state constructor reduce online recompilation cascade cost while retaining exact object/interface outputs and flags?
- Excludes generic build scheduling, external dependency graphs, changed interface format, or weaker compilation semantics.
- Falsifier: current union already maintains fingerprints/usages and performs same object/interface update without code generation, or residue is generic dynamic dependency maintenance.
- Primary route: official current GHC user guide and current GHC API/source documentation; scope PASS, novelty threat HIGH.
