# Raw screen events

| ID | Natural tail-risk/cliff hypothesis | First-party anchor / source pin | Screening disposition |
|---|---|---|---|
| R01 Cargo resolver | Public workspaces whose optional-feature/version constraints cause a resolver CPU/RSS or duplicate-build-cost tail transition | Cargo Book; Cargo `97b3bcefc74ddf1203b21f158129e4b7df33254a` | `DEEP_DIVE_REQUIRED` |
| R02 systemd unit graph | Real unit-file dependency/cycle/ordering shape causes startup critical-path or transaction-load tail transition | systemd docs; systemd `9b75d9bc66dc4f64e4fdd33603d199d374c0873b` | `DEEP_DIVE_REQUIRED` |
| R03 OpenSSL chain construction | Real certificate/trust-store graph shape causes chain-build/verification tail transition at fixed validation verdict | OpenSSL verification docs; OpenSSL `6d250710fb8cfd5c9a41af373c0c1ca85ff836c2` | `DEEP_DIVE_REQUIRED` |
| R04 APT solver | Versioned package repositories with conflict/alternative shape cause solver-tail transition | APT `6b128124271e94bdb0f4e7850d9286170d712b04` | `NOT_ADMITTED_UNFROZEN` — natural carrier/union not closed |
| R05 Nix evaluator | Versioned derivation graphs cause evaluation/realisation-planning cost cliff | Nix `4fb76b520522a1d0d490f24ae55d49400f782f08` | `NOT_ADMITTED_UNFROZEN` — natural carrier/union not closed |
| R06 udev hwdb | Versioned device-modalias sets cause lookup/startup cost tail transition | systemd `9b75d9bc66dc4f64e4fdd33603d199d374c0873b` | `NOT_ADMITTED_UNFROZEN` — no natural cliff route closed |

These are hypotheses and finite review targets, not measured phenomena.
