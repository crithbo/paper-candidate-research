# Source28 Evidence-Qualified Question Cards

## QC01 — x86 AMX joint tile-configuration placement and binding

- RQ lineage: `S01` → `RQ01-A`.
- Exact identity / deterministic version: current LLVM 23.0.0git source documentation for `X86PreTileConfig.cpp` and `X86TileConfig.cpp`; fixed x86 AMX `MachineFunction`, tile shapes, calls, code-object ABI and numerical output.
- Same-object problem: jointly construct legal `ldtilecfg` placement and AMX tile physical binding for one fixed machine function, without changing AMX operation, call-clobber or code-object semantics.
- Claim endpoint and counterfactual: an exact/FPT constructor parameterized by the eight AMX tile registers and finite shape states could return a lexicographically optimal legal plan (configuration reloads, then configuration-related spill/reload/code-size cost). If true, it can replace the current sequential composition without changing function output or ABI.
- Atomic action: choose (i) a legal configuration-dominance/reload placement across a call/CFG boundary and (ii) a physical tile-to-shape binding consistent with the same placement; these are not generic scheduling/RA actions because `ldtilecfg` carries one hardware configuration shared by the fixed AMX tile register file and is caller-saved.
- Non-generic discriminator: the state contains AMX-specific tile shape bytes/rows for the eight physical TMM registers, caller-clobber semantics, and dominating configuration placement; an arbitrary register allocator lacks this fixed configuration object.
- Current-source locus: `X86PreTileConfig.cpp` computes configuration-live and insertion points before RA, reloads after destructive calls, may emit failure when reachability cannot be satisfied, and explicitly reports cross-block shape-hoist as an unhandled path. `X86TileConfig.cpp` subsequently consumes `VirtRegMap` physical bindings and writes the eight-register tile configuration.
- Natural/canonical carrier: LLVM’s public AMX test programs/MIR/MC tests and the documented MLIR AMX tile load/zero/multiply/store operations; carrier is `CANONICAL_FORMAL_ORACLE` pending Stage0 confirmation of a public AMX workload family.
- Minimum falsifier: one legal small AMX CFG with two configurations/call clobber must either (a) have no two same-output legal configuration/binding plans, (b) be fully optimized by current PreTileConfig→RA→TileConfig composition, or (c) force the candidate to change ABI/output.
- Finite fidelity closure plan: pin one LLVM commit; extract the three current passes and `+amx-tile`/ManagedRA path; construct two static legal plans on one in-tree AMX test; use stock assembler/disassembler and code-object/IR semantics; then compare construction cost, code bytes, compile CPU/RSS/temp and any configuration spill/load instructions. Owner: independent Stage0, then Stage A if admitted.
- Initial full-cost dimensions: source transform time, RA/configuration time, compile CPU/RSS/temp, instruction/code bytes, configuration reloads, spills/reloads, and fixed-kernel runtime only after Stage A authorization.
- Required-field audit: `COMPLETE` for evidence-qualified raw under Source28. Current-union enumeration, direct paper collision, complete witness and main outcome are bounded closure debt, not claims of completion.
- Disposition: `FRESH_RAW_OPPORTUNITY`; eligible for C0.

## QC02 — GPU async-copy/barrier group construction

- RQ lineage: `S02` → `RQ02-A`.
- Exact object is not frozen: no target-specific ISA, compiler producer, validator, or content-addressable public kernel had been named before source closure.
- Disposition: `LOCATOR_ONLY`; this absence of identity is a front-end scope failure, not scientific failure.

## QC03 — RISC-V Zfa rounding-preserving form construction

- RQ lineage: `S04` → `RQ03-A`.
- Current evidence: ratified Zfa v1.0 defines immediate, min/max, round-to-integer, conversion, move and comparison forms. Current LLVM source makes operation legality/custom lowering conditional on `hasStdExtZfa()`.
- Subtraction: the RQ’s initial “choose instruction form for fixed expression” reduces to current target legality and ordinary instruction selection. No AMX-like coupled target state or non-generic guarantee was specified.
- Disposition: `STRUCTURAL_DROP__GENERIC_INSTRUCTION_SELECTION_KERNEL`; not related to missing implementation/result/resource.
