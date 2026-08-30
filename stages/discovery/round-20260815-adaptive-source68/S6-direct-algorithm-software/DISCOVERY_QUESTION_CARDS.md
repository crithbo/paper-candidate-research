# Discovery question cards

## S68-01 — Go compiler interprocedural escape classification

| Field | Frozen value |
|---|---|
| Exact identity | Fixed Go package/program and `gc` build configuration; resulting stack/heap classifications and Go language semantics. |
| Same-object oracle | Go compiler diagnostics (`-gcflags=-m=3`) plus language-correct compilation; no run was performed. |
| Candidate contribution type | `COMPILER_TOOL`, proposed N2. |
| Candidate action | Construct jointly chosen interprocedural escape summaries/classifications over variables, allocations, assignments, calls and closures. |
| Claimed endpoint | Safety-preserving allocation classification with analysis/allocation cost trade-off. |
| Current-source locus | `src/cmd/compile/internal/escape/escape.go`: static data-flow analysis and a directed weighted graph of locations/assignments. |
| Natural carrier | Public versioned Go modules/packages; discovery records a finite later route only and did not acquire or build one. |
| Full-cost boundary | Analysis/compiler CPU and RSS, emitted binary/build cost, allocation/GC effects, and runtime costs; all would be measured only under a later authorized fidelity route. |
| Minimum falsifier | A primary general escape-analysis constructor expresses the same graph/summaries/classification mechanism without a Go-specific guarantee. |
| Current result | Falsifier met: the non-generic discriminator does not survive. |

The source and contrary routes are concrete; no source-closure debt is being misreported as an absence claim.
