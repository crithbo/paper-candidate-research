# Source29 research-question convergence

## RQ29-A — nextpnr iCE40

- Object: fixed iCE40 architecture, JSON netlist/PCF and ASC/bitstream output.
- Variants: (A) bounded recourse after a local netlist edit; (B) a target-specific placement/routing certificate with unchanged bitstream semantics.
- Selected pre-evidence question: Does a public current nextpnr iCE40 primitive expose a legal, union-external local transition whose recourse can be bounded while preserving stock ASC/bitstream semantics?
- Falsifier: current native pack/place/route union already covers the only named action, or no target-specific primitive can be named.
- Primary route: official nextpnr source/docs and iCE40 example; fallback: none needed.
- FINER-lite: feasible CONDITIONAL; interesting CONDITIONAL; novelty threat HIGH; scope PASS; relevant CONDITIONAL.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ29-B — OpenROAD local repair

- Object: fixed public PDK/design plus OpenROAD database/DEF and signoff constraints.
- Variants: (A) bounded replacement of changed cells/routes after one legal local timing edit; (B) characterization of repair-cost cliffs under stock semantics.
- Selected pre-evidence question: Is there an atomic repair action absent from the current OpenROAD placement/resize/detail-route union while preserving DRC/timing semantics?
- Falsifier: current flow already supplies the proposed repair chain or the intervention is only a flow trigger.
- Primary route: official OpenROAD source and flow scripts; fallback: none needed.
- FINER-lite: feasible CONDITIONAL; interesting CLEAR; novelty threat HIGH; scope PASS; relevant CONDITIONAL.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ29-C — RgGen checked CSR outputs

- Object: fixed register-map input and generated RTL/UVM/C-header/document outputs.
- Variants: (A) schema-local output update with cross-output equivalence; (B) bounded-recourse native register-map constructor.
- Selected pre-evidence question: Does RgGen expose a target-specific, checker-backed native action beyond output-backend/plugin composition?
- Falsifier: output generation is deliberately multi-backend/plugin generic with no fixed stock oracle.
- Primary route: official RgGen source/sample; fallback: none needed.
- FINER-lite: feasible CONDITIONAL; interesting CONDITIONAL; novelty threat HIGH; scope PASS; relevant UNCLEAR.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.
