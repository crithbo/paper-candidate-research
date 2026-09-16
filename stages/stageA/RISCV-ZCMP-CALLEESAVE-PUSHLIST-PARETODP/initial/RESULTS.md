# Results

## Outcome

`BLOCKED_USER_ACTION_REQUIRED` at the PRE_CLAIM fidelity gate. The official metadata prerequisite passed, but the exact native toolchain/source-content route is incomplete. Claim-bearing observation count is zero.

## Mechanical results

| Check | Result | Scientific use |
|---|---|---|
| Frozen Stage 0/closing inputs | 8/8 SHA-256 match | input continuity only |
| Short LLVM locator | resolved to `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`; valid signature | provenance closure only |
| Decisive LLVM blob IDs | 13 pinned from official Git tree metadata | source identity only |
| Local exact source parity | 11/13; Zcmp grammar and TargetMachine implementation differ | resource sufficiency check only |
| Local exact RISC-V toolchain | absent | resource blocker only |
| Non-exact LLVM 22.1.8 | RISC-V target present but commit mismatch | not run on witness |
| LLVM 24 custom assertions tool | different commit, AMDGPU-only | not run on witness |
| Archive/source/build/install | zero | contract compliance |

## Claim-bearing run index

| Run | Classification | Candidate | Current union | Result |
|---|---|---|---|---|
| none | no run | not run | not run | no scientific inference |

Plan P/Plan S native legality, same-object equivalence, CFI/unwind, current-union coverage, candidate bijection/FPT realization, natural residual and full-cost Pareto status all remain unresolved.

## Resource accounting

- Official metadata: 9 successful requests; 111,029 successful JSON body bytes transferred. Unique canonical response bodies total 88,145 bytes. TLS/header overhead was not exposed and is not estimated.
- Source/blob/archive content download: 0 bytes.
- Builds/installations/global changes: none.
- Claim experiment CPU/wall/RSS: not applicable; none started.
- Diagnostic CPU/RSS: exact aggregate statistics unavailable; not estimated.
- New package storage: final exact bytes are reported with the manifest hash in the completion message.

## Reproducibility verdict

`CANNOT_VERIFY__MISSING_EXACT_NATIVE_ENVIRONMENT`. The commit/blob identity is reproducible; the scientific witness is not yet replayable.

