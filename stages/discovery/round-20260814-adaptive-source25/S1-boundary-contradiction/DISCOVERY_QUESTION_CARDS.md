# Discovery question cards

All cards were created after the offline seed-pool selection. `LOCATOR_ONLY` means the item is outside the scientific raw/C0 denominator and is neither a scientific STOP nor a claim of absence.

## QC-L01 — OpenMP detachable task completion

- Source divergence seed: `S01`, `PROBLEM_REFRAMING`, task/runtime-state cluster; lenses `PROBLEM_FIRST`, `BOUNDARY_OR_FAILURE`.
- Exact public identity: OpenMP detachable explicit task and its allow-completion event, OpenMP 5.2 HTML revision `95b2e3a44` (official page inspected 2026-08-14); carrier: natural async I/O and GPU/MPI-style callback programs illustrated by the official examples.
- Network-security exclusion: PASS.
- Problem / insight: A detachable task completes only after both block completion and allow-completion event fulfilment. A possible compiler/runtime contribution would require a fixed task graph and a complete non-scheduler joint action over task-frame and event dependencies.
- Contract attempted: same source program and OpenMP completion/dependence semantics; `COMPILER_TOOL`, possible N2 endpoint; full cost would include compiler time, task-frame bytes, runtime metadata, and completion latency.
- Primary anchor: the official task semantics and `omp_fulfill_event` sections; LLVM OpenMP runtime source tree was located at current `main`.
- Current union / contrary: the specification deliberately leaves scheduling and implementation choices to conforming runtimes; the inspected runtime-tree landing page did not pin implementation symbols, flags, compiler lowering, or a strongest same-information composition.
- Minimum falsifier / closure: source-pin Clang lowering plus libomp task/event paths and identify a concrete legal two-action task graph; compare against current compiler+runtime path on a public async task corpus.
- Required-field audit: INCOMPLETE (current action union, strongest subtractor, and finite native witness are not frozen).
- Identity relation: UNKNOWN after bounded registry/history subtraction; disposition: `LOCATOR_ONLY`; C0: NO.

## QC-L02 — Component Model resource ownership / canonical ABI

- Source divergence seed: `S02`, `CONSTRAINT_MANIPULATION`, component-ABI-ownership cluster; lenses `TENSION_OR_PARETO`, `STRUCTURAL_TRANSFER`.
- Exact public identity: WebAssembly Component Model WIT resource handles and owned/borrowed transfer across component boundaries; official Bytecode Alliance Component Model documentation inspected 2026-08-14; carrier: public WIT packages/components.
- Network-security exclusion: PASS.
- Problem / insight: WIT resources are non-copyable handles, can be owned or borrowed, and an owned resource is destroyed on drop unless transferred. A potential contribution would be a semantics-preserving component-artifact construction, not a runtime adapter.
- Contract attempted: fixed WIT world/import/export and owned/borrowed observable behavior; `COMPILER_TOOL`, possible N2; full cost would include component bytes, adapter/codegen work, calls, and memory.
- Primary anchor: official WIT documentation states both the interface-only nature of WIT and resource ownership/borrowing; it points to the upstream component-model specification.
- Current union / contrary: canonical-ABI page retrieval failed safely and no current producer/engine commit, flag union, natural corpus version, or direct paper collision was frozen. The existing Source03 Wasm async-ABI work is an adjacent historical control, not evidence of a residual.
- Minimum falsifier / closure: pin one component producer and one engine; freeze canonical-ABI lift/lower/resource-drop paths and a public versioned component corpus; reject if the action is only adapter or binding-generator selection.
- Required-field audit: INCOMPLETE (identity version, current native union, subtractor, and finite witness absent).
- Identity relation: UNKNOWN; disposition: `LOCATOR_ONLY`; C0: NO.

## QC-L03 — Level Zero regular/immediate command-list event state

- Source divergence seed: `S03`, `JANUSIAN_TENSION`, accelerator-command-state cluster; lenses `WHAT_CHANGED`, `TENSION_OR_PARETO`.
- Exact public identity: Level Zero command-list recording/submission and event ordering; official Level Zero specification landing page inspected 2026-08-14; intended carrier: public Level Zero samples or application command traces.
- Network-security exclusion: PASS.
- Problem / insight: The seed contrasts reusable recorded lists with device-visible immediate submission, but the desired contribution would have to retain the same command/event ordering and name a non-generic construction action.
- Contract attempted: fixed command stream, device/event observable semantics, `SYSTEM_ARCHITECTURE`, possible N2; proposed full cost: host construction CPU/RSS, command memory, submission latency, and device timeline.
- Current union / contrary: official landing page supplied no rendered semantic content in the bounded response. No current driver/source commit, default/nondefault paths, stock oracle, natural trace, or direct subtractor is frozen.
- Minimum falsifier / closure: pin a Level Zero loader/driver revision and the relevant immediate/regular command-list source routes, then establish two stock-legal constructions with identical command/event semantics.
- Required-field audit: INCOMPLETE (current source/flag union, natural carrier version, and witness absent).
- Identity relation: UNKNOWN; disposition: `LOCATOR_ONLY`; C0: NO.

## QC-L04 — RISC-V Hypervisor VS/HS trap-return state

- Source divergence seed: `S04`, `BISOCIATION_STRUCTURAL_TRANSFER`, ISA-privilege-state cluster; lenses `BOUNDARY_OR_FAILURE`, `COMPOSE_DECOMPOSE_SIMPLIFY`.
- Exact public identity: RISC-V H extension VS/HS trap entry and `SRET`/`MRET` state transitions, official ratified H-extension page inspected 2026-08-14; carrier would be public hypervisor/guest exception programs.
- Network-security exclusion: PASS.
- Problem / insight: The specification fixes virtualization and status-bit transitions at trap entry/return. Any compiler/runtime action must preserve the same guest-visible ISA and ABI semantics rather than reinterpret exception behavior.
- Contract attempted: fixed guest program, H-extension state and exception semantics; `COMPILER_TOOL` or `SYSTEM_ARCHITECTURE`, possible N2; full cost would include compiled code, save/restore work, emulated cycles, and memory.
- Current union / contrary: the ratified spec describes delegation and return behavior, including `SRET` state updates. No current LLVM/GCC/QEMU/hypervisor complete union, ABI/recovery action, direct paper collision, or finite natural corpus has been source-pinned.
- Minimum falsifier / closure: pin one toolchain and emulator/hypervisor, enumerate legal VS/HS state-save paths, and find a same-information two-action witness under a frozen ABI.
- Required-field audit: INCOMPLETE (toolchain/runtime union, strongest subtractor, witness, carrier version).
- Identity relation: UNKNOWN; disposition: `LOCATOR_ONLY`; C0: NO.

