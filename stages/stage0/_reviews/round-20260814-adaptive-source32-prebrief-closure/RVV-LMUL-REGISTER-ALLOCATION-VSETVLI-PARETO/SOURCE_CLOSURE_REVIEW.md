# RVV LMUL register allocation / vsetvli Pareto — prebrief source closure

## Scope and decision

- Assignment: `STAGE0-P1-20260814-RVV-LMUL-REGISTER-ALLOCATION-VSETVLI-PARETO-PREBRIEF-CLOSURE-V8.7`
- Mode: `PREBRIEF_SOURCE_CLOSURE`, not a full Stage 0 paper-potential review.
- Disposition: `NOT_ADMITTED_UNFROZEN__BOUNDED_SOURCE_OR_WITNESS_CLOSURE_INCOMPLETE`
- Confidence: `0.86`
- Stage A/B: not authorized.

The current-source pass ordering and shared state make the question attackable, but this bounded closure does not yet pin the required public fixed-semantics two-plan IR/MIR witness or the complete target/feature/RA action envelope. It would therefore be incorrect either to promote a clean brief or to call a generic/current-union structural drop. The correct outcome is bounded unfrozen closure debt.

## Isolated resource and source pin

Resource-localization V1 was completed before acquisition: the eight required resource directories, durable inventory, immutable run snapshots, and process-local redirect preflight all reside in this assignment directory. The current official LLVM pin is `72edcedcdf0a8de68338e9b42f4effd1f21e9725`.

Retained primary source evidence:

| Blob | SHA-256 | source fact |
|---|---|---|
| `RISCVTargetMachine.cpp` | `E248815BF3AA066B8C10F9101C3D9574BA97B7C212B130B14765CB23FD16B297` | RVV allocation is explicitly followed by `RISCVInsertVSETVLI`; fast/basic/greedy RVV allocator choices exist. |
| `RISCVInsertVSETVLI.cpp` | `5EBC9690C63A59D0A216F7340696206D28E510D2B58DE7353B835777BB98AC8C` | current pass computes cross-block VL/VTYPE dataflow, performs PRE, emits configurations, then coalesces them. |
| `RISCVRegisterInfo.cpp` | `DE669556F3E5773E7BE48190ED56C26ED33B52F365B735C07F6F87ABF8E96EF5` | scalable vector spill/reload handling has LMUL/group-sensitive alternatives and can choose `vsetvli`-based VLEN access to preserve VL/VTYPE state. |

The pinned files are official LLVM source under its Apache-2.0-with-LLVM-exception license; exact local provenance is recorded in `RESOURCE_INVENTORY.yaml`.

## What the bounded audit closes

1. The purported two phases are genuinely distinct in current LLVM: RVV register allocation (including allocator choice) precedes `RISCVInsertVSETVLI` in both fast and optimized pipelines.
2. The latter phase is not a trivial local emitter: it tracks VL/VTYPE across basic blocks, performs partial-redundancy elimination and coalescing, then inserts required configurations.
3. LMUL/group/spill handling has a semantic connection to the configuration state: register-info code chooses grouped spill/reload forms and explicitly avoids disturbing VL/VTYPE in prologue/epilogue cases.

These facts support the discovery note's limited proposition that `(LMUL, VTYPE, AVL)` is a non-product **action skeleton**. They do not yet prove a union-external N2 method.

## What remains unfrozen

| Required bounded question | status | why it blocks admission |
|---|---|---|
| One public fixed-semantics IR/MIR witness | OPEN | no pinned test plus two complete native-legal plans was retrieved or reconstructed; without it allocation-induced vtype/VL divergence remains hypothetical. |
| Complete current feature and RA envelope | PARTIAL | source confirms allocator alternatives and ordering, but this closure has not frozen all target flags, vector pseudo formation and spill/rematerialization entry points. |
| Same-function two-plan action table | OPEN | physical group allocation must be shown to change mandatory spill/rematerialized configuration state while vector semantics, ABI and output remain fixed. |
| State-erasure/product-factorization outcome | OPEN | source establishes a connection, but no witness determines whether every legal plan is reproduced by current RA followed by dataflow minimization. |
| Bounded direct collision | SEARCH_BOUNDED_OPEN | no direct external collision claim or absence claim is made. |

The official documentation request that returned 404 is only a retrieval detail; it is not scientific evidence and does not change the decision.

## Promotion condition

The same topic may enter full Stage 0 PRIMARY only after a new frozen source-closure packet names one public LLVM RVV regression and a pinned target/feature/pipeline mode, enumerates two complete same-function native-legal plans, and gives a static action table showing that LMUL-group allocation changes a required VTYPE/VL transition or spill/rematerialization action which current post-RA `RISCVInsertVSETVLI` cannot reproduce. That packet must preserve ABI, vector results and object semantics, and must state a finite target-specific frontier/guarantee rather than generic RA/ILP.

No implementation, build, experiment, performance result, or full literature proof is required for that next bounded closure. None was performed here.
