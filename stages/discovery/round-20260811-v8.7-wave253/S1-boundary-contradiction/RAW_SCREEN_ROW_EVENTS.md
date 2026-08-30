# RAW

R01: PowerPC prefixed address form versus address-materialization live-range. Witness: a PC-relative prefixed memory operation is legal for a fixed address, while `addis/addi` plus memory operation creates a live address temporary that may cause a copy/spill. Same values/ABI/ISA. `CANDIDATE_GRADE_DEEP_REVIEW`.
