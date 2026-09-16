# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Resume 1 Results

## Outcome

- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Claim-bearing observation: no
- Scientific revision consumed: `false`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Exact-commit toolchain: not obtained
- Complete natural MIR: `0 / 8` required
- Baseline/candidate/verifier: `0 / 0 / 0`
- Full-cost scientific probe and double replay: skipped before experiment
- Scientific recommendation: none; specifically not STOP and not reserve

## Scope correction

Before the attempt and before any final handoff/manifest, mainline corrected an over-strict provenance interpretation. The frozen asset did not need an independently published detached signature. The accepted chain remained official HTTPS release URL, exact expected byte count, frozen SHA-256, and valid exact source/corpus commits. This did not change the object, method, natural-input gate, verifier, cost, replay, or claim ceiling.

## Sole download result

The release response advertised the expected `187,504,083` bytes, but the single no-retry request delivered only `133,887,242` bytes. The shortfall is `53,616,841` bytes. The preserved partial SHA-256 is `4ec2b9f6de4fadfd6864041faeefbc1df2fa07508dda80b850dbff501f40cb4e`, which cannot equal the frozen full-asset SHA-256 `b9b68a4d276e16fa25802aaba458e4638f64b3884c290aaccdc2d87083b6ca35`.

The downloader did not create the final `.zip`; no extraction or executable launch occurred.

## Resource cost

| Cost | Observed |
|---|---:|
| Asset network bytes | 133,887,242 |
| Download command wall time | about 30 seconds |
| Directory bytes before final text closure | 133,901,581 |
| Build/experiment CPU | 0 CPU-hours |
| GPU/exclusive device | none |

No old result was overwritten or rerun. The initial Stage A package and immutable revision1 remain hash-identical to the frozen inputs.

