# AIGER-DELTA-SCHEDULE Resume1 Results

## Result summary

- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Resource route: `R3E_PORTABLE_MSYS2_EXACT_SOURCE_BUILD`
- Route status: `ROUTES_EXHAUSTED`
- Resource ready: `false`
- Preclaim gate: `FAIL_CLOSED_RESOURCE_GATE`
- Claim-bearing observation: `false`
- Natural object count: `0`
- Scientific revision consumed: `false`
- Stage B: `false`

## Mechanical observations only

1. Official source archives and required Yosys gitlink dependencies were acquired, hashed, license-audited, gzip-validated, and extracted.
2. Exact AIGER commit built without source changes on its second and final clean attempt; help exited 0.
3. The AIGER stock binary roundtrip failed because its Windows output contained CRLF in the binary header. The emitted 20-byte file hashes to `D1CE42CC4D0BDD5D4CEB2E750BA988891CCB2C126E321F5F2902C1122A89BAE0`.
4. Exact ABC commit failed both permitted clean builds. The second used only documented Makefile switches and failed in bundled CaDiCaL's unlocked stdio API.
5. No accepted executable entered `verified/`. Yosys, six-AND native replay and all natural runs were not started.

These are resource/build facts. There is no candidate-vs-baseline, same-object scientific, natural, full-cost, Pareto, complexity, or scalability result.

