# Source and collision matrix

| family | primary/official source | current fact used | admission consequence |
|---|---|---|---|
| QRP | [DepQBF in Practice](https://lonsing.github.io/depqbf/depqbf-in-practice.pdf) | QRP/BQRP trace modes and QRPcheck are documented. | Trace output is not a producer-union gap. |
| OpenTheory | [Article format](https://www.gilith.com/opentheory/article.html), [verified checker](https://cakeml.org/jlamp20.pdf) | `.art` encodes imports/exports through commands and has a verified checker. | Complete producer union/action absent. |
| Lean | [elaboration/compilation](https://lean-lang.org/doc/reference/latest/Elaboration-and-Compilation/), [build tools](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/) | Kernel checks environment; `.olean` serializes it; `leanchecker` replays it. | Build artifact rather than independent stream. |
| Rocq | [core language](https://rocq-prover.org/doc/V8.17.1/refman/language/core/index.html), [writing proofs](https://rocq-prover.org/doc/V8.12.0/refman/proofs/writing-proofs/index.html) | Kernel type-checks proof terms. | Changed build/proof object. |
| ACL2 | [Certificate](https://acl2.org/doc/index-seo.php?path=4899%2F156%2F38568%2F72&xkey=ACL2____CERTIFICATE), [current manual](https://acl2.org/doc/index-seo.php?xkey=ACL2____TOP) | Certificates are checked for a book/version/hash context. | Certificate is not free-standing stream action. |
| Isabelle | [current implementation logic](https://isabelle.in.tum.de/website-Isabelle2025/dist/library/Doc/Implementation/Logic.html) | Proof checker reconstructs/replays context-relative proof terms. | Context-bound internal representation. |

Latest-collision cutoff: 2026-08-11. Only primary/official sources were used; future work, issues and third-party absence claims were excluded.
