# Question cards

## QC01 — GCC IPA constant-propagation clone set

- **Exact identity:** fixed C/C++ translation unit/LTO call graph, target ABI, optimization/profile input and observable program behavior.
- **Problem / estimand:** construct the legal constant-specialization clone and call-rewrite set; compare total compilation, artifact-size and execution costs under the same profile information.
- **Endpoint / counterfactual:** a target-specific certified frontier or parameterized guarantee, not a different optimizer flag choice.  Without it, the counterfactual is only a clone-selection policy.
- **Non-generic discriminator:** legal clone creation/rewrite is already native; an admissible N2 would need a semantic/target structure that makes the joint choice more than generic weighted selection.
- **Current-source locus:** GCC current `Optimize-Options.html`, `-fipa-cp` and `-fipa-cp-clone`; source locus `gcc/ipa-cp.cc` on the official GCC Git service, queried at `master` on 2026-08-15.
- **Current docs/default/non-default reality check:** the current manual says IPA CP is enabled at `-O2/-Os/-O3` and profile modes; `-fipa-cp-clone` causes cloning for externally visible functions with constant arguments and is enabled at `-O3` and profile modes.  Option index also lists the disabling forms.  The source-service plain-file request was attempted but the public browser rejected the semicolon query as unsafe; no absence claim is inferred from that access failure.
- **Minimal falsifier:** show that any claimed recurrence uses only generic candidate weights/conflict selection, or that current IPA CP already implements the proposed target-specific invariant.
- **Natural carrier / oracle:** versioned GCC testsuite C/C++ tests; identical program output, exit status and linker/ABI acceptance.  These are a finite Stage0/StageA route, not executed here.
- **Full-cost boundary:** IPA analysis, clone construction and temporary state; compiler/linker CPU/RSS; text/data bytes; fixed-workload execution and instruction-cache/call effects.
- **Disposition at C0:** `KNOWN_GENERIC_REMAINDER__NOT_EVIDENCE_QUALIFIED_RAW`.  The two plans demonstrate action freedom, but the only stated guarantee is generic multiobjective clone selection.  No missing implementation, result, resource, or AI-readiness finding is used.
