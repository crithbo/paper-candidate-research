# Source-only closure

## C01 — Wasmtime component async ABI / continuation lifetime

- Pinned exact object: Wasmtime 43+ running a component with the WASI 0.3 async ABI (`async func`, `stream<T>`, `future<T>`), fixed component result/trap semantics and fixed instance/resource ownership.
- Current official triad: (1) Component Model async design defines the Canonical ABI primitives; (2) Wasmtime's running-components documentation explicitly documents runtime support in Wasmtime 43+ and its `-Sp3 -W component-model-async=y` entry; (3) current Wasmtime API documents the `component-model-async` feature, `wasm_component_model_async` configuration and async component host APIs.
- Complete current union: default component-model support plus the async crate feature/configuration, CLI proposal and async flags, `*_async` component linker APIs, and Wasmtime's documented native-stack/future execution model. The runtime represents async computation as a `Future`; pending host calls switch away from a separately allocated native stack, with executor/thread-pool management retained by the embedder.
- Proposed action reassessment: continuation/table layout or ownership transition within that fixed object is already part of the component async ABI/runtime action space. A cross-entrypoint layout pass would be target-generic representation compaction; changing cancellation/finalization/host scheduling changes the object/guarantee or becomes a controller.
- Natural route/oracle: official component-model/WASI async tests and Wasmtime component tests; ABI validation plus observable future/stream results. Full cost would include component compile CPU/RSS, bytes, native-stack/continuation memory, suspend/resume and cancellation/finalization work.
- 72-hour killer closed statically: if the candidate cannot differ from current async ABI ownership without changing cancellation, resource or scheduling semantics, it is not a same-object N2. The documented configuration/source contract confirms that condition.
- Result: `STRUCTURAL_DROP` by current-union absorption/generic-kernel reduction. This is not based on missing results, implementation or resources.

## Fresh-family action cards

### Split stacks

LLVM's official segmented-stack documentation defines the prologue's stack-limit check, `__morestack` call, copied argument count, continuation entry and double-return. Those are ABI commitments; joint changes either alter them or collapse to target prologue scheduling. `STRUCTURAL_DROP`.

### RISC-V atomics ABI

LLVM's current RISC-V guide says A6S is the default mapping compatible with A6/A7 and identifies a current linker-attribute emission compatibility issue. The residual is ABI/mapping selection rather than a same-program construction. `STRUCTURAL_DROP`.

### ASan UAR

Clang's official ASan guide specifies `never/runtime/always` modes and runtime flag behavior. Selecting/interpolating these is an instrumentation policy and changes the diagnostic contract. `STRUCTURAL_DROP`.

### AArch64 volatile register / dynamic stack restoration

LLVM LangRef specifies `FAKE_USE` preservation behavior for `write_volatile_register` and the direct `stacksave/stackrestore` contract. Each proposed residual is generic liveness/cleanup transformation, not target-specific N1/N2. `STRUCTURAL_DROP`.
