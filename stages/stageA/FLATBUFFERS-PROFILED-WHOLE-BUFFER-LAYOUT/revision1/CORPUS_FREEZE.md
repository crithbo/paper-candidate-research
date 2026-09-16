# Corpus continuity freeze

Revision 1 does not create, download, replace, filter or re-split a corpus. It consumes the read-only initial corpus manifest:

- path: `..\initial\inputs\natural_corpus_manifest.json`
- SHA-256: `6C8F68ADA4DEF9D0C8751C2FA889A68C49C47BD4E7DC3D3593A34F87799BE757`
- records: 24 version-pinned official TFLite Micro models
- split: 11 training models from four families; 13 held-out models from five disjoint families

Only the 11 records labelled `train` were opened during trace derivation. `trace/TRACE_FREEZE.yaml` records `heldout_files_opened=false` and `initial_result_files_opened=false`. The 13 held-out model files first entered the corrected pipeline only after the revised preclaim gate passed.

The frozen natural evaluation preserves all eight arms, beam width 8, transition cap 20,000, pinned native reader/verifier/format/object, and fixed warm/cold request denominators. No result-conditioned profile, model selection, arm search or configuration search occurred.
