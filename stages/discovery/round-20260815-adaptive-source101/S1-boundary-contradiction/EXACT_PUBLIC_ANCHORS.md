# Exact public anchor

## A101-01

- Exact identity: Itanium C++ ABI guard variable and `__cxa_guard_acquire`, `__cxa_guard_release`, `__cxa_guard_abort` for a fixed dynamically initialized function-scope static.
- Version/date: current public ABI page, retrieved 2026-08-15.
- Primary source: <https://itanium-cxx-abi.github.io/cxx-abi/abi.html> (sections 2.8 and 3.3.3).
- Observable endpoint: exactly-once completed initialization; no completed marker after exception; ordering before references to the initialized object; release/abort of the corresponding guard acquisition.
- Anchor status: fixes ABI object, calls and guarantee only; it does not assert current implementation absence or novelty.

