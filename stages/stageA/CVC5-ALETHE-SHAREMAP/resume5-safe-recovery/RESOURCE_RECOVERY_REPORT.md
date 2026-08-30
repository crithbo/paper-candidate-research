# CVC5 / Carcara resume5 safe-recovery report

## Outcome

Decision: `BLOCKED_USER_ACTION_REQUIRED__RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

The assignment's single clean locked offline release build was executed and failed mechanically. The requested POSIX-resolvable compiler names fixed resume4's command-path failure: GMP configure recorded and invoked `gcc`. However, all GMP 6.3.0 compile probes returned exit code 1, so `gmp-mpfr-sys 1.6.1` aborted and Cargo exited 101. No Carcara executable was produced; the success-only version/help/checker-smoke branch was therefore not entered.

`resource_ready=false`. This result has no scientific implication.

## Frozen identity and continuity

- Assignment: `SAFE-RECOVERY-L1-20260816-CVC5-RESUME5-POSIX-CC`
- Assignment SHA-256: `BBBE7D295D4B4972DEEF6DEDF7E8DE299A21727750125F9D3E0F39E2BECAC8C7`
- Resume4 handoff SHA-256: `EDB00AAFE044DC8B95E5A9C2B3F6F94D8345E44119A59AAA57C6F260C76E9FD1`
- Resume4 manifest SHA-256: `86BE87026CB920A0D1AEE3A1467E2F603D779289C1CC49EA367D6B9004A116C6`; 27/27 entries revalidated
- Carcara archive SHA-256: `FCD42C4ED6501B690E3F363E980B2B1403A1A7C9DF262FECC0A4C831B8960F30`
- Cargo.lock SHA-256: `0E9C953C2C1B184511E2DFDF19D4BB7C35A6BE55140BC1A3D77179411D7C7378`
- Source content manifest SHA-256: `79F052442AE3FF77838AEBA558A6493FBBF0A23CB94AD7DB280B031150B7D48F`; 72/72 files exact before and after build
- GCC SHA-256: `AB37C11763FDCB3BF6F809B5D033A31EBEB77F10BA5934C72FA37287EE56144F`

All frozen controls matched at assignment entry. During execution mainline changed only shared `plan.md` and `registry.yaml`; closure hashes are `451E6718B60072CBD614086D1ED97E216F8CD1D61E1B682F24C7CE7FFC38E01F` and `25115C8D896EC7D43B470F95FA90A8DD69C1B5246D8C09A6538B2932817858C3`. The lane retained the already-frozen assignment and did not consume the changed semantics or write shared controls.

## Exact execution

Command:

```text
cargo build --release --locked --offline -p carcara-cli
```

Process-local controls: `CC=gcc`, `CXX=g++`, `AR=ar`, `CARGO_NET_OFFLINE=true`, `CARGO_BUILD_JOBS=2`, resume4 `mingw64/bin` and `usr/bin` on the child `PATH`, Rust/Cargo 1.72 from the frozen read-only toolchain, and all writable/cache/temp/build surfaces under resume5.

- Build attempt: 1/1 consumed
- Start: `2026-08-16T00:23:51.8251187+08:00`
- End: `2026-08-16T00:26:56.1331008+08:00`
- Wall: 184.308 s
- Exit: 101
- Build log SHA-256: `71DBC0354F6554BE3FCA3111CA10D7169F9DE0971E98A1C407BD36628A7AD720`
- GMP `config.log` SHA-256: `A7FE0A9A6723513034A5676A6E6EBA8E331FB92030B044D800B7AAB9808990B6`
- `carcara.exe` count: 0

The exact retained failure is: GMP configure selected `x86_64-pc-mingw64`, recorded `CC=gcc`, then each of `gcc ... -m64`, `gcc ... -mx32`, `gcc ... -m32`, and default `gcc` returned 1 on the trivial `int main(){return 0;}` probe. The configure log contains no compiler diagnostic text and ends `could not find a working compiler`. No post-failure diagnostic compiler command was run because it was outside this assignment's success-only post-build branch.

## Resource accounting

- Network: 0 B; no request attempted
- Failed target: 2,588 files / 334,482,281 B
- Resource root before final inventory snapshot: 11,314 files / 597,254,569 B
- Stored-byte ceiling: 734,003,200 B; passed
- Build wall ceiling: 1,800 s; passed
- Cargo concurrency: at most 2 jobs; passed
- Exact process-tree CPU and peak RSS: this environment did not provide exact statistics; no estimate was substituted
- GPU/exclusive device: none
- System/user environment, PATH, registry, service, driver, WSL: unchanged

## Evidence and stage boundary

- Claim-bearing observation: false
- Scientific revision consumed: false
- Preclaim contract fidelity gate: not entered
- Scientific PASS/STOP recommendation: none
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Stage B: false

No retry, source/lock/feature/test change, checker run, natural corpus, candidate execution, stage transition, or scientific disposition occurred.

