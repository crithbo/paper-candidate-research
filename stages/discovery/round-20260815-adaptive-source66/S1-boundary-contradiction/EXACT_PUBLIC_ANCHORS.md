# Exact public anchor — S66-A01

- Exact identity: Python 3.14.6 official “Python support for free threading” documentation and CPython `main` `Objects/object.c`.
- Documentation: https://docs.python.org/3/howto/free-threading-python.html
- Source: https://github.com/python/cpython/blob/main/Objects/object.c
- Version/date: Python 3.14.6 docs/current main-source views accessed 2026-08-15.
- Exact object: a fixed free-threaded CPython object with biased, deferred or per-thread reference-count state, plus unchanged Python/C-API object lifetime semantics.
- Immutable guarantee: same object identity/value/lifetime and C-API safety contract; no GIL switch, new API, altered collection semantics or weaker thread-safety claim.
- Anchor question: after current native queued/merge/safe-point actions are included, is a non-controller whole-object lifetime construction still available?

Anchor status only; no current-absence or novelty assertion.
