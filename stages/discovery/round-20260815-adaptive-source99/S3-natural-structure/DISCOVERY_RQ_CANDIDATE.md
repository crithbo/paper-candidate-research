# Primary RQ — S3-99-01

- **Exact anchor:** Linux upstream `scripts/Makefile.modinst` and `include/linux/module.h`; kmod upstream repository, checked 2026-08-15.
- **Tentative object:** the fixed alias-to-module mapping from one installed Linux module set, represented through `modules.alias`/stock `depmod` index artifacts and resolved by stock libkmod/modprobe behavior.
- **Semantic boundary:** same alias match result, selected module, module dependency behavior, and reader; no altered module metadata, kernel configuration, or custom resolver.
- **Identity preflight:** no exact five-field match surfaced in registry/history search; this is only `NO_EXACT_MATCH__NO_NOVELTY_INFERENCE`.

## RQ

For versioned official Linux kernel module-release artifacts, can a predecessor-aware alias-index constructor retain every stock alias-resolution result while reducing complete final-index and equal-information transition cost relative to current `depmod` plus generic delta?

Potential route is N2 only if a target-specific whole constructor and guarantee survive. An N3 claim needs an actually measured, confound-controlled release law. The full-cost boundary would include depmod CPU/RSS/temp, index and delta bytes, and stock index load/alias-resolution cost.
