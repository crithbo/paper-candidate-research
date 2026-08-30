# Primary RQ candidate

`RQ-S73-01`: For a fixed libstdc++ atomic-wait workload and C++20 value-change/memory-order semantics, can a library construction reduce contention, wake work, or memory cost caused by waiter-pool sharing while preserving every atomic object's notify/return behavior?

Tentative route was N2 / `SYSTEM_ARCHITECTURE`. The required discriminator was a library-specific mechanism rather than a generic bucket mapping, scheduler, or wake controller. The RQ was frozen before current-source reading; it fails the discriminator below.
