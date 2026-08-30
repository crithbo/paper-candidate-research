# Q1/Q2 comparator matrix — CVC5-ALETHE-SHAREMAP

## Candidate paper shape after correction

The viable shape is not “add Alethe sharing to cvc5”; current cvc5 already has it. The only potentially publishable shape is a native, scope-aware and costed selection algorithm demonstrably stronger than current threshold letification, with exact proof preservation and natural full-cost evaluation.

| Comparator | Venue / year | Actual object and contribution | What it subtracts | What a viable candidate must add | Calibration |
|---|---|---|---|---|---|
| Barbosa et al., **cvc5: A Versatile and Industrial-Strength SMT Solver** | TACAS 2022 | Industrial SMT solver architecture, proof production and broad empirical evaluation | A thin emitter patch is not a standalone systems contribution; integration and broad correctness/evaluation are expected | A reusable algorithmic abstraction, native integration, correctness argument and broad natural evidence | Q1-equivalent top formal-methods conference shape |
| Schurr et al., **Alethe: Towards a Generic SMT Proof Format** | PXTP 2021 | Alethe proof language, named-term sharing and multi-prover/checker ecosystem | Syntax, named sharing and generic proof portability are prior work | cvc5-specific selection algorithm beyond format support and current implementation | Collision/method anchor, not itself Q1 calibration |
| Fleury et al., **Carcara: An Efficient Proof Checker and Elaborator for SMT Proofs in the Alethe Format** | TACAS 2023 | Efficient checking/elaboration with an executable artifact | Checker engineering, proof acceptance and elaboration are not candidate novelty | Same-checker exactness plus an independent construction algorithm and end-to-end cost result | Q1-equivalent artifact-backed tool paper shape |
| Current cvc5 `AletheProofPrinter` + `AletheLetBinding` | Upstream source/docs, accessed 2026-08-09 | Native traversal, threshold-driven letification and `:named @p_*` output | The frozen missing-action claim and no-sharing strongest baseline | Residual beyond every preregistered current threshold setting | Decisive same-object current-source comparator |
| veriT `--proof-with-sharing` | Upstream Alethe/veriT implementation | Sharing-capable Alethe producer from a different solver proof | Generic sharing mechanism and feasibility | Same-cvc5-proof algorithm; cannot claim generic Alethe sharing | External subtractor, not same-proof baseline |
| cvc5 CPC + Ethos | Current upstream proof path | Different proof format/calculus and checker for the same theorem | Broad “make cvc5 proofs compact/checkable” framing | Alethe-specific, same-rule result | Cross-format reference only |

## Shape verdict

- Present frozen shape: below Tier B because the missing native action is already implemented.
- Corrected conditional shape: `TIER_B_Q2_VIABLE` if it supplies a nontrivial current-baseline residual, algorithmic guarantee/structure, exact native integration, and natural full-cost Pareto evidence.
- `TIER_A_Q1_POTENTIAL`: not supported at Stage 0. It would require stronger reusable theory/algorithm content and broader generality than one cvc5 emitter optimization.

## Fairness matrix

| System | Same theorem | Same cvc5 proof/rules | Same Alethe format | Same checker | Same information/actions | Role |
|---|---:|---:|---:|---:|---:|---|
| Current cvc5 native letifier, finite `dag-thresh` grid | yes | yes | yes | yes | yes | strongest fair baseline |
| Current cvc5, sharing disabled | yes | yes | yes | yes | subset | ablation |
| Candidate native selector | yes | yes | yes | yes | candidate superset only if revision proves it | candidate |
| veriT sharing | yes where both solve | no | yes | potentially yes | no | direct subtractor / external reference |
| CPC/Ethos | yes | related cvc5 object | no | no | no | cross-format reference |
| Carcara | n/a | n/a | consumes Alethe | yes | n/a | checker/oracle, not constructor |

No metric-wise best-of union across veriT, CPC/Ethos and cvc5 is permitted.
