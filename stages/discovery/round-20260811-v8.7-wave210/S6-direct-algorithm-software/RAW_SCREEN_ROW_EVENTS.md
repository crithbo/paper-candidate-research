# Raw screen row events

| Row | Official evidence | Finding |
|---|---|---|
| R1 | Linux BTF documentation | BTF has type and string data; type IDs and string offsets are explicit references. |
| R2 | Linux BTF.ext documentation | func_info, line_info and CO-RE records contain type IDs/string offsets and require loader manipulation. |
| R3 | libbpf current source/documentation | libbpf uses BTF and BTF.ext while opening/loading CO-RE objects. |
| R4 | LLVM/pahole producer family | Producer dedup and emission paths are direct same-object baseline candidates, but complete current flags/action union was not source-closed in this pass. |
| R5 | Bounded primary collision check | No novelty/absence conclusion; direct type-canonicalization/planner collision remains unclosed. |
