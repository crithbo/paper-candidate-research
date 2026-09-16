# Source113 S5 Serving Trace Seed Pool

| Seed | Public trace/carrier candidate | Schema preflight | disposition |
|---|---|---|---|
| 113-01 | ShareGPT-style serving trace | event/session/prefix/arrival fields not version-frozen | PRE_RQ_NONADMISSION |
| 113-02 | Azure/LMSYS serving trace | session/prefix linkage and decision endpoint not frozen | PRE_RQ_NONADMISSION |
| 113-03 | SGLang agent trace | duplicates predecessor session lifecycle | EXACT_OR_CONTAINS |
| 113-04 | public benchmark request trace | candidate static estimand if full schema exists | RQ01 |

Offline seeds completed; invalid rows not replaced.
