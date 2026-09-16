# Source55 S6 — RQ convergence

## Anchor chosen after the seed portfolio

`LLVM_TABLEGEN_MC_DECODER_TABLE_CONSTRUCTION__FIXED_TARGET_INSTRUCTION_SEMANTICS__STOCK_LLVM_MC_DECODER_ORACLE__GENERATION_TABLE_BYTES_DECODE_COST`

Exact object: a fixed LLVM target instruction-description set and fixed encoded instruction stream; the decoded instruction/opcode/operand result and error behaviour must agree with the stock LLVM MC decoder.

Natural/canonical carrier: the versioned target `.td` descriptions and MC disassembly tests shipped by LLVM.

## Primary RQ

For a fixed target description and decoder semantics, is there a target-specific joint constructor over instruction predicates, decoder-table rows and subtable references that gives an exact, FPT, approximation, or certified Pareto bound on table bytes and stock-decoder work beyond LLVM's current decoder-table composition?

## Falsifier and closure plan

The RQ is falsified if current LLVM sources already expose the proposed joint construction, or if the remaining search is only generic decision-tree/table synthesis rather than target-specific code-generation structure.  A bounded closure reads the current TableGen decoder emitter and its public tests, identifies the current action catalogue, and checks one direct compiler/decoder construction subtractor.  No build, generated artifact, or experiment is authorized.
