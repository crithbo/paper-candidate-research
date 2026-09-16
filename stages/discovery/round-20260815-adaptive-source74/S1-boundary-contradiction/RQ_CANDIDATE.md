# Primary RQ candidate

`RQ-S74-01`: For a fixed libstdc++ C++20 barrier workload with phase completion and `arrive_and_drop` semantics unchanged, can a phase-state construction lower contention, cache traffic, wake work, or space compared with the current tree barrier without becoming a generic fanout/tree/controller policy?

Tentative type: N2 / `SYSTEM_ARCHITECTURE`. The RQ was committed before checking current code. The decisive discriminator is a library-specific semantic action beyond ordinary barrier topology; it does not survive the current source check.
