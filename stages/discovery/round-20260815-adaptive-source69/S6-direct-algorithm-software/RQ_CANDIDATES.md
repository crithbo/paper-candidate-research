# Source69 RQ candidate

## S69-01 — Go PGO interleaved devirtualization/inlining

- Exact public anchor: Go 1.22 release notes and the current `cmd/compile/internal/devirtualize` source.
- Stable object: a fixed Go program, CPU profile and compiler build configuration, with unchanged language behavior.
- Primary RQ: Can a complete Go-specific constructor jointly choose PGO guarded devirtualizations and inlining actions with a target-specific exact, FPT, approximation, or certified-Pareto guarantee beyond Go's current interleaved pass and the established profile-guided inline/devirtualization optimization kernel?
- Counterfactual consequence: a compiler build would select a different semantics-preserving direct/fallback-call and inline set with a non-generic guarantee under the same profile.
- Primary route: current Go source/docs; contrary route: primary work on profile-guided automatic inline expansion and devirtualization.
- Falsifier: current Go already composes the actions while the remaining selection problem is generic profile-guided inline/devirtualization/code-growth control.

This is one answerable RQ, not a novelty or residual claim.
