# RQ candidates — Source48 S6

## RQ-01 — GCC IPA identical-code folding

For a fixed LTO-visible C/C++ program whose selected functions and read-only variables have the same source-level behavior, can a whole-program constructor discover semantic equivalence classes and realize valid aliases, redirects, thunks, or clones with a target-specific guarantee beyond current GCC ICF?

- **Exact object / endpoint:** fixed GCC call graph, declarations, LTO visibility, ABI and source-level observable behavior; output is a behavior-preserving native object with a code-size/compile-cost boundary.
- **Candidate action:** classify declarations, construct semantic congruence classes, then select legal alias/redirect/thunk/clone realizations.
- **Stock oracle:** GCC-produced object/link success, program regression behavior, symbol/relocation and applicable unwind inspection.
- **Natural carrier:** versioned GCC testsuite and public LTO-capable C/C++ programs.
- **Preliminary falsifier:** current ICF already visits all relevant functions/read-only variables, hashes/deep-compares them, value-numbers classes, and realizes aliases/call redirects/thunks for the same semantic endpoint.

RQ-01 is the sole same-object RQ. S02 remains a locator because it does not yet freeze a single carrier, action, and non-generic guarantee.
