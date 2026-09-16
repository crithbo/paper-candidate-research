# Revision1 preclaim native-complete-action fidelity result

- Assignment: `STAGEA-L1-20260810-WEBGRAPH-REFERENCE-FOREST-REVISION1-V8.7`
- Gate: `SCALABLE_DENSE_FRONTIER_AND_EXACT_OPTIMAL_ACCESS_TIEBREAK_GATE`
- Status: `PASS`
- Evidence role: `NON_CLAIM_BEARING_FIDELITY_REPLAY`
- Scientific revision consumed at this point: `false`
- Candidate source SHA-256: `FF863A114D3F1420B0863CF7A64117899E2327734E49EA7D3A4BFC85390B7A49`
- Candidate executable SHA-256: `F43436AB06E66630785F76765DEF59F13E85EF537284650D6F6619AC8CAC3E0D`

## Tiny exhaustive oracle

- Frozen input SHA-256: `2DD06C1B5118618027DDB96087FBCEF1BE3A996AA091A8D5EE568D0984BC6739`
- Legal forests enumerated: `38,372`
- Candidate/final-BvCompZ primary bits: `148 / 148`
- Independent secondary optimum: `(sum depth=3, max depth=1, lex delta=[0,0,0,0,1,2,0,4,0])`
- Candidate selected the exact same three-level optimum.
- Writer/additivity, offsets, EF, sequential equality, random equality and checksum: `PASS`
- Independent validator SHA-256: `8170438E4172BA375E6F48E5B7072BCE3E8B47F00381C009119EA3EE3868AF2F`

## Complete 2,048 frozen structural-domain replay

- Every parent/revision `(baseline bits, exact bits)` pair compared: `2,048/2,048`
- Primary mismatches: `0`
- Writer/additivity mismatches: `0`
- Exact-worse cases: `0`
- Strict cases retained: `531`
- `case-0043`: `561 -> 560`
- Chunks whose equal-primary secondary vector changed: `363`
- Dense state count: `256` in all cases
- Maximum rolling arrays / compact backpointers: `12,288 / 24,576 B`
- Native semantic/read checks: `2,048/2,048 PASS`
- Validator SHA-256: `36D5B8F888ADDC3DE4171C77C26BE04F27615B9EF737EAB77CE65A2BD25F0E10`

## Frozen natural-object replay

| Corpus | Baseline bits | Revision exact bits | Exact primary parity | Changed equal-primary chunks | Persisted payload residual | Semantics |
|---|---:|---:|---|---:|---:|---|
| LAW cnr-2000 | 9,319,309 | 8,763,554 | PASS | 1,891 / 2,544 | 72,761 B | PASS |
| SNAP Wiki-Vote | 876,503 | 875,555 | PASS | 45 / 56 | 127 B | PASS |

All parent baseline `.graph/.offsets/.properties/.ef` hashes reproduced exactly. Candidate hashes were newly frozen because the allowed equal-bit tie-break changed legal reference vectors. All changed chunks retained identical primary exact cost; the tie-break never read timings, queries or corpus identity.

The first natural validator attempt is retained with `pass=false`: its implementation mistakenly required the parent byte residual exactly, although the gate requires unchanged graph-bit optimum and a strict positive persisted residual. Because equal-bit reference choices can change offset-code bytes, the validator was mechanically corrected to test `residual > 0`; no input, output, algorithm or observation was rerun or changed. Corrected validator SHA-256: `D13505B66326B0347CF8D4AEB11F6BCF73DD0A6BB484F9BB659E9A88A776373C`.

## Gate conclusion

The dense DP is a faithful same-object exact implementation and the claim-bearing matched-pair run is permitted. This document does not support PASS or STOP by itself. The scientific revision remains unconsumed until the separate atomic consumption record immediately before matched pair 0.
