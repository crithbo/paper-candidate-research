# Evidence Audit

## Exact object

The frozen research object is an epochal unmanaged pointer-based object heap with pointer-safe relocation, a fixed 4 KiB page-tiering backend, trace-defined GET/SET semantics, and a fixed SLO. The owner retained the trace, page size and GET/SET/DELETE ordering, but instantiated objects as opaque key/value items and made every selected item movable by contract after an assumed handle drain.

That is a useful trace-level abstraction, not a verified OBASE-compatible pointer heap. The operation trace contains neither page placement nor pointer/mobility facts; the frozen CacheLib Handle document guarantees lifetime while a handle is held but does not establish the implemented relocation adapter. Same-object status is therefore `PARTIAL_PROXY`, not `PASS`.

## Amendments 001 and 002

- Amendment 001 is hash-chained and states that no claim-bearing result preceded it. It repairs a dimensional impossibility by defining 100 base work units per operation. It does not change the mechanism or criterion, but the value 100 is uncalibrated; exact-planner infeasibility under this number cannot be treated as a hardware or fixed-SLO fact.
- Amendment 002 is also pre-observation and causal with respect to evaluation accesses. It does not change the candidate or comparator, but it **does** replace the reduced-object selection rule after observing one-page vacuity. This is a disclosed nonvacuity amendment, not a mechanism pivot. It narrows inference to the amended 12-object instances and cannot be described as an untouched original sampling contract.

Neither amendment is a resource blocker. Neither alone warrants `STOP`.

## Natural epochs and headroom

The three evaluation epochs are contiguous 30,000-row slices of one official MetaKV trace. They are natural operation epochs, but their page layouts and mobility are modeled. The 12 selected objects occupy 3/2/3 pages and 7,904/7,840/7,904 bytes.

The selected objects have only 5/2/3 objects with any evaluation-epoch access. Predicted-access sums are 124/384/46, while actual-access sums fall to 37/4/10. Thus all three instances lie in the preregistered low-persistence/no-gain region, and the comparator can place every reduced page in the slow tier. This explains the measured `-12,288/0/-12,288 B` residual, but does not test the mechanism signature where persistent heterogeneous hot objects leave a selective-movement frontier.

Three epochs suffice to report a bounded negative observation. They do not, under this construction, prove the frozen N2 kernel empty.

## Solver and residual

The exact layout enumerator's capacity search and counters are coherent for the 12-object abstraction: 195,571/67/195,571 states and 204,771/122/204,771 transitions. Under the owner's abstract ledger, the exact program is infeasible in epochs 1 and 3 because 400,342 counted planner operations exceed the caps; epoch 2 ties the proxy comparator at 8,192 bytes.

The residual arithmetic is correct **for the recorded proxy program**. It is not a decisive full-cost residual against a faithful current composition because:

- planner-work scale depends on the uncalibrated 100-unit amendment;
- the proxy baseline is not an executable OBASE control loop followed by an MDK policy;
- instrumentation, guide/relocation runtime, page-fault/promotion, TLB/huge-page, warm-up/repacking and fallback costs are not faithfully modeled;
- fragmentation and retained metadata are reported but not fully composed into a common backend/SLO model.

## Legality and output semantics

CSV parsing, object lifetime replay, DELETE handling, item-size updates and page-capacity arithmetic are present. Distinct layout semantics are not replayed: the same transcript digest is copied into every method's semantic field, while pointer safety and zero live handles are assumptions. Consequently legality is `PROGRAM_INTERNAL_PASS__SCIENTIFIC_OBJECT_UNVERIFIED`.

## Audit verdict

- Numeric reproducibility: `PASS`
- Natural trace provenance: `PASS_WITH_PROXY_BOUNDARY`
- Same-object: `NOT_CLOSED`
- Faithful strong baseline: `NOT_CLOSED`
- Full-cost: `NOT_CLOSED`
- Decisive scientific STOP: `NOT_ESTABLISHED`

