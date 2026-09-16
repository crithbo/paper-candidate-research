# Divergence seed pool

Generated offline before evidence lookup; seeds are non-evidentiary.

| Seed | Engine | Perspective | Sketch | Selection |
|---|---|---|---|---|
| S01 | JANUSIAN_TENSION | GPU/runtime engineer | GPUBuffer mapping enables CPU visibility but removes GPU queue availability. Could same-endpoint map/unmap planning lower transfer lifecycle cost? | Selected |
| S02 | CONSTRAINT_MANIPULATION | application author | Can mapped ranges be split or reordered while maintaining queue visibility? | Merged into S01 |
| S03 | PROBLEM_REFRAMING | browser implementer | Can mapping remain live through queue submission? | Not selected: directly changes availability state |
| S04 | NEGATION_OR_INVERSION | backend engineer | Can unmap be delayed to a driver safe point? | Not selected: runtime controller/changed visibility |
| S05 | ABSTRACTION_LADDER | compiler researcher | Can generic lifetime analysis infer all WebGPU map windows? | Not selected: generic shell |
| S06 | COMPOSE_DECOMPOSE_SIMPLIFY | measurement reviewer | Can staging buffers replace mapping transitions? | Not selected: changed object/transfer action |
