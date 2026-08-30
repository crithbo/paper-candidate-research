# RAW_SCREEN_ROW_EVENTS

|id|family|witness|result|
|---|---|---|---|
|R01|RISC-V Zcmp frame|early CSR choice affects late push/pop|DROP|
|R02|AArch64 outline atomics|late LSE/LLSC form costs|DROP|
|R03|PowerPC prefixed forms|early RA affects late prefix form|UNFROZEN|
|R04|Wasm tail-call stackification|early stack value order affects tail lowering|DROP|
|R05|RISC-V RVC frame/relax|early frame choice affects late compression|DROP|
|R06|RISC-V RVV vset spill|early vector RA affects late vset|EXCLUDED (Wave236)|
