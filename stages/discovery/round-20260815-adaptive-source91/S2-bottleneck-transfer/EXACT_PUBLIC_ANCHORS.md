# Anchor

Signature: `CPYTHON_ADAPTIVE_INTERPRETER__FIXED_SOURCE_MODULE_EXECUTION__INLINE_CACHE_LAYOUT_SPECIALIZATION_STATE_JOINT_CONSTRUCTOR__FOOTPRINT_DISPATCH_DEOPT_FULL_COST`.

Official Python `dis` documentation (https://docs.python.org/3.15/library/dis.html, observed 2026-08-15) states that inline cache entries are used to specialize bytecode and that adaptive bytecode may differ from original bytecode. Exact object: fixed source/input/version and stock execution semantics; oracle: stock Python output/exceptions. Current union: bytecode compiler, adaptive specializer, cache entries, deoptimization and relevant settings. Carrier: one version-pinned CPython test after commit resolution. Full cost: compile/load bytes, cache bytes, dispatch/specialization/deopt CPU, RSS and runtime. This is not historical `.pyc` invalidation/hash identity.
