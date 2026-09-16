# GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN — Q1/Q2 Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler construction / code-generation
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the atomic revision gate
- Cutoff: 2026-08-14

## Reference set

| Role | Reference | Venue/status | Read scope | Why selected |
|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | [Unison: combinatorial register allocation and instruction scheduling](https://arxiv.org/abs/1804.02452) | peer-reviewed compiler research / author preprint | problem and algorithm shape | illustrates a nontrivial exact/combinatorial backend algorithm rather than a parameter tweak |
| EVALUATION_ANCHOR | [LLVM GlobalISel documentation](https://llvm.org/docs/GlobalISel/index.html) | official current implementation | whole-function pipeline and target contract | sets the real deployment and baseline fidelity bar |
| DOMAIN_NEIGHBOR | [LLVM RegBankSelect documentation](https://llvm.org/docs/GlobalISel/RegBankSelect.html) | official current implementation | RBI alternatives and two supported modes | nearest same-object current comparator |
| BOUNDARY_ANCHOR | [GlobalISel porting guide](https://llvm.org/docs/GlobalISel/Porting.html) | official current implementation | target RBI/ABI/legalizer contracts | makes clear that unpinned target mappings are not a paper-ready object |

## Comparator matrix

| Dimension | Candidate after revision | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance | backend code quality/compile cost | GlobalISel whole-function framework | moderate readership | conditional Tier B |
| Contribution type | exact/FPT bounded-region N2 | Unison algorithmic compiler contribution | target scope narrower | Q2 viable if real witness |
| Nearest-prior delta | nonlocal mapping plus repair action plan | RegBankSelect Fast/Greedy local modes | must prove no local-grid equivalence | revision gate |
| Algorithm substance | finite state and certificate | combinatorial codegen methods | state currently unpinned | revision gate |
| Baseline fairness | full stock pipeline + Fast/Greedy | current source | must use same target RBI | revision gate |
| Natural workload | LLVM test-suite/bitcode corpus | official LLVM pipeline | corpus unpinned | Stage A plan |
| Full cost | compile/RSS/object/COPY/RA/runtime | compiler evaluation expectations | no measurements yet | readiness only |
| Failure boundary | width/action cap delegates stock | bounded exact method shape | must formalize parameter | revision gate |
| Artifact/reproducibility | commit/RBI/flags/corpus/oracle | current source guidance | unfrozen | Stage A fidelity gate |

## Reviewer-shape assessment

- Editor view: a narrow but coherent compiler-tool contribution if the target-specific action witness exists.
- Methodology view: ordinary Greedy retuning is insufficient; exact boundary state and full-cost comparison are indispensable.
- Domain view: current LLVM explicitly identifies a desired Global mode but does not deliver it; this supports opportunity, not novelty proof.
- Devil's advocate: many targets may have only one useful mapping or an RBI API that does not expose all meaningful alternatives. The revision must pin a target where this is false.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional.
- Status: `PARITY_CONDITIONAL`.
- Executable next gap: one pinned RBI action catalog and union-external bounded witness.
- Bounded near-Q1 gap: multi-target confirmation or broader theorem.
- Invalidating gap: no complete legal target action catalog or no nonlocal witness outside Fast/Greedy plus full stock composition.
- Calibration only: these references do not establish novelty or act as performance baselines.

