# Source68 RQ candidates

## Selected primary RQ: S68-01

For a fixed Go program and compiler configuration, can a complete Go-specific joint constructor for interprocedural escape summaries and stack/heap classifications provide a target-specific exact, FPT, approximation, or certified-Pareto guarantee beyond the current compiler's weighted escape graph and the strongest general connection-graph/data-flow escape-analysis baseline, while preserving language semantics?

Falsifier: current Go's action model together with the direct general escape-analysis literature reduces the proposed action/guarantee to ordinary weighted graph reachability, connection graphs, or generic interprocedural data flow.

The RQ is a question, not a claim of a residual.
