# Source43 divergence seed pool

- Assignment/lane: `DISCOVERY-S1-20260815-ADAPTIVE-SOURCE43-GLOBAL-IDENTITY-CLOSURE-CONTINUATION-V1` / S1.
- Generated before evidence lookup: `YES`; network-security: `PASS`; seed count: 8.

| Engine | Seed IDs | Perspective |
|---|---|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | S01 | compiler/backend engineer |
| `PROBLEM_REFRAMING` | S02 | runtime engineer |
| `CONSTRAINT_MANIPULATION` | S03 | ABI maintainer |
| `NEGATION_OR_INVERSION` | S04 | theorist |
| `ABSTRACTION_LADDER` | S05 | compiler/backend engineer |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | S06 | hardware architect |
| `JANUSIAN_TENSION` | S07 | maintainer |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | S08 | runtime engineer |

### S01 — Swift async context forwarding

Swift async functions carry a continuation/context ABI while their producer lowering and runtime resume path separately preserve error and task-local behavior. With the same source program and async/error endpoint, an interprocedural context forwarding construction might be nontrivial only if it is neither tail-call selection nor a runtime scheduler.

### S02 — Wasmtime component memory64 canonical ABI

The component canonical ABI converts component-level strings/lists through core-Wasm memory while memory64 changes pointer/length representation. A same-component-result construction may exist only if the action preserves canonical lift/lower and trap semantics, rather than changing the engine or wrapping the adapter.

### S03 — LLVM byref operand bundle on invoke

LLVM `byref` arguments and operand bundles express call-site ownership while `invoke` adds cleanup/unwind observability. A candidate would need an ABI-specific lifetime/legality construction through exceptional calls, not another preallocated-argument flag.

### S04 — RISC-V floating-point CSR call state

Floating environment state and code generation can disagree at caller/callee seams. This is viable only under a frozen language floating-point and ABI contract, not by relaxing rounding/exception semantics.

### S05 — MLIR transform-handle payload replacement

Transform dialect handles promise validity across payload IR replacement. A verifier/representation result might be possible only if it has a formal invariant and a natural compiler transformation carrier, not a pass-manager wrapper.

### S06 — CUDA device graph launch completion

Device graph launch creates a device-side producer/consumer completion boundary distinct from host graph instantiation. It fails if all decisions are launch configuration or previous graph identity containment.

### S07 — OpenMP detached task event completion

Detached task events separate completion visibility from task body ownership. A same-program invariant may be interesting only if it is not an online scheduler/retry policy.

### S08 — LLVM statepoint exceptional relocation

This is a control identity and is excluded: Source41 retains the exact bounded unresolved family without external delta.

## Pre-evidence convergence

| Selected seed | RQ | Reason |
|---|---|---|
| S01 | RQ01 | ABI/compiler-runtime boundary with a fixed language endpoint |
| S02 | RQ02 | one engine, canonical ABI, pointer-representation seam |
| S03 | RQ03 | LLVM native call-site/EH contract |
| S05 | RQ04 | formal verifier/IR contract control |

S06/S07 remain non-evidentiary backlog; S08 is excluded as active exact identity. No score or observed evidence selected the portfolio.
