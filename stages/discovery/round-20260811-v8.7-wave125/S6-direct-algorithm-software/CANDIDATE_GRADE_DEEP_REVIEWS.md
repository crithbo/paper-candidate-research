# Candidate-grade deep reviews

## D01 — re2c scanner-code constructor

- **Exact object:** fixed regular-language specification and API skeleton to generated C scanner with identical accepted/tokenized input behavior.
- **Current strongest union:** regex-to-automaton construction, state encoding, transition representation, code templates, tags/tags history, computed-goto/switch/table output and all documented generation options.
- **Witness and closure:** a DFA with shared successor states admits a joint state/transition representation proposition, but output representation/template/code-model choices are already native generator actions. No complete union-external N2 was frozen.
- **Natural/full-cost/72h killer:** public lexer specs and source files; compile generated C, tokenize corpus, charge generator time, generated code bytes, compile/runtime/RSS and output equality. Kill on scanner mismatch or option/template-only mechanism.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D02 — Ragel FSM-code constructor

- **Exact object:** fixed machine specification to generated C recognizer/transducer with identical input/output behavior.
- **Current strongest union:** FSM construction/minimization, state/transition representation, host-language code generation, action embedding and generation options.
- **Witness and closure:** a cyclic machine permits a global state-layout action, but this is inside current table/direct/flat/other code-generation representation union; no independent whole constructor is named.
- **Natural/full-cost/72h killer:** public protocol/lexer machines and inputs; generated-C compile/behavior check with generation bytes/time, compile/runtime/RSS. Kill if codegen mode configuration absorbs it or behavior changes.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D03 — GNU as relocatable-object writer

- **Exact object:** fixed assembly, target ABI and flags to a relocatable object preserving section contents, symbols, relocations and reader/linker behavior.
- **Current strongest union:** parse, instruction encoding, section/subsection handling, symbol/fixup construction, relocation selection, alignment, ELF/object emission and target options.
- **Witness and closure:** paired relocations offer a global placement/order proposition, but ELF section/relocation order and alignment are established assembler/object-writer actions; a changed linker script/ABI or postprocessor changes the object. 
- **Natural/full-cost/72h killer:** public assembly objects; native readelf/assembler/link behavior, charge assembly, fixup/relocation/bytes, link/read verification, CPU/RSS. Kill on reader/link semantic difference or local emitter patch.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## Result

Three deep reviews, zero briefs. The other three writer families remain raw/unfrozen rather than being promoted as generic formatting. No conclusion uses implementation, result, resource or AI readiness as negative evidence.
