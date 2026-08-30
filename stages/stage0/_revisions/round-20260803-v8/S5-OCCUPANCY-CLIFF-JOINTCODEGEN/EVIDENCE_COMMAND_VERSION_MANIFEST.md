# Evidence / command / version manifest — S5-OCCUPANCY-CLIFF-JOINTCODEGEN

## Read inputs, SHA-256 verified

- Discovery brief: `C324D3D411E33054939ECD5CFF9F0F9BCBDD26E3441A2658F772639F487C0741`.
- PRIMARY report: `99187F4FA25365B441FB40F59296E41F25C4CF0CA523DDBD73D7C08596427215`.
- Confirmation report: `5B60B9716FF81192DA6A3D747356EDE135E8683DE2D868F251D8280BBCAD364C`.
- Tier recalibration: `BFBD30DEBEAB267850505ACBA2715C1D4F1A88284910840191C7FF03BCC34CFD`.

## Low-cost checks executed

1. SHA-256 matching for frozen review inputs.
2. Official LLVM static documentation/source recheck for `TargetOccupancy`, register-pressure limits and occupancy scheduling stages.
3. Local command inventory: only `node` was available among `llc`, `opt`, `llvm-mc`, `cargo`, `python`, `node`; no compiler/artifact was installed or added.
4. Read-only revision-root inventory found no submitted MIR, fixed-stack manifest, candidate, command log or result.

## Non-executed by design

No GPU, LLVM installation, artifact download, source-tree modification or formal compiler experiment. Tool absence is recorded solely for reproducibility ceiling, never as the cause of the decision.

## Missing certificate inputs

LLVM commit/subtarget/O-level/time cap; two public MIR corpus hashes and cliff labels; TierFrontier algorithm definition; current LLVM and pressure-list command/output hashes; CP-SAT ceiling ledger.
