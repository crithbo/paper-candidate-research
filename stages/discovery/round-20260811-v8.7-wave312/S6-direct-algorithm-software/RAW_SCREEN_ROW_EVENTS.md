# Source-level event record

| finding | first-party anchor | effect on candidate |
|---|---|---|
| CBMC documents front end/GOTO model, `goto-symex`, equation solving and counterexample construction. | official CBMC architecture docs | fixed native semantics and whole pipeline are identifiable |
| `goto-symex` incrementally appends SSA steps while traversing, branching/merging and unwinding. | official goto-symex docs | equation construction is not an unstructured emitter |
| current options include slicing, unwind controls, incremental loops, path exploration, complexity limits and caching. | official man/source docs | fair comparator is a full action/configuration union |
| source contains formula slicing and simple slicing actions; threading changes slicing applicability. | official source docs | local equation differences are already current native choices |

