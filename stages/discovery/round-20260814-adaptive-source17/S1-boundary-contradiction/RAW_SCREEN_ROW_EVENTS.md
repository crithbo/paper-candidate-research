# Problem-evidence-first raw rows

| ID | Problem-bearing anchor and invariant | Current native union / strongest independent subtractor | Versioned carrier + stock oracle | Status |
|---|---|---|---|---|
| R01 | StableHLO portable artifact must preserve specified semantics across compatible versions | VHLO add-only versioned conversion, compatibility suite and StableHLO spec | versioned VHLO corpus + deserialize/round-trip and interpreter oracle | DEEP_D1 |
| R02 | CUDA `__grid_constant__` requires one read-only grid-lifetime parameter address | CUDA language extension/compiler parameter lowering | CUDA samples + compiler output and kernel semantic oracle | RAW_ONLY |
| R03 | ROCR AQL queue packet completion must become observable through its completion signal | ROCR queue/signal runtime contract | ROCR versioned API + queue/status oracle | RAW_ONLY |
| R04 | CUDA Tile `ct.Constant` changes compile-time specialization boundary while preserving computed tensor result | CUDA Tile compiler specialization | official tile examples + result/assembly oracle | RAW_ONLY |

All four entries are non-security compiler/accelerator semantic objects. Each has a problem anchor, current union/subtractor and carrier/oracle before any depth decision.
