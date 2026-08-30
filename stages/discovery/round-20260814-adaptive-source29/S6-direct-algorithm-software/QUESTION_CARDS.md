# Source29 Question Cards

## QC29-01 — AArch64 SME tile/ABI joint construction

- Card / lineage: `QC29-01`; `S29-01` / `RQ29-01`.
- Exact public identity: LLVM 24.0.0git current documentation/source surface for AArch64 SME and MLIR ArmSME conversion; source loci frozen 2026-08-14: `AArch64SME.html`, `AArch64SMEAttributes.h`, and MLIR ArmSME pass documentation.
- Carrier: `CANONICAL_FORMAL_ORACLE`, with LLVM/MLIR ArmSME regression/MIR tests as the finite public carrier route.
- Security scope: `PASS`.

### Problem and contract

Fixed MLIR/LLVM function CFG, SME operation sequence, IR call-site attributes, target features, and AArch64 caller/callee ABI semantics are the object. The proposed question is whether a bounded-state target-specific constructor can jointly select virtual tile-ID bindings and legal lazy-save/streaming boundary representation, yielding a certified `(tile-state preservation, code bytes, transition count)` frontier, rather than independently using current function-mode selection and tile allocation.

- Affected decision: compiler backend engineer selecting an ABI-correct lowering under a fixed target and IR contract.
- Type / route / endpoint: `COMPILER_TOOL` / `N2` / target-native action plus formal legality/Pareto guarantee.
- Non-generic discriminator: the state contains SME-specific PSTATE.SM/ZA interface attributes, ZT0/ZA preservation requirements, and a finite ArmSME virtual-tile namespace; it is not a generic register allocator if the recurrence explicitly preserves these interface transitions.
- Initial full-cost: compile CPU/RSS/temp, emitted code bytes, state-transition instruction count, save-area bytes, and stock verifier/object-semantic checks. Runtime hardware performance is not claimed at Discovery.

### RAW_REQUIRED audit

- Opportunity anchor: official LLVM SME documentation states call-boundary PSTATE.SM changes affect allowed instructions, vector length, and register contents; LLVM inserts `smstart`/`smstop` around boundaries. It also documents an ABI pass handling `aarch64_new_za` and lazy-save mechanisms.
- Current locus: LLVM official `AArch64SME.html`; doxygen `AArch64SMEAttributes.h`; MLIR ArmSME pass docs documenting `-streaming-mode`, `-za-mode`, and conversion-integrated tile allocation.
- Known direct fatal at checked loci: `NONE_FOUND_WITHIN_BOUND`; these loci establish mandatory semantics and present native independent passes, not an already-checked joint certified constructor.
- Strongest objection: the ABI could determine every boundary and existing ArmSME tile allocation could fully absorb the joint action, leaving only generic register allocation.
- Minimum falsifier: a current source route proves the existing conversion jointly optimizes identical tile binding plus ABI boundary state for the same function and cost vector, or the ABI gives no legal alternative on a minimal call/tile witness.
- Finite closure: inspect the current tile allocator and SME ABI lowering paths; write a 2-call/2-tile MIR witness; compare with the nearest same-object compiler literature. Three decisive questions maximum, owner `DISCOVERY_C0_DEEP → STAGE0`.

### Closure debts

| Debt | State | Owner / finite consequence |
|---|---|---|
| Complete current union/default and nondefault modes | `OPEN_BOUNDED` | Stage0 verifies MLIR conversion + backend/ABI sequence; direct joint coverage narrows/drop. |
| Strongest direct collision | `OPEN_BOUNDED` | Stage0 search limited to Arm SME tile allocation and ABI lowering; same-object constructor absorbs/drop. |
| Small legal two-plan witness | `OPEN_BOUNDED` | Stage0 builds a source-level in-tree test; no two legal plans narrows/drop. |
| Reader/checker interface | `CLOSED` | LLVM IR verifier plus object/codegen semantic checks are the stock oracle. |
| Natural/canonical carrier | `OPEN_BOUNDED` | LLVM/MLIR regression selection is finite; absence only limits readiness. |
| Full protocol beyond dimensions | `OPEN_BOUNDED` | StageA preclaim fixes command/version/counters; not a Discovery outcome. |

- RQ audit / raw audit / relation: `RQ_COMPLETE / COMPLETE / FRESH`.
- Disposition: `EVIDENCE_QUALIFIED_RAW`; eligible C0: `YES`.
- Claim ceiling: no claim that a legal alternative, performance gain, or collision absence is already proven.

## QC29-02 — RVV configuration planner

- Card / lineage: `QC29-02`; `S29-02` / `RQ29-02`.
- Exact identity: LLVM 24.0.0git `RISCVInsertVSETVLI.cpp` and RISC-V V extension lowering, fixed LLVM MachineFunction and RVV semantics.
- Carrier: `CANONICAL_FORMAL_ORACLE` with LLVM RISC-V regression/MIR route.
- RAW_REQUIRED audit: source explicitly implements three phases—block VL/VTYPE effect collection, cross-block dataflow propagation, and insertion avoiding redundant first-block configurations; current docs say the pass runs after allocation.
- Strongest objection / direct fatal: this is the proposed whole-CFG configuration state constructor already expressed by the current native pass. Adding register materialization does not yet identify a non-generic target-specific action or guarantee.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_ABSORPTION_KERNEL`; eligible C0: `NO`.

## QC29-03 — Ethos-U cascade/SRAM constructor

- Card / lineage: `QC29-03`; `S29-03` / `RQ29-03`.
- Exact identity: fixed quantized TFLite/TOSA graph, fixed Ethos-U target, Vela-produced command stream/TFLite output and interpreter-visible values.
- Current locus: Arm-maintained Vela public project/docs identify command-stream output and `--optimise`, `--accelerator-config`, output-format and configuration listing interfaces.
- Raw audit: current source tree-level cascade/SRAM action catalogue, stock semantic oracle, and direct collision set were not closed inside the bounded public route; native output intentionally contains only NPU portions in raw mode, which makes a same-object oracle nontrivial.
- Disposition: `LOCATOR_ONLY → SOURCE_CLOSURE_QUEUE`; not a science drop and not an assertion of absent Vela action.

## QC29-04 — Cooperative-matrix region lowering

- Card / lineage: `QC29-04`; `S29-04` / `RQ29-04`.
- Exact identity: fixed SPIR-V cooperative-matrix operation graph and target extension semantics.
- Current locus: official SPIR-V spec defines cooperative matrix layouts and LLVM has current SPIR-V layout symbols.
- Blocking identity fact: target-specific producer/consumer and exact stock oracle remain ambiguous, while the search surface intersects historical SPIR-V/LLVM backend families. This is not a source or implementation negative result.
- Disposition: `LOCATOR_ONLY__IDENTITY_AND_CROSS_LANE_DEDUP_NOT_CLOSED`; eligible C0: `NO`.

## Front-end funnel

`S29-01 → RQ29-01 → QC29-01 raw → C0 → deep → conditional brief`  
`S29-02 → RQ29-02 → QC29-02 excluded before raw (current-union absorption)`  
`S29-03 → RQ29-03 → QC29-03 locator/source queue`  
`S29-04 → RQ29-04 → QC29-04 locator-only`
