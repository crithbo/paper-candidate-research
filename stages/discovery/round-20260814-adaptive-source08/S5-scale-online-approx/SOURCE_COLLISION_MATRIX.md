# Source / collision matrix — Source08 R18V2

| Family | Official/current primary source | Same-object fixed boundary | Comparator union and collision result | Witness / full-cost route |
|---|---|---|---|---|
| CADP BISIMULATOR | [current manual](https://cadp.inria.fr/man/bisimulator.html), [CADP tools overview](https://cadp.inria.fr/tools.html) | Two LTSs plus a selected relation/preorder and its TRUE/FALSE diagnostic. | On-the-fly BES resolution; documented BFS/DFS/tau-confluence and diagnostics are included in the comparator union. Union-external whole action not closed. | Small public LTS/BCG pair, relation-preserving two-output transition, stock verdict/diagnostic; cost = update + comparison CPU/RSS/state bytes. |
| ProB Event-B refinement | [refinement checking](https://prob.hhu.de/w/index.php?title=Refinement_Checking), [CLI reference](https://prob.hhu.de/w/index.php?title=Using_the_Command-Line_Version_of_ProB), [current limitations](https://prob.hhu.de/w/index.php?title=Current_Limitations) | Trace-refinement verdict over fixed abstract/refinement machines. | Saved abstract-state action and refinement checking are directly native. The documented limitation that gluing invariants are not checked prevents silently strengthening the stock guarantee. | Saved-state input pair, `-ref_check` verdict/counterexample; full cost = exploration/save/refinement CPU/RSS/state bytes. |
| mCRL2 LTS bisimulation | [mCRL2 202507 library documentation](https://mcrl2.org/web/developer_manual/library_documentation.html) | Fixed LTS equivalence/reduction object. | Current partition/reduction union not pinned to an atomic update action. | Public LTS/formal model; equivalence oracle; all construction + state cost. |
| Tamarin protocol proof | [Tamarin 1.12 documentation](https://tamarin-prover.com/documentation.html), [manual](https://tamarin-prover.com/manual/master/book/001_introduction.html) | Fixed theory, adversary model and trace property. | Automatic/interative proof search and heuristics make a proposed cache action controller-like until an exact invariant/action is named. | Versioned official example theory; proof/counterexample boundary; search CPU/RSS/proof-state cost. |
| Maude rewrite search | [Maude 3.5.1 manual](https://maude.lcc.uma.es/maude-manual/maude-manual.html) | Fixed rewrite theory and property/checking semantics. | Current action union and exact theorem promise were not closed. | Versioned formal theory, stock verdict, rewrite/state cost. |
| ProB CSP assertion | [CSP assertions](https://prob.hhu.de/w/index.php?title=Checking_CSP_Assertions), [handbook](https://prob.hhu.de/w/index.php?title=Full_Handbook) | Fixed CSP-M assertion and selected refinement/temporal semantics. | Cross-tool collision proximity to prior FDR4 closure; no distinct action statement frozen. | Public CSP assertion, verdict/counterexample, state/CPU/RSS cost.

## Cross-lane / historical exclusions

Source01–07 identities and the registry/history exclusions were applied before raw admission: MachineOutliner, rustc depgraph, eBPF, GCC RTL if-conversion, Swift SIL, Graal NativeImage, Souffle, TLC, OCaml Flambda, Kani, Binaryen, Z3, Rosette, SPIN, CompCert, Frama-C Eva, CakeML, F*, Isabelle, Rocq, Agda, UPPAAL, PRISM, ACL2 and FDR4 are not reused. No proposal signature is emitted.

## Claim ceiling

This matrix is limited to current-source survival triage. It neither asserts implementation absence nor a novel online algorithm.
