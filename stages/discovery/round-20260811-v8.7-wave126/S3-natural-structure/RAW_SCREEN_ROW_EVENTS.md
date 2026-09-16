# Wave126 raw screen-row events

Frozen assignment: `DISCOVERY-S3-20260811-V8.7-WAVE126-PDBX-MMCIF-WRITER-ACTION-DEPTH-REDTEAM`.  
Cutoff: 2026-08-11; rules: v8.7+R5-P0, `QUALITY_MODE=OFF`.

| Event | Natural carrier / premise | Proposed whole-writer action | Initial witness result |
|---|---|---|---|
| RAW-126-01 | Public wwPDB PDBx/mmCIF entries have repeated `atom_site`, residue and assembly-category structure. | Jointly reorder/group categories and loop rows, choose lexical values and output encoding to minimize full compressed representation while preserving PDBx semantics. | `DEEP_DIVE_REQUIRED`: must distinguish reader/dictionary semantics from byte/order observable behavior and existing writer/BinaryCIF/compressor union. |
