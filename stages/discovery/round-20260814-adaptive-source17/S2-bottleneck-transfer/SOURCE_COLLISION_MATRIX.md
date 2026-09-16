# Source17 evidence-role matrix

| family | anchor | current union/subtractor | carrier-oracle closure | result |
|---|---|---|---|---|
| CXL memory tiering | host-device capacity/latency tension | stock runtime union not source-pinned | absent | NOT_ADMITTED_UNFROZEN |
| GPU direct storage | movement full-cost tension | stock API/semantic union unclosed | partial | NOT_ADMITTED_UNFROZEN |
| NCCL lowering | collective movement tension | current collective union unclosed | absent | NOT_ADMITTED_UNFROZEN |
| public NDP/PIM mapping | accelerator model | model action union unclosed | absent | NOT_ADMITTED_UNFROZEN |
| launch ABI | compiler-runtime boundary | no union-external action | n/a | STRUCTURAL_DROP |
| compression/offload | bandwidth pressure | changes guarantee/wrapper | n/a | STRUCTURAL_DROP |

SEARCH_BOUNDED_OPEN; no absence claim is made from incomplete source closure.
