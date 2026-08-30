# Question cards

## QC101-01 — ABI guard publication/abort boundary

| Field | Frozen value |
|---|---|
| Exact identity | One Itanium C++ ABI guard variable and its corresponding one-time construction APIs. |
| Same-object estimand | Preserve completed marker, successful visibility, exception abort/retry and matching lock release for a fixed static object. |
| Counterfactual consequence | An eligible contribution must be a guard-specific complete construction/guarantee, not generic once locking, `atexit` management, a flag choice or a runtime wrapper. |
| Current-source locus | ABI guard-variable layout and one-time construction API. |
| Minimum falsifier | If the proposed action only changes implementation-defined spare bytes or chooses a mutex/lock representation under the specified acquire/release/abort calls, it is a generic implementation policy. |
| Full-cost initial boundary | guard loads, acquisition/release/abort, exception recovery, destructor-registration adjacency, CPU, RSS and initialization latency. |
| Finite route | A small C++ local-static exception/retry program plus ABI symbol/disassembly oracle is conceivable only if a non-generic residual survives. |
| Raw disposition | `EXCLUDED_BEFORE_RAW__GENERIC_ONCE_INITIALIZATION_POLICY_ONLY`. |

