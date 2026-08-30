# Evidence / command / version manifest — COH-REGION-LIFECYCLE

## Read inputs, SHA-256 verified

- Discovery brief `TOPIC_BRIEF_COH-REGION-LIFECYCLE.md`: `D1A1D4FE2B3F1F420AD946A104CF7A3B7AAAB700D528B82C96FDFB3E051C399E` (matches registry).
- PRIMARY report: `B34DEAD11E6F789C2205DD54A642C14BC2DB7665CE513E7CB89D2969D23DED9E`.
- Confirmation report: `76E946746C88C10975C2207A1DA2168B3DD78A29C693733307B6C86526030197`.
- Tier recalibration: `85C0544CEE1279785B9DEF785653A8A448D91A35C6AE01D4A42A510788FE8BAE`.

## Low-cost checks executed

1. `Get-FileHash -Algorithm SHA256` on all frozen upstream inputs — passed as listed.
2. `rg --files stages/stage0/_revisions/round-20260803-v8` before creating this assigned output — no submitted candidate evidence/package existed.
3. Read-only source verification against Schieffer/CUDA official pages and pre-existing source matrix.

## Non-executed by design

- No GPU, driver, CUDA binary, GH200 machine, benchmark, formal experiment, download, or program write was used.
- A failed unauthenticated `git ls-remote` check is excluded from evidence; it is neither a baseline verdict nor a stopping reason.

## Missing certificate inputs

GH200 mode/driver/toolkit tuple; two program-commit hashes; region annotation/contract; B0–B3 configuration commands; lifecycle ledger; candidate plan/result hash. Their absence makes the proposition non-replayable.
