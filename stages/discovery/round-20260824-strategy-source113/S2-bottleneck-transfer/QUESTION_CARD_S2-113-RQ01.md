# Question Card

Carrier fields are versioned: relative arrival `timestamp` (ms), input/output lengths and 512-token `hash_ids`; identical hashes mean reusable prefix blocks. Contrary/full-cost check: the schema does not define whether equal timestamps are true concurrent arrivals versus buckets, nor queue start, cache-miss completion, CPU/network transfer or session ownership events. Thus prefix overlap cannot determine a coalescing decision or its full cost. Search stopped at the first-party trace release README; `PRE_RQ_NONADMISSION__MISSING_CONCURRENCY_EVENT_AND_DECISION_ENDPOINT`.
