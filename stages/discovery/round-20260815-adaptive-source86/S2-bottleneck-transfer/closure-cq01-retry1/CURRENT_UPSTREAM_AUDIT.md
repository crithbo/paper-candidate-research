# Current upstream audit — ONNX Runtime retry1

The official commit source pins `microsoft/onnxruntime@c5300b71ec44aee30ba0d18190f29372568a8e07`; the frozen named model hash is `57B2CFC39FECDE2A6451F5E7F93DD57006EC51A461481D20B1F3B59E32D7D0A5`.

The bounded current union includes EP `GetCapability`/graph partitioning, session state and repeated-allocation/memory-pattern machinery, BFC arena behavior, allocation planning, and the native partitioning test/model carrier. This makes stock partitioning and allocation current subtractors. No retained source establishes two complete stock-legal partition-plus-allocation plans for the one fixed session, an ORT-specific union-external action, or a finite guarantee. Generic partition/packing/controller work or changed provider/session semantics cannot supply the missing residual. Full cost must include provider partition, session build, allocation/memory pattern, arena, repeat behavior and outputs.
