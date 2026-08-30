# O4-DYNCACHE-PGM Revision Q1/Q2 Paper Calibration

- Stage: `STAGEA_REVISION_1_OF_1`
- Candidate venue family previously considered: VLDB Journal / ACM TODS / IEEE TKDE; SIGMOD/PVLDB/PACMMOD shape equivalents
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Cutoff date: 2026-08-09

## Reference and control set

| Role | Paper/control | Venue/status | Read/test scope | Revision effect |
|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | [The PGM-index](https://www.vldb.org/pvldb/vol13/p1162-ferragina.pdf) | PVLDB 2020 | dynamic exact predecessor/range/update shape | Shows the bar requires a complete nontrivial representation/guarantee residual. |
| DOMAIN_NEIGHBOR | [ESA 2025 dynamic geometric index](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64) | ESA 2025 | closest same-object theorem/artifact | Already subtracts general fully dynamic ε-cover claims. |
| DEPLOYMENT_ANCHOR | [ALEX](https://www.microsoft.com/en-us/research/publication/msr-alex-techreport/) | SIGMOD 2020 | dynamic learned-index mechanism/evaluation shape | Reinforces full mechanism and systems-evidence expectations. |
| LATEST_SUBTRACTOR | [HIRE](https://doi.org/10.1145/3786657) | PACMMOD/SIGMOD 2026 | hybrid leaves, log updates, nonblocking recalibration | Removes broad robust-update/tail-stability positioning. |
| BOUNDARY_ANCHOR | [FITing-Tree](https://cs.brown.edu/people/mmarkovi/project/fiting-tree/) | SIGMOD 2019 | deterministic bounded-error piecewise-linear leaves | Makes an affine leaf certificate alone prior-art-adjacent and demands a non-absorbed action/guarantee. |
| DECISIVE_MINIMUM_CONTROL | Plain COW B+tree leaf | Executed local control | same object, capacity, COW publication and cost ledger | Matches exactness and `4/2/5` caps. |
| DECISIVE_MINIMUM_CONTROL | B+tree leaf with affine hint | Executed local control | default policy plus guarantee-preserving same-action frontier | Reproduces every PDEC transition, guarantee and full local cost vector. |

## Comparator matrix

| Dimension | Frozen candidate after revision | Anchor/control evidence | Gap | Disposition |
|---|---|---|---|---|
| Problem importance | Important dynamic ordered-index problem | PGM/ESA/ALEX/HIRE | None at problem level | Importance cannot substitute for contribution |
| Contribution type | Affine certificate-triggered COW leaf split | FITing-Tree plus affine-hint B+tree control | No non-absorbed N1/N2 increment | fatal |
| Nearest-prior delta | Claimed page-local certificate and dual image | Affine control takes identical state/action/guarantee/cost | Delta is empty in tested scope | fatal |
| Algorithm/mechanism substance | Default policy differs from capacity-only leaf | Same control action frontier contains PDEC | Difference is a policy label, not exclusive capability | fatal |
| Baseline strength/fairness | Minimum controls executed under same information and ledger | 218,240 exhaustive and 641 natural cases | No missing minimum control remains | decisive negative |
| Natural workload | Same OSM insert/upsert window | All PDEC natural transitions absorbed | No natural residual; no effective deletes | negative/limited |
| Full-cost coverage | Complete declared local vector | PDEC equals affine frontier and often costs more than plain | No hidden local advantage | negative |
| Main result | Deterministic absorption theorem-by-enumeration for finite model | Two byte-exact replays | Result refutes candidate seed rather than supporting it | STOP evidence |
| Query guarantee | No-fallback affine window | Affine control inherits it; maximum window remains 4 slots | No strict sub-page bound | fatal locally |
| Scale/generalization | No global directory by authorization | Cannot add new mechanism after negative gate | Same candidate has no surviving bounded seed | STOP |
| Failure boundary | Early splits increase pages/writes | Natural and exhaustive negative regions recorded | Closed honestly | supports STOP confidence |
| Artifact/reproducibility | Frozen contract, code, input, three identical outputs | Exact hashes | Reproducibility is strong | Does not rescue contribution |

## Reviewer-shape assessment

- Editor/venue-fit view: the problem fits the field, but the submitted same-ID mechanism has no paper contribution after minimum-control absorption.
- Methodology view: the revision is a high-quality negative result with fair information/action control and exact reproduction.
- Domain-contribution view: an affine certificate enforced through ordinary COW leaf splitting is not distinct from a B+tree leaf with that hint and policy.
- Devil's-advocate view: any rescue now would require adding a new global/deferred mechanism after observing failure, violating the frozen atomic gate and same-ID revision limit.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: minimum-control fairness, leaf non-vacuity, full local pricing, natural replay, double reproducibility.
- Remaining executable gaps: none may rescue this same-ID candidate; Stage B is forbidden.
- Gap that invalidates the paper: no non-absorbed mechanism/guarantee/metric residual—the core contribution is empty.
- Why this is calibration rather than a global impossibility claim: the result stops this frozen candidate only; it does not prove that every future page-aware index design is impossible.
