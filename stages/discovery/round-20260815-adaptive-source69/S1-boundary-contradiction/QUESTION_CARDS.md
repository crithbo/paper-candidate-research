# Question cards

## QC-S69-01 — OpenJDK virtual-thread pinning

| Required raw field | Frozen value / disposition |
|---|---|
| Exact public identity | JEP 444, JDK 21 virtual threads; current contrary JEP 491 and OpenJDK `objectMonitor.cpp` locus |
| Carrier kind | `IMPLEMENTATION_CARRIER_ONLY`, with natural Java server task traces possible only after the candidate survives |
| Same-object problem | Carrier capture while a fixed virtual-thread Java task blocks at fixed monitor/native boundaries |
| Tentative endpoint | Same Java-visible behavior with lower carrier capture/full cost |
| Counterfactual consequence | A runtime state-transition constructor would replace the stock construction |
| Non-generic discriminator | Must preserve monitor/native semantics; application `ReentrantLock` migration is not the same object |
| Current locus | `ObjectMonitor::enter_with_contention_mark`, virtual-thread continuation/preemption branch |
| Minimum falsifier | JEP 491/current implementation already realizes the same monitor-unpinning mechanism, or remaining native case must retain pinning |
| Full cost | carrier occupation/parallelism, scheduling CPU, memory, latency, diagnostics; no measurement run |
| Closure route | finite source-only JEP/current-source check completed |

**Disposition: `EXCLUDED_BEFORE_RAW__DIRECT_CURRENT_COLLISION`.** JEP 491 is an official same-object mechanism that removes the synchronized-method/component pinning premise; the current monitor locus exposes corresponding continuation preemption. For the remaining native/foreign boundary, JEP 444 states pinning is required for native interaction. Avoiding it would change the fixed native-call guarantee, while carrier selection is generic scheduler policy. Thus no non-generic same-object N1/N2 survives.

No raw-required field was used to manufacture a proposal; no source-closure debt is transferred.
