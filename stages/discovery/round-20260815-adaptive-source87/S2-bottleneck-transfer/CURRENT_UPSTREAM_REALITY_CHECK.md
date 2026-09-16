# Current reality

Official documentation states that Native Image can initialize classes at build time, store static state in the executable, and remove some runtime checks; it also defines a safety condition and exposes build/run initialization control. The official API notes that instances of runtime-initialized classes cannot be placed in the image heap. These are strong contrary facts: arbitrary initialization movement changes legality/semantics, and a flag is not an N2 residual.

The comparator must receive identical reachability/application facts and includes stock safety analysis, class-init policy, image heap construction and documented settings. Current `oracle/graal` source is not immutable-pinned here; no current absence, collision absence, or residual claim is made. Result: `PARTIALLY_FROZEN_UNION__SOURCE_CLOSURE_REQUIRED`.
