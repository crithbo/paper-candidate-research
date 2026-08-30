# Divergence seed pool

Seeds are pre-evidence prompts only; none asserts novelty or quality.

| id | engine | seed | cluster disposition |
|---|---|---|---|
| S01 | commit/visibility inversion | Can a producer's durable commit and a consumer's notification visibility be jointly optimized without weakening rollback invisibility? | selected |
| S02 | ordering split | Does transaction-local deduplication leave a target-specific publication-order constructor? | merged into S01 |
| S03 | consumer state boundary | Does a listener's active transaction create a second, independent delivery boundary? | merged into S01 |
| S04 | counterfactual reversal | Could notification be published before commit while retaining the same observable endpoint? | rejected: changes abort guarantee |
| S05 | abstraction ladder | Could table polling replace notification publication? | rejected: changed object/generic scheduler |
| S06 | constraint manipulation | Could prepared-transaction handling provide an alternative notification constructor? | rejected: different contract; NOTIFY transaction cannot be prepared |
