# Source / collision matrix — Source05

| Family | Official primary snapshot | Same-object guarantee | Current-union/depth result | Finite legal witness route |
|---|---|---|---|---|
| Rocq library certification | [Rocq documentation](https://rocq-prover.org/docs), [Rocq core source](https://github.com/rocq-prover/rocq) | Checked proof/import closure under a fixed library/version graph. | Raw only: no current union or action grammar was claimed closed. | Small versioned library pair; core checker acceptance for each declared import closure. |
| Agda interface state | [Agda interface-file documentation](https://agda.readthedocs.io/en/stable/tools/interface-files.html) | Safe module/typechecking outcome and loaded interface semantics. | Raw only; no incremental action asserted. | Two module revisions and their `.agdai`/typecheck acceptance. |
| UPPAAL symbolic verification | [UPPAAL verifier documentation](https://docs.uppaal.org/gui-reference/verifier/), [trace semantics](https://docs.uppaal.org/gui-reference/symbolic-simulator/symbolic-traces/) | Fixed timed-automata safety/liveness verdict. | Depth `NOT_ADMITTED_UNFROZEN`: current exploration/trace union and legal two-output transition not closed. | Public model/query; `verifyta` verdict and correctly interpreted trace. |
| PRISM value/approximation frontier | [PRISM statistical-model-checking manual](https://www.prismmodelchecker.org/manual/RunningPRISM/StatisticalModelChecking) | Fixed `P`/`R` property and stated accuracy/error boundary. | Raw only; target-specific action still unbound. | Small public model/property plus exact/approximate reported value and bound. |
| ACL2 books | [ACL2 book certification documentation](https://acl2.org/doc/index-seo.php?xkey=ACL2____BOOKS-CERTIFICATION) | Certification acceptance for a fixed book/import graph. | Raw only; no claim that native dependency handling is incomplete. | Versioned book pair and `certify-book` outcome. |
| FDR4 refinement | [FDR 4.2 documentation](https://cocotec.io/fdr/manual/index.html), [pipeline overview](https://cocotec.io/fdr/manual/optimising/overview.html) | Fixed CSPM refinement assertion verdict. | Depth `NOT_ADMITTED_UNFROZEN`: official snapshot did not close complete source-pinned action union or legal incremental frontier witness. | Public CSPM file/assertion and command-line machine-readable result. |

## Collision and exclusion check

`Souffle`, generic DP/ILP/CP/SMT, MachineOutliner, rustc depgraph, eBPF cached state, Alive2, Lean4 elaboration, Why3/Dafny/Boogie, CBMC, Kani, Binaryen, Z3, Rosette and SPIN are excluded by the contract, source01–04, registry or history. FDR4 and UPPAAL were selected for depth precisely because their stock checker/verdict routes are explicit; neither is a proposal because the action-union gate remains open.

## Claim ceiling

The matrix records target-specific theorem *promises* for raw screening and source-bounded closure failures for depth. It does not demonstrate current absence, a new algorithm, or paper novelty.
