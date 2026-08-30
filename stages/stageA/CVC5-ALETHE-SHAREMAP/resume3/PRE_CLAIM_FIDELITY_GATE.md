# PRE_CLAIM_CONTRACT_FIDELITY_GATE

- Resource prerequisite: `FAIL_CLOSED`
- Full fidelity gate: `NOT STARTED`
- Claim-bearing observation: `false`
- Scientific revision consumed: `false`

| Gate | Status | Evidence |
|---|---|---|
| Exact Carcara source/hash/commit/license | PASS | Source archive `FCD42C4…0F30`; 72-file tree digest `A2D1D25C…35E3`; Apache-2.0. |
| Exact Rust/Cargo 1.72 | PASS | rustc/Cargo 1.72.0 version smokes and binary hashes recorded. |
| Unmodified locked Windows build | **FAIL_CLOSED** | Final authorized build cannot link Rust GNU build scripts: missing `libgcc_eh` and `libgcc`; no executable. |
| Carcara version/help and stock checker smoke | NOT RUN | `carcara.exe` does not exist. |
| Native threshold prior mechanical evidence | NOT RERUN | Prior immutable package remains read-only; it is not enough to pass this full gate. |
| Candidate exact expansion/global coupling | NOT STARTED | Resource gate is a mandatory predecessor. |
| Natural 60-instance full-cost probe | NOT STARTED | Full preclaim PASS is required first. |

No result in this assignment supports PASS or scientific STOP. No checker substitute,
feature change, source patch, target pivot or third build was used.
