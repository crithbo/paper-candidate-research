# CVC5-ALETHE-SHAREMAP Stage A Results

## Outcome

`BLOCKED_USER_ACTION_REQUIRED` before the first claim-bearing natural-corpus observation. The complete `PRE_CLAIM_CONTRACT_FIDELITY_GATE` is `FAIL_CLOSED`: the native-family mechanical subgate passed, but the same printer-side candidate and pinned Carcara checker could not be built or executed on this host because the required C/C++ and Rust toolchains are absent.

No scientific PASS or STOP inference is permitted. Evidence ceiling: `RESOURCE_FAILURE_ONLY__NATIVE_THRESHOLD_FAMILY_REPLAY_ESTABLISHED__CANDIDATE_BUILD_CARCARA_FULL_PRECLAIM_UNESTABLISHED__NO_SCIENTIFIC_INFERENCE`. Scientific revision consumed: `false`.

## Frozen input integrity

| Package | Manifest SHA-256 | Verified |
|---|---|---:|
| Discovery | `24989909247799552B26B56645DA8559D346965A34B2C97F1AE5A86B6BC8F91C` | 4/4 |
| Stage0 PRIMARY | `1D52D2F60866505AF0173C18FA234B3A41E4B04013B791F52849659BAFFB169B` | 4/4 |
| Stage0 confirmation | `92E6A48054B4F961C36A762247E6ADAC7A8EEF194E5AD676BF256789DB42C052` | 2/2 |
| Stage0 revision1 | `B0F6E65D405D764DA37BD37D18288AD8F5531E4E3E188FB2CDD62186B63E949C` | 3/3 |
| Stage0 closing | `037ECD38719F1CFEF956C88B19437B071AD2F75C999F5C75FF5B1C5226C25BED` | 2/2 |

## Release and source identities

| Item | Bytes | SHA-256 / identity |
|---|---:|---|
| cvc5 1.3.4 Windows x86_64 static release archive | 47,661,597 | `279FE7E95810CFB62433FCFC2932F35325A665F32D3697FF33F75E31D5C6A179` (matches official release digest) |
| extracted `cvc5.exe` | — | `FC71384CB2DBA76AD775CD6088DE76C3F4DB10BB1CC594FA4CFCD3110B576C3B`; reports `cvc5 1.3.4 [git f3b21c4]` |
| exact cvc5 source archive | 12,868,680 | `434E43F68073CDEF4AE3CFF63A828E973EC27AEADA0B01F481F2E2DC92A96662` |
| `alethe_printer.cpp` | 12,511 | `52E6686FB1B5D06ABBCDDAF2169AF85AAFF686D015E2D1C86C11C7EF45A1CCF4` |
| `alethe_let_binding.cpp` | 9,343 | `892ACEAE1ACB78460C27FE18D9CC1C60B50541EA720F4FB5D8B7B518DCAB3792` |
| fixed `qgu-fuzz-1-bool-sat.smt2` | 192 | `671B49020300D7BA60900BF2086C43E693CF6AD34642F29E3B389E67550CBB39` |
| Carcara 1.1.0 tag archive | 1,382,442 | `FCD42C4ED6501B690E3F363E980B2B1403A1A7C9DF262FECC0A4C831B8960F30` |
| Alethe specification download | 395,984 | `01E2A58B960F72E2839588BFC2C1640ED157E674E34FE87875D5933FA61C1CFD` |

## Native-family mechanical subgate

- Executed thresholds: every integer `0..64`, twice.
- All 130 solver exits: `0`.
- Actual fixed output at `dag-thresh=1`: `@p_10` token count `3`; `@p_12` token count `2`; required order `3 > 2` holds.
- Highest threshold that still emits a name: `6`; all thresholds `7..64` match the sharing-disabled raw output.
- Behaviorally distinct raw native outputs: `7`.
- Primary/replay comparison: 65 thresholds, mismatch count `0` across exit code, output bytes/hash, stderr bytes/hash, named-count fields, fixed token counts, and fixed-term-presence fields. Wall time and replay-specific paths were preregistered volatile fields.

| Threshold behavior | Raw output SHA-256 |
|---|---|
| `0, 7..64` | `92D137498A791245394ABAC70DA6509F841215D893DAD78D90868BC31999B734` |
| `1` | `328742B1212AB9BF5D9107E1A7A8555B7EDE17763376A7A6DBCFD6C3D2EF0998` |
| `2` | `5892E354CB8B674245CC5016D9BE36B75F776E2377ACF96DCFB3D3BD8575442D` |
| `3` | `1CAFE1E879C6121C20DD5D6E16E7EF00D4C8FA099D95F01C7AD97C98E938B2EA` |
| `4` | `702E2FD13B5B8DF3411682A25FF7C0C46923A39F358CA6F2A7BE50C50E8FB00B` |
| `5` | `7E76D72E757F856C70EBC05F3294A941EF242A995CDD410F5ACB95A701AF9FAA` |
| `6` | `61C8C6F04875EA81A587B52C3AA7442F54FF3D9ED641D6119BAABAE3E76EDEAC` |

The first preflight script incorrectly assumed thresholds `4..64` had no names and therefore returned `FAIL_CLOSED`. That immutable control output is retained. The script was corrected before any claim-bearing run to derive the highest named threshold from actual output; both corrected runs passed and agree exactly.

This subgate does not establish `A*` legality, outside-family status under expanded ASTs, a global algorithm, natural action rate, or benefit. Those require the missing candidate build and Carcara execution.

## Missing full-gate observations

| Required item | Status | Consequence |
|---|---|---|
| Release-matched source/archive/binary hashes | partial pass | Official source/binary hashes captured; no candidate build hash exists |
| Native count order and complete outputs | pass, mechanical only | Fixed native family reproducibly enumerated |
| `A*` executed in same printer-side contract | not executed | fail closed |
| Exact step/rule/expanded-AST equality | not executed | fail closed |
| Carcara acceptance | not executed | fail closed |
| Global coupling/nondecomposition witness | not executed | fail closed |
| 60-instance preregistered corpus | prohibited and not started | no claim-bearing observation |

## Full-cost status

Only preclaim native execution wall times and storage were measured. Candidate construction, serialization, checker time/RSS, disk I/O, failure/fallback, p50/p90, and Pareto outcomes do not exist. Therefore there is no full-cost comparison and no optimizer/performance claim.
