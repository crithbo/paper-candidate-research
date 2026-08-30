# Unique opportunity family

## Chromium DataPack resource-index/layout/version constructor

- Exact object: fixed resource IDs/aliases/bytes and scale/locale semantics for the same Chromium version and stock `ui::DataPack` lookups.
- Native oracle: stock load, ID/alias lookup and full scan; table and offset validation must succeed.
- Fixed constraint: resource IDs cannot be renumbered and table entries must remain binary-search compatible; aliases retain their native target semantics.
- Conditional whole action: jointly choose any remaining legal resource payload placement, index/alias encoding and version-compatible layout while regenerating every offset and preserving reader behavior.
- Current union required: DataPack reader/writer, GRIT/repack, index/alias encoding, compression/scale/locale pipeline and default/nondefault build flags.
- Conditional N2: DataPack-specific exact/FPT/Pareto/approximation/formal algorithm with full pack/build/delta/load/query cost. Generic layout/packing/VCDIFF and simple ordering are excluded.
- Natural route: versioned Chromium release resource corpus; stock load/lookup/full scan equality and pack/build CPU-RSS-temp, bytes/delta/apply, load/query ledger.
- Status: no brief; complete current union and direct collision remain unclosed.
