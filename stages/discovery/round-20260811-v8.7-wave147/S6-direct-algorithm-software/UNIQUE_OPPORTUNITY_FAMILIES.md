# Unique opportunity family

## ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION

For a fixed Arrow IPC stream schema and fixed ordered rows, construct the complete legal sequence of record-batch cuts and per-field dictionary events. The reader must materialize exactly the same arrays. The candidate is a state-grammar dynamic program over legal dictionary evolution and multi-column batch boundaries; it is not a generic segmentation problem because feasibility/cost depends on the IPC dependency rule (keys before use), field-bound dictionary state, delta-prefix validity, replacement legality, message alignment and simultaneous batch boundaries.

Status: `PROPOSE_STAGE0` with `FINITE_FIDELITY_GAP`. The residual is structural, not a claimed measured win.
