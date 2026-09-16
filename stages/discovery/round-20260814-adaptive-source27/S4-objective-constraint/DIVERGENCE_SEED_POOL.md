# Source27 offline divergence seed pool

Generated before external evidence lookup: `YES`. Seeds are non-evidentiary sketches, not locators/raw opportunities or novelty claims. Network-security exclusion: `PASS`.

| ID | Capsule | Engine / perspective | conclusion-first sketch | Generic-shell check | Selected |
|---|---|---|---|---|---|
| O01 | OpenML | JANUSIAN_TENSION / measurement reviewer | A suite can be reusable yet its run panel can fail to identify a fixed comparison after version/task drift; success would only establish a suite-specific availability bound. | PASS | yes |
| O02 | OpenML | PROBLEM_REFRAMING / end user | Turn “best learner” into a version-pinned estimand whose conclusion may change under disclosed task/run coverage, not a new leaderboard. | PASS | yes |
| O03 | OpenML | INVERSION / maintainer | Treat missing/invalid run metadata as an explicit exclusion test rather than impute it. | PASS | backlog |
| O04 | OpenML | ABSTRACTION_LADDER / theorist | Move from task list to held-out suite-version conclusion with a predeclared stability functional. | PASS | backlog |
| O05 | OpenML | COMPOSE_DECOMPOSE_SIMPLIFY / measurement reviewer | Decompose training, prediction, validation and metadata cost only if native API fields support it. | PASS | backlog |
| O06 | OpenML | CONSTRAINT_MANIPULATION / operator | Ask whether an official memory/latency cap changes a fixed suite conclusion while preserving score semantics. | PASS | backlog |
| R01 | Renaissance | JANUSIAN_TENSION / JVM maintainer | A fixed JVM score can be stable only after warmup, GC and measurement-window semantics are jointly exposed; success would characterize the suite rather than tune a VM. | PASS | yes |
| R02 | Renaissance | BISOCIATION_STRUCTURAL_TRANSFER / measurement reviewer | Transfer run-to-run rank-stability methodology to a versioned JVM harness while retaining its native workload identity. | PASS | yes |
| R03 | Renaissance | PROBLEM_REFRAMING / compiler-backend engineer | Reframe fastest JVM configuration as a held-out, harness-specific ranking conclusion under fixed full-cost fields. | PASS | backlog |
| R04 | Renaissance | INVERSION / end user | Use published artifacts to test whether a stated score remains decision-sufficient when startup/warmup costs are not silently discarded. | PASS | backlog |
| R05 | Renaissance | ABSTRACTION_LADDER / theorist | Define a phase-conditioned measurement estimand only if the harness exposes a versioned phase boundary. | PASS | backlog |
| R06 | Renaissance | ADJACENT_POSSIBLE_OR_BOUNDARY / operator | Ask whether a canonical public run record admits a non-controller correction to a ranking conclusion. | PASS | backlog |

Coverage: eight engines and seven perspectives. Clustered portfolio selects O01/O02 as one OpenML validity surface and R01/R02 as one Renaissance phase/validity surface, converged into the two exact locators below. No forced top-N or outcome-aware replacement.

## Selected exact locators: precommit before lookup

| Locator | Capsule | Exact object identity | Contribution / endpoint | Atomic estimand | Carrier | Cheapest falsifier |
|---|---|---|---|---|---|---|
| L27-01 | S4_OPENML_VERSIONED_BENCHMARK_SUITE | One frozen OpenML benchmark-suite version, named task IDs and machine-readable run export under stock OpenML schema. | `MEASUREMENT_CHARACTERIZATION`; suite-specific estimand availability / held-out conclusion change. | Version-pinned rank-stability functional after excluding only documented incomplete runs. | `CANONICAL_BENCHMARK_ONLY`; official API/export. | A frozen export with full required fields whose held-out task/version ranking is unchanged. |
| L27-02 | S4_RENAISSANCE_VERSIONED_JVM_BENCHMARK_RESULTS | Latest non-prerelease Renaissance release, fixed harness/workload version and a public run artifact under stock harness semantics. | `MEASUREMENT_CHARACTERIZATION`; phase-conditioned ranking validity. | Ranking functional conditional on disclosed warmup/measurement/full-cost phases. | Canonical benchmark/harness record. | A tagged public artifact whose phase metadata either invalidates the stated phase split or yields no held-out ranking change. |

Planned source roles are distinct: each locator needs an `ANCHOR` (content-addressable carrier), `CURRENT_UNION` (official schema/harness/current source), and `CONTRARY` (same-object primary comparator or bounded-not-found record). One document cannot fill every role.
