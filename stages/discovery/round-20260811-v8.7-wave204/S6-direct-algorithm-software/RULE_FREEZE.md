# Rule freeze

- Assignment: `DISCOVERY-S6-20260811-V8.7-WAVE204-MLIR-BYTECODE-TABLE-ID-PLANNER-DEPTH`
- Frozen date/cutoff: 2026-08-11. Method: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.
- Control hashes: plan `ACB02E03EA4C7D582250F082CC3A2D79384E6A0AE0479F8BB58F446E6023BAA5`; registry `9A2ADD1855737A4954E56D6E03C4DA44E7B60272AB06CA0F2A6150701656473A`; ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Evidence boundary: current LLVM/MLIR source documentation and primary MLIR material only. No experiment, benchmark, download, automation, or downstream-stage action occurred.

## Frozen object

The decoded MLIR operation/region/block/value graph, attributes, types, properties, dialect versions, resources, and stock MLIR parser/verifier round-trip semantics are fixed. A legal candidate may regenerate all bytecode-local IDs and dependent references only if the stock reader recreates the same frozen IR and compatibility contract.

## Disposition rule

Bytecode-local IDs are not shown by the official format to be externally semantic in the way CLI metadata tokens are. Nevertheless, format-level ID freedom is not a residual by itself: complete current writer union, direct collision closure, and a non-routine joint N2 must be frozen before admission.
