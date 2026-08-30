# Pre-evidence RQ candidates

## RQ-S69-01 — Cap'n Proto segment/pointer constructor

For fixed schema, logical object graph/values and stock Cap'n Proto reader observations, can a target-specific segment/pointer constructor improve build/read/full-cost without changing the format or reader?

## RQ-S69-02 — Protobuf arena/metadata constructor

For fixed protobuf schema/message values and stock parser/reflection observations, can a target-specific lifetime/metadata constructor improve serialize/parse/full-cost without being an existing arena/serialization option?

## RQ-S69-03 — Avro block/schema constructor

For fixed Avro schema, record sequence and stock reader observations, can a target-specific block/schema metadata constructor improve write/read/full-cost without changing container format/reader semantics?

The three RQs are primary and require ordinary source closure before raw.
