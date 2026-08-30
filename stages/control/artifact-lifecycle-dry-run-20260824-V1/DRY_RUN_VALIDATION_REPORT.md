# Artifact Lifecycle V1 — Independent Dry-Run Validation

Status: `PASS_ALL_ACCEPTANCE_CRITERIA__NO_DELETE`

Workspace: `E:\project\writing\reserch`

## Coverage

The validation covered seven historical cases: one Discovery zero-output closeout, one Stage0 STOP, two StageA STOP evidence packs, one StageA PASS pending StageB, one blocked StageA topic and one resource-blocked reserve. No legacy artifact was deleted or reclassified in canonical state.

All seven required negative controls were admitted to the validator and correctly denied deletion: unique claim-critical binary, non-reacquirable archive, unexported dirty patch, unaccepted downstream input, reparse/junction, active process and report-only terminal capsule.

## Replays

- Recovery replay: copied the canonical pinned `hf-rows-pinned-0.json` into an isolated validation recovery path; 1,629,065 bytes and SHA-256 `1C3850...67FF3D` matched.
- Downstream-read replay: consumed the exact S6-JS-PREFIXBOUND revision1 handoff through an isolated downstream path; 6,571 bytes and SHA-256 `73B1A6...2652B` matched.

## Acceptance criteria

| Criterion | Result |
|---|---|
| claim-critical hash drift | `0 / PASS` |
| downstream missing-input incidents | `0 / PASS` |
| blocked/reserve resume breaks | `0 / PASS` |
| wrong-root or reparse targets admitted | `0 / PASS` |
| unclassified persisted entries in dry-run case models | `0 / PASS` |
| cleanup receipt parse/hash validation | `PASS` |
| reacquire/recovery replay | `PASS` |
| downstream-read replay | `PASS` |
| retained bytes within budget or nonterminal resume disposition | `PASS_ALL` |
| negative controls | `PASS_7_OF_7` |

## Cutover recommendation

`PRODUCTION_NEW_ASSIGNMENTS_ONLY` is recommended. It must remain limited to assignments frozen after the explicit MAINLINE cutover record. Legacy directories, including the five coupled-agent unpinned JSON candidates, remain outside automatic policy and require their separate exact-target gate and receipt. Any future drift, missing downstream input, resume failure, recovery failure, wrong root/reparse or active-process violation rolls future mode back to `OFF` without scientific inference.

