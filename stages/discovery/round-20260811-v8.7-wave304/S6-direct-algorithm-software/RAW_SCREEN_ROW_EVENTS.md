# Raw screen row events

| requirement | official evidence | consequence |
|---|---|---|
| Serialized structure | ATNSerializer writes state descriptors, rule/mode/set, edge and decision-state descriptors in a defined int sequence. | every state ID is reference-coupled |
| Version/target encoding | ATNDeserializer has `SERIALIZED_VERSION`; Java target packs ints as 16-bit words. | reader/version and local integer coding are fixed contracts |
| Runtime compatibility | ANTLR emits/checks tool and runtime version information. | adjacent versions are not freely interchangeable |
| Action test | State permutation requires global reference regeneration; remaining byte difference is generic graph numbering or local word encoding. | `STRUCTURAL_DROP` |

Frequency ordering, varint/word encoding, generic graph numbering/ILP and generator patches are excluded.
