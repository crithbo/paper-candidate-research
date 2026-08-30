# Evidence-qualified Question Cards

## RQ-S01-B — RISC-V Zfinx value placement across calls

| Field | Frozen finding |
|---|---|
| Exact identity | RISC-V Zfinx v1.0 and an intended fixed F-ABI C/C++ program. |
| Problem / proposed endpoint | Preserve program and ABI semantics while jointly selecting cross-function floating-value placement. |
| Initial action | Whole-call-graph placement of values among the register resources available to the target. |
| Current-source locus | LLVM current `llvm/docs/RISCVUsage.rst` declares Zfinx support; target implementation is under `llvm/lib/Target/RISCV`. |
| Natural/canonical carrier | RISC-V compiler tests and ordinary C/C++ call graphs, conditional on a valid fixed ABI. |
| Minimal falsifier | The official ISA says that F and Zfinx software are incompatible, or the remaining action reduces to ordinary integer-register allocation. |
| Full-cost boundary | Compile CPU/RSS, code bytes, spills/reloads, call saves, and target execution cost. |
| Decision | **EXCLUDED_BEFORE_RAW__CHANGED_OBJECT_OR_GENERIC_KERNEL.** Zfinx changes the register convention: the official specification explicitly says F-extension and Zfinx software are incompatible. Keeping the F ABI therefore changes the object; freezing Zfinx-native ABI reduces the proposed action to generic RA/spill placement. |

## RQ-S02-B — WebAssembly memory64 representation across a host boundary

| Field | Frozen finding |
|---|---|
| Exact identity | WebAssembly memory64 core draft plus an intended fixed Wasmtime host ABI. |
| Problem / proposed endpoint | Preserve component/module and host-observable semantics while jointly choosing cross-boundary pointer/offset representation. |
| Initial action | Representation/layout construction across module-to-host boundary. |
| Current-source locus | WebAssembly memory64 core draft; Wasmtime upstream repository is the nominated engine source. |
| Natural/canonical carrier | Public memory64 modules/components, conditional on a pinned engine interface. |
| Minimal falsifier | The core specification does not define the intended host ABI, or current engine configuration already owns the representation decision. |
| Full-cost boundary | Compile/translation CPU-RSS, artifact bytes, boundary marshaling latency, and resident memory. |
| Decision | **LOCATOR_ONLY__PUBLIC_EVIDENCE_UNCLOSED.** The core draft intentionally does not fix the embedder ABI; bounded source inspection did not establish a current Wasmtime commit, configuration union, and host-boundary carrier. This is a source-closure debt, not a scientific negative inference. |

No card reached evidence-qualified raw: `fresh_raw_count: 0`.
