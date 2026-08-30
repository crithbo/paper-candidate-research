# Source / oracle / collision matrix

| Family | Official or primary source | Native checker/formal oracle | Strongest contrary / subtractor | Decision |
|---|---|---|---|---|
| Basilisk | `https://github.com/GLaDOS-Michigan/Basilisk`; OSDI 2025 paper | local Dafny verifier | Basilisk's automatic regular-invariant construction itself | structural drop |
| Arrival | OOPSLA 2025 primary paper; `https://github.com/mmcloughlin/arrival` | authoritative ISA-semantics instruction-selection verifier | Arrival plus production-backend selection | structural drop |
| Verdict | `https://github.com/secure-foundations/verdict`; USENIX Security 2025 appendix | verified X.509 policy validator | verified validator is the direct implementation, not residual constructor | raw drop |
| CompCertOC | PLDI 2025 artifact `SJTU-PLV/compcertoc-pldi25-artifact` | Coq proof checker | certified compositional compiler | raw drop |
| CairoZero proof compiler | JAR 2025; `https://github.com/starkware-libs/formal-proofs` | Lean proof checker | proof-generation pipeline / generic synthesis | raw drop |
| ZK circuit consistency | CAV 2025 primary locator | circuit verifier | producer/format current union not boundedly closed | unfrozen |

No paper limitation, lack of source closure, or unavailable experiment was used as an absence claim.

