# Resource Unblock Report — CVC5 Carcara R3C1

## Outcome

`resource_ready: false` and
`BLOCKED_USER_ACTION_REQUIRED__ROUTES_EXHAUSTED__R3H_RECOMMENDED`.

The exact Carcara source, commit provenance, Apache-2.0 license and portable
Rust/Cargo 1.72.0 smokes passed. The allowed build envelope did not produce a
Windows executable. After the one mechanical cache correction, the final clean
build reached native linking and failed because the authorized bootstrap has no
`libgcc_eh` or `libgcc` archives required by the Rust Windows GNU target.

| Component | Result | Evidence |
|---|---|---|
| Carcara source archive and tree | PASS | Archive `FCD42C4…0F30`; tree `A2D1D25C…35E3`; 72/72 files equal to resume1 |
| Commit provenance and license | PASS | Commit `5d817d86…ee99`; Apache-2.0 `62C7A1E3…636A` |
| Rust/Cargo 1.72.0 | PASS | Exact version smokes and binary hashes frozen |
| Clean build 1 | MECHANICAL FAIL | Offline Rust 1.97 metadata reuse cannot resolve `log`; `F98994E3…C620` |
| One allowed correction | PASS | Cargo 1.72 `fetch --locked`; source/lock unchanged; `E27558E6…FA41` |
| Corrected clean build 2 | FAIL CLOSED | Missing `libgcc_eh` and `libgcc`; `9A73B26F…8066` |
| Carcara binary/version/help/checker smoke | NOT RUN | No `carcara.exe` produced |
| Full Stage A preclaim/candidate/natural probe | NOT RUN | Resource PASS is mandatory first |

## Cost and safety

Final directory closure is 14,713 files and is below the 8 GiB limit; the exact
byte count is frozen in `handoff.yaml`. Build/fetch wall times were 0.318 s,
61.397 s and 4.041 s, plus about 61 s for Rust acquisition/install. Exact
process-tree CPU/RSS was unavailable because WMI enumeration was access-denied;
no false precision is claimed, and the bounded calls are far below 6 CPU-hours.

No source, `Cargo.lock`, GMP/MPFR or test modification; no third build; no system
install, global environment change, WSL/VM, GPU, automation, Stage B, scientific
execution, shared-control write, project or external submission occurred.

## Evidence boundary and next action

Claim-bearing observation is false and scientific revision consumption is false.
Evidence ceiling is `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`; this result
cannot support scientific PASS or STOP.

All approved R3C1 routes are exhausted. Mainline may apply the already authorized
reversible R3H resource-blocked reserve after accepting this handoff. Reactivation
requires a user-authorized new immutable assignment and the exact resource listed
in `USER_BLOCKER_PACKET.md`.
