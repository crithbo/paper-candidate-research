# Unique opportunity family

## F1 — GNU ld/BFD joint layout–relaxation constructor

**Exact object.** Fixed relocatable input objects and archive-selection/symbol-resolution result; fixed target ABI, relocation, linker-script and export semantics; output must load and execute with the stock loader/runtime under the same observable program contract. Inputs whose behavior exposes code/data addresses, or scripts which dictate an order/address, are outside any freedom claim unless those observables are preserved.

**Static action-divergence witness.** For a fixed default-script ELF link containing two independent, non-address-observing input text sections selected by the same wildcard, two regenerated layouts can order those sections differently while retaining symbol resolution, relocation correctness and loader acceptance. The GNU manual states that in the absence of `SECTIONS`, first-encounter input-section order is used; it also states that scripts/alignments can instead constrain placement. Thus the witness establishes conditional legal layout freedom only where the fixed script and observable contract permit it; it is not evidence that GNU ld lacks an equivalent action or composition.

**Conditional N2 proposition.** A target-aware joint algorithm could co-optimize legal input-section placement, padding/alignment, branch-relaxation and thunk/stub realization, with an explicit approximation or Pareto guarantee over image bytes, relocation/thunk overhead and a fixed startup/I-cache/branch-cost proxy. It may use known actions. It may not be a generic ILP, pass-order selector, flag grid, post-link wrapper, linker-script change or ABI/semantic change.

**Natural carrier/oracle.** Version-pinned public ELF build/link traces from a GNU project build (e.g., binutils or a distribution package build), retaining input objects, command line and script; `readelf`/loader execution plus symbol/relocation comparison form the native fidelity oracle. This is a route only; no build or run occurred.

**Full-cost ledger.** Link CPU/wall/RSS/temp and output bytes; relocation/PLT/GOT and thunk/stub count; loader/startup and I-cache/branch proxy; and any run-time cost needed to preserve semantics.

**Disposition.** `NOT_ADMITTED_UNFROZEN`. The official GNU source location is known, but this assignment could not retrieve and pin a specific current BFD revision and enumerate `ld`/BFD target back-end paths, script/default/flag interactions and relaxation convergence. A direct current-paper/tool collision matrix is also incomplete. No grounded brief follows.
