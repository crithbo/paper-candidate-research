# Question cards — Source48 S6

## QC-01 — GCC interprocedural identical-code folding

- **Exact identity:** fixed LTO-visible GCC call graph, function/read-only-variable declarations, ABI and source-level behavior. Address identity, externally visible symbol contracts and unwind observability remain fixed constraints; an action requiring changed observations is not same-object.
- **Question / endpoint:** reduce native code size by legally merging only semantically identical declarations while preserving the stated behavior and object/link contract.
- **Counterfactual consequence:** without the proposed constructor, two behaviorally equal declarations remain separately emitted; with it, a legal merge can use an alias, redirected call, thunk or permitted virtual clone.
- **Non-generic discriminator:** candidate must provide a GCC-ICF-specific semantic-class and realization guarantee, not frequency grouping, a general graph partitioner, a linker wrapper or an option choice.
- **Current-source reality check:** current upstream `ipa-icf.cc` identifies itself as the interprocedural ICF pass for functions and read-only variables; it visits declarations, builds semantic items, hashes, deep-compares, value-numbers congruence classes, then merges through aliases or callgraph redirects/thunks. Official optimization documentation says `-fipa-icf` covers functions and read-only variables, can use LTO, and is default at `-O2`/`-Os`; its documented subflags are part of the union.
- **Strongest current union:** `-O2/-Os` ICF defaults, `-fipa-icf-functions`, `-fipa-icf-variables`, LTO-visible semantic comparison, hash/deep comparison, value numbering, class merge and legal alias/redirect/thunk/clone realization.
- **Witness and falsifier:** two same-behavior local functions could in principle remain separate or be redirected to one representative. The current producer already names the equivalent declaration class and the legal realization actions. Any alleged residual fails if that pair passes the current semantic comparison and merge realization; otherwise the remaining proposal is either non-identical semantics or a generic selector.
- **Natural carrier / oracle:** versioned GCC testsuite LTO cases and public C/C++ LTO-capable programs; compiler/link completion, regression behavior, object symbols/relocations and applicable unwind inspection.
- **Full cost:** whole-program analysis and compile CPU/RSS/temp; LTO/link CPU/RSS; code/object bytes; symbol/relocation/unwind deltas; and load/start-up consequences where applicable.
- **Finite 72-hour killer:** pin one GCC revision and two small, LTO-visible equivalent functions; inspect the ICF dump/current output and reject the candidate if stock ICF classifies and legally merges them, or if preserving visibility/unwind semantics forbids the proposed merge.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_PRODUCER_DIRECTLY_CONSTRUCTS_SEMANTIC_CLASS_AND_MERGE_ACTION`.

No Question Card was made for the remaining locators because their exact carrier/action/endpoint did not jointly close. They are not evidence-qualified raw rows.
