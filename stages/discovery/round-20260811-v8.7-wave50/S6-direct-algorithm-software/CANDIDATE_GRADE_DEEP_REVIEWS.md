# Candidate-grade deep review — Wave50

## BISON-LR-TABLE-PACK

- Exact object: one fixed, conflict-resolved LR automaton and its action/goto/default tables, emitted as a parser with identical accepted/rejected token sequences and reductions.
- Current source reality: GNU Bison HEAD `25b3d0e1a3f97a33615099e4b211f3953990c203`; current [`src/tables.c`](https://github.com/akimd/bison/blob/master/src/tables.c) is a native table-construction path. Current manual/options and generated-parser representation are the required baseline surface.
- Candidate action tested: a whole-table row/column displacement assignment to reduce table bytes while preserving all lookup results.

| Dimension | Review |
|---|---|
| Decision rule | Assign row bases/displacements and defaults for the complete fixed table. |
| Information | Full fixed LR action/goto matrix; no grammar, profile, or query oracle beyond the baseline. |
| Complexity/resource | Table packing is the direct construction problem; charge packer CPU/RAM, emitted parser bytes, compile time and parser lookup cost. |
| Quality/guarantee | Exact parser table lookup and same reduction behavior; native generated-parser test suite is the oracle. |
| Full cost | Extraction, packing, generated source/object bytes, compiler cost, parser execution and any fallback entries. |
| Generalization/no-gain | Natural grammars could carry it, but no-gain is immediate if it is merely a generic row-displacement solver or is already replayed by Bison's native construction. |

### Collision and decision

The proposed complete action is an instance of the established parser-table packing/construction family, while current Bison already owns the native table-construction path. No source-supported action divergence beyond generic table packing was named. A finite fidelity plan would be possible (small grammar truth-table, generated parser regression, then public grammar corpus), but it would close a routine/replayed construction rather than a nontrivial N2.

`DROP_CURRENT_NATIVE_CONSTRUCTION_PLUS_GENERIC_KERNEL__NO_BRIEF`.

This DROP is not caused by missing implementation, output, resources, or AI readiness.
