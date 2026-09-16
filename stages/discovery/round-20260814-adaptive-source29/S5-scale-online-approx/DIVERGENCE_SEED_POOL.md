# Source29 S5 divergence seed pool

- Assignment / lane: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE29-RQ-PRODUCTION-V1` / S5
- Seed ceiling: 12; generated before evidence lookup: YES
- Network-security exclusion: PASS

## Coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| BISOCIATION_STRUCTURAL_TRANSFER | yes | S29-01 |
| PROBLEM_REFRAMING | yes | S29-02 |
| CONSTRAINT_MANIPULATION | yes | S29-03 |
| NEGATION_OR_INVERSION | yes | S29-04 |
| ADJACENT_POSSIBLE_OR_BOUNDARY | yes | S29-05 |
| COMPOSE_DECOMPOSE_SIMPLIFY | yes | S29-06 |

### S29-01
- Perspective: hardware architect. Idea: preserve a fixed iCE40 bitstream while repairing a changed constrained netlist with bounded displaced sites. The cautious conclusion would be a device-specific recourse bound, not generic P&R speed.
- Risk: native pack/place/route may already be the entire action union. Relation: `FRESH_SKETCH`; noun-swap: PASS; disposition: KEEP_FOR_CONVERGENCE.

### S29-02
- Perspective: backend engineer. Idea: a physical-design repair could retain legal placement/routing after a local timing edit, instead of restarting a flow. The endpoint must retain exact DEF/DRC/timing semantics.
- Risk: it reduces to OpenROAD repair commands or threshold selection. Relation: `FRESH_SKETCH`; noun-swap: PASS; disposition: KEEP_FOR_CONVERGENCE.

### S29-03
- Perspective: verification engineer. Idea: a versioned CSR schema could preserve equivalence among RTL, UVM and C outputs after a local register-map edit with a checker-backed action. The target must be a fixed native schema semantics, not a multi-backend wrapper.
- Risk: generic code generation/plugin selection. Relation: `FRESH_SKETCH`; noun-swap: PASS; disposition: KEEP_FOR_CONVERGENCE.

### S29-04
- Perspective: compiler engineer. Idea: retain an existing hardware-IR lowering under a local legality constraint while proving no output-semantic change. A contribution would require a target-specific lowering primitive, not generic CIRCT/FIRRTL pass orchestration.
- Risk: generic formal/compiler wrapper. Relation: `FRESH_SKETCH`; noun-swap: GENERIC_SHELL; disposition: GENERIC_SHELL.

### S29-05
- Perspective: operator. Idea: a public RTL-to-GDS design corpus might expose a stable boundary where full repair costs cliff after one local edit. It could only be N3 with a verified natural carrier and reusable characterization.
- Risk: measurement without causal mechanism/current action. Relation: `FRESH_SKETCH`; noun-swap: PASS; disposition: KEEP_FOR_CONVERGENCE.

### S29-06
- Perspective: theorist. Idea: formulate bounded recourse for target-specific FPGA placement subject to bitstream legality. It requires a public architecture, exact checker, and a construction rather than generic matching.
- Risk: generic solver and absent carrier. Relation: `FRESH_SKETCH`; noun-swap: PASS; disposition: KEEP_FOR_CONVERGENCE.

## Convergence

| Cluster | Seeds | Representative | RQ candidate |
|---|---|---|---|
| device-native P&R recourse | S29-01, S29-06 | S29-01 | RQ29-A |
| physical-design local repair | S29-02, S29-05 | S29-02 | RQ29-B |
| checked CSR generation | S29-03 | S29-03 | RQ29-C |

`S29-04` stays backlog as generic-shell. The three selected clusters retain distinct object, action, and carrier hypotheses. Coverage advisory: PASS; engines: 6; perspectives: 6.
