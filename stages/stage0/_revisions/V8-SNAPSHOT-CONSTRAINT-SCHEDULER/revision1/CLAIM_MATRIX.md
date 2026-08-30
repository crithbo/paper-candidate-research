# Claim matrix

| Claim | Status | Evidence / boundary | Falsifier |
|---|---|---|---|
| Same-object candidate surface is definable | PASS | Existing bytecodes, stock reader, fixed graph/partitions; only constructor scheduling changes | New reader/bytecode/profile/object required |
| Typed native action divergence | PASS (static) | Old-space `FixedArray` R/A/B/C, `kAnySlot`, map-first and `CanBeDeferred` conditions specified | Native trace cannot produce either schedule |
| Complete candidate action catalog | PASS, conditional | Mandatory actions plus defer/select/resolve/backref/hot/phase/cursor are enumerated | A current legal action is omitted |
| Future-action/cost sufficient state | PASS, conditional | Labelled live-interface state includes pending/reference/hot/cursor/ports; `w` visible | Merged states admit distinct legal suffix or cost |
| Target-specific N2 algorithm | PASS, conditional | Exact bounded-interface V8-DSP recurrence and trace certificates | Collapse to scalar/local/generic scheduling or ILP |
| zlib exactness | NOT CLAIMED | Global state unmodeled | Any report claiming exact compressed-size DP is invalid |
| Current union separation | PASS as an action hypothesis; SEARCH_BOUNDED_OPEN | Stock/LIFO + finite local scores defined; CAHPs/Native Image subtract scope | Union reproduces all actions/guarantees |
| Natural/full-cost benefit | NOT CLAIMED | Stage-A finite route only | No p50/p90 union-Pareto residual |
