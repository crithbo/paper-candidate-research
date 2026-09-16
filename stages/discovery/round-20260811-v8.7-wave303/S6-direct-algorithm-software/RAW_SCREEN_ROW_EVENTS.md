# Raw screen row events

| requirement | official evidence | consequence |
|---|---|---|
| Frame semantics | Initial frame is implicit; each encoded frame relies on the previous frame. | state sequence constrained by verifier semantics |
| Frame encoding | Same, same-locals-1-stack, chop, append and full encodings use tag/offset_delta fields. | local representation action |
| Placement | Verifier expects stack maps at control-flow targets/basic-block starts and checks offset/frame consistency. | frame locations are not a free global layout object |
| Reader/writer | Recent OpenJDK classfile API supports automatic stack-map generation, with explicit handling of unreachable code. | stock writer union includes generation route |
| N2 test | No non-generic joint placement/encoding theorem survives after fixed bytecode and verifier contract. | `STRUCTURAL_DROP` |

Ordinary frame-tag selection, shortest encoding, writer flags or format freedom are explicitly excluded.
