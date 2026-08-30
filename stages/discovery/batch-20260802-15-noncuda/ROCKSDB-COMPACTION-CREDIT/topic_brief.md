# ROCKSDB-COMPACTION-CREDIT Compaction Credit Scheduling

- Status: `DROP`
- Primary lane: storage_systems

## Research question
Can a credit score schedule RocksDB compactions independently of subcompaction-tail optimization?

## Exact object and strongest fair baseline
RocksDB compaction admission/boundary selection; the active `LSM-SUBCOMPACTION-TAIL` already owns the tail-risk-aware boundary decision and demands a full union.

## Mechanism hypothesis and falsifier
Credit is a scalar reparameterization of queue/admission policy. It has no residual distinct object or guarantee after the existing boundary-selection union.

## Executable evidence path
Open source availability is irrelevant to this direct collision.

## Dual-axis score
- Academic value: `34/70`
- AI executability bonus: `25/30`
- Total: `59/100`
