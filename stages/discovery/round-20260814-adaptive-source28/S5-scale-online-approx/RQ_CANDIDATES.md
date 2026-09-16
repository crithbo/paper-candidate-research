# RQ Candidates — Source28 S5

All variants below were written and selected before evidence lookup. Within each card, variants share the exact object and immutable semantic contract.

## RQ28-01 — target-ISA MC relaxation

- Seed: S28-01; tentative object: current LLVM MC fixed-target object emission for one ISA and relocation model; type hypothesis `COMPILER_TOOL`.
- RQ-A: Can a local assembly edit be repaired by a target-ISA relocation/relaxation action whose number of rewritten instructions is bounded while emitting stock-reader-equivalent object semantics?
- RQ-B: Under the same target and object-reader semantics, can the relaxation dependency region be constructed with a worst-case bound tighter than whole-section reassembly?
- Selected: RQ-A, because it freezes the action, stock reader, and recourse denominator rather than only compile time.
- Scope: fixed ISA, fixed assembler/object format and relocation semantics; excludes option selection, source-level recompilation policy, changed linker/object-reader semantics, and generic incremental build.
- FINER-lite: feasible `CONDITIONAL` on current MC source/flags and one public object test; interesting `CONDITIONAL`; novelty threat `HIGH`; ethical/scope `PASS`; relevant `CONDITIONAL`.
- Precommitted evidence route: current official LLVM MC docs/source plus a current target test; fallback only for transport failure is release source archive metadata. Earliest falsifier: stock MC already exposes the same local relaxation action/config union.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ28-02 — VTR clustered-netlist update

- Seed: S28-03; tentative object: fixed VTR FPGA architecture, netlist legality and clustered-netlist output; type hypothesis `METHOD_ALGORITHM`.
- RQ-A: Can a small netlist edit be mapped to a legal clustered netlist with a predeclared bound on changed clusters while preserving the same fixed architecture constraints?
- RQ-B: Can the affected architecture-cut be maintained with a certified approximation bound on unchanged-cluster reuse under the same legality contract?
- RQ-C: Is there a stable natural law between edit locality and necessary cluster recourse on a versioned public architecture/netlist carrier?
- Selected: RQ-A, since RQ-B risks generic packing and RQ-C needs a carrier before it is answerable.
- Scope: fixed architecture and stock VTR legality/output; excludes generic placement/packing solvers, threshold controllers, and changed architecture or timing guarantee.
- FINER-lite: feasible `CONDITIONAL`; interesting `CLEAR` for incremental FPGA flows; novelty threat `HIGH`; ethical/scope `PASS`; relevant `CONDITIONAL`.
- Precommitted evidence route: official VTR source/documented packer and architecture checker plus one public regression design; fallback is official release/test metadata. Earliest falsifier: stock packer already expresses bounded local recourse or the proposal is generic packing.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ28-03 — NVDLA feature-map state update

- Seed: S28-04; tentative object: fixed NVDLA graph/compiler feature-map layout and stock generated execution contract; type hypothesis `SYSTEM_ARCHITECTURE`.
- RQ-A: Can a local graph edit induce a bounded-recourse update to a named NVDLA feature-map/buffer state while preserving stock compiled execution semantics?
- RQ-B: Can the same state update minimize peak on-chip buffer relocation subject to exact NVDLA tensor-layout and execution semantics?
- Selected: RQ-A, because B is a cost objective layered on the same action and must not become a scheduler/parameter-grid problem.
- Scope: fixed network operator semantics, NVDLA compiler-visible state and stock execution reader; excludes generic graph partitioning, external memory policy and changed output tolerance.
- FINER-lite: feasible `CONDITIONAL`; interesting `CONDITIONAL`; novelty threat `HIGH`; ethical/scope `PASS`; relevant `CONDITIONAL`.
- Precommitted evidence route: current official NVDLA compiler source/config plus stock test/model carrier; fallback is official release metadata. Earliest falsifier: current compiler's whole native action union already contains the bounded state action.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

No RQ is evidence-qualified raw or a candidate claim at this point.
