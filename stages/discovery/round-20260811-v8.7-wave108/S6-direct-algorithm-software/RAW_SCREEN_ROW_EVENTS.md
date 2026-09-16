# Raw screen row events

| Row | Exact native constructor | Result |
|---|---|---|
| R01 | mimalloc request trace to heap/page allocation state | DEEP |
| R02 | jemalloc request trace to arena/bin/extent allocation state | DEEP |
| R03 | snmalloc request trace to allocator message/remote-free state | DEEP |
| R04 | rpmalloc request trace to span allocation state | DEEP |
| R05 | dlmalloc request trace to chunk/bin allocation state | DEEP |
| R06 | Ninja build DAG to native execution schedule | DEEP |

All six are independent exact objects and were selected after excluding active S1–S5 and prior S6 scheduler/online/controller objects.
