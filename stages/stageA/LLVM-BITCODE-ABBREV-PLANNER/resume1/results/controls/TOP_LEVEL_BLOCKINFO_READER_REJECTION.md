# Top-level BLOCKINFO reader-rejection control

- Role: `PRE_CLAIM_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING`
- Attempted mapping: insert a new top-level BLOCKINFO after MODULE, define the
  STRTAB Blob grammar there, remove the immediate STRTAB definition, and retain
  record ID 4.
- Trace-level parser: accepted; expanded trace SHA-256 remained
  `a04637e56743bfd22bf9a80d86c63e4e44bcd3ee5067156f6adb09281cca14d5`.
- `llvm-bcanalyzer`: accepted the generic bitstream structure.
- Unmodified LLVM 22.1.8 IR reader (`llvm-dis` and `opt`): rejected with
  `Invalid abbrev number`.
- Failed output at observation: 1,748 bytes, SHA-256
  `219f4f7eecc99e42885e0a01a3949f5780e0d5b91e014132b2bce3b7df1228d1`.
- Disposition: not a legal action for the frozen object, not used in the gate,
  not counted in the natural action universe, and supports neither Stage A PASS
  nor scientific STOP.  The valid capacity-neutral MODULE-contained BLOCKINFO
  witness is separately frozen under `results/scope_witness/`.
