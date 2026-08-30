# Question card QC01

| Required field | Frozen value |
|---|---|
| exact identity | Component Model canonical ABI post-return + current Wasmtime component runtime |
| same-object contract | fixed synchronous call graph, canonical ABI result/ownership semantics, legal post-return ordering |
| carrier kind | implementation carrier; public component corpus is not yet frozen |
| typed endpoint | target-runtime action with same ABI/ownership guarantee |
| counterfactual | a lawful structured construction could reduce cleanup/full cost without hiding or weakening an independently valid post-return operation |
| non-generic discriminator | must be determined by canonical ABI ownership and post-return legality, not generic destructor batching or a wrapper |
| current-source locus | API-level `CanonicalOptions` post-return field; implementation path unpinned |
| minimum falsifier | current lowering/runtime already exposes the same compositional schedule, or any candidate removes a legal independently callable post-return endpoint |
| full-cost initial boundary | compile/lowering CPU-RSS, component bytes, cleanup calls/allocations, runtime cycles and peak memory |
| finite closure | pin one Wasmtime default-branch component-lowering entrypoint plus immediate post-return dispatch, then freeze a canonical ABI test carrier and a two-schedule legality witness |

`RAW_REQUIRED=INCOMPLETE`; the exact action/carrier/estimand bundle remains named bounded debt. It does not support a proposal or scientific negative.
Disposition: `SOURCE_CLOSURE_QUEUE`.
