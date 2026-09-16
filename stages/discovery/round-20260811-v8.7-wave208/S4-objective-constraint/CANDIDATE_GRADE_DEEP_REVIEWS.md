# Candidate-grade deep reviews

## R01 — Core WebAssembly module constructor

- Same object/guarantee: the same module validates and has the same specified runtime behavior under a conforming engine.
- Strongest executable union: source compiler/linker output plus the complete standard binary grammar, including legal section structure, LEB encodings, and custom sections. A compressor is not part of this union and is forbidden by the assignment.
- Claimed residual tested: a bytes/startup producer that changes emission structure while retaining validation.
- Six dimensions: decision is representation emission; information is module IR; resource is writer CPU/RSS and engine parse/instantiate time; guarantee is validation plus behavior; denominator is compile+artifact+reader cost; generalization would require independently generated modules.
- Finding: without changing code/data/index construction or introducing an external encoding, the alleged action reduces to existing layout/order/encoding choices or cannot promise a distinct load property across engines. The minimal action-divergence witness does not close.
- Decision: `STRUCTURAL_DROP__NO_WHOLE_CONSTRUCTOR_WITNESS_BEYOND_STANDARD_EMISSION_UNION`.

## R02 — .NET ReadyToRun constructor

- Same object/guarantee: same managed application and target RID; IL remains available for unsupported cases.
- Strongest executable union: `PublishReadyToRun`, `PublishReadyToRunExclude`, symbol option, Composite R2R, target RID, and runtime tiered compilation. The official documentation records the relevant file-size, compile-time, and startup trade-offs.
- Atomic action certificate: choose individual versus composite native image, assembly eligibility/exclusion, target, and normal R2R compilation. These are whole native construction actions, not an omitted reader path.
- Minimal witness: a composite image changes cross-assembly construction, but it is expressly already represented by the current producer union.
- Full cost: publish/Crossgen2 CPU, peak RSS/temp, output bytes, cold load/first-use latency, and runtime JIT/tiered replacement are all required.
- 72h killer if a new action existed: one public ASP.NET/dotnet application set, fixed RID and tiering, inspect R2R headers/IL fallback, then compare the union corners under the full denominator. It is finite, but cannot rescue an already represented action.
- Decision: `STRUCTURAL_DROP__CURRENT_R2R_INDIVIDUAL_COMPOSITE_EXCLUSION_UNION_ABSORBS_ACTION`.

## R03 — Erlang BEAM constructor

- Same object/guarantee: same Erlang module behavior when loaded by the matching BEAM VM.
- Strongest union: compiler’s complete BEAM chunk emission and documented compilation options, paired with VM loader semantics. Compression/stripping are native options; an outer packer is prohibited.
- Minimal witness: requested alternative is either an existing chunk omission/compression configuration or changes debug/introspection/loading assumptions, hence no same-guarantee union-external atomic action is frozen.
- Natural route/full cost/killer: OTP and Hex modules; compiler CPU/RSS/temp, `.beam` bytes, VM module-load latency/RSS; verify loading and module behavior on a 20–50 module set. This is a finite route but begins without a legal action witness.
- Decision: `STRUCTURAL_DROP__CONFIGURATION_OR_CHANGED_BEAM_CONTRACT__NO_UNION_EXTERNAL_ACTION`.

## R05 — GNU gettext MO constructor

- Same object/guarantee: same message-key translations under the native gettext MO reader.
- Strongest union: `msgfmt`’s native MO construction, including the available hash-table choice and format-valid string/table layout. External compression and a runtime selector are excluded.
- Minimal witness: the apparent size/lookup trade-off is exactly the hash-table/no-hash constructor choice already in the union. A different arbitrary lookup structure is not consumed by the same MO reader.
- Full cost: PO parse/`msgfmt` CPU-RSS-temp, MO bytes, catalog open and lookup latency/RSS. Natural carrier: GNU and Linux-distribution catalogs.
- 72h killer: build a fixed 20–50 catalog corpus using both native modes, validate every translation using gettext, and account for construction plus reader cost. No experimental result is claimed here.
- Decision: `STRUCTURAL_DROP__CURRENT_MO_HASH_TABLE_CONSTRUCTOR_UNION_ABSORBS_ACTION`.

## Unfrozen raw rows

R04 (V8) lacks a frozen complete same-build mksnapshot action/flag union and therefore remains `NOT_ADMITTED_UNFROZEN`, not a DROP. R06 (TZif) lacks a demonstrated union-external action that preserves the entire historical-time contract; it too remains `NOT_ADMITTED_UNFROZEN`. Neither is rejected for lack of implementation, results, or compute.

