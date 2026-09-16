# Source30 RQ candidates

## RQ30-A — ECP5 configuration recourse
- Same object: fixed ECP5 device, legal tile configuration and stock bitstream semantics.
- Variants: bounded tile-state update after local netlist change; target-specific route/config legality certificate.
- Pre-evidence selected RQ: Does current Project Trellis expose a non-generic, union-external legal state transition with a target-specific recourse guarantee?
- Falsifier: only generic config conversion/P&R can be named. Primary route: official `prjtrellis` source.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ30-B — SV source conversion
- Same object: SystemVerilog input and Verilog output under stock conversion semantics.
- Selected RQ: Is any bounded-change constructor target-specific rather than a generic language-transformation pass?
- Falsifier: converter options already describe generic source conversion. Primary route: official sv2v release/source.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ30-C — Rocket configuration generation
- Same object: Rocket configuration to generated RTL.
- Selected RQ: Does a stock configuration action leave a target-specific checker-backed constructor residual not owned by the generator project?
- Falsifier: the repository itself is the complete parameterized constructor. Primary route: official Rocket Chip README.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.
