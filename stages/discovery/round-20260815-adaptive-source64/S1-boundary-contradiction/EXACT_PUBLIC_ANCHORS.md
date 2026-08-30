# Exact public anchor

## S64-A01

- Identity: GNU Fortran manual, current “Asynchronous I/O” chapter.
- URL: https://gcc.gnu.org/onlinedocs/gfortran/Asynchronous-I_002fO.html
- Version/date: current official documentation, accessed 2026-08-15.
- Exact object: a gfortran Fortran program using `ASYNCHRONOUS='YES'` I/O plus `WAIT`, on a POSIX-thread-capable platform, with unchanged I/O result and wait/visibility semantics.
- Immutable guarantee: same Fortran I/O records, `WAIT` completion semantics, program-visible values/errors and API; no altered I/O system, new buffer API or weaker data-access rule.
- Anchor question: can an object-specific action survive after the required completion/ownership boundary is frozen, instead of merely changing generic worker/queue scheduling?

The anchor is only a locator and does not claim implementation absence or novelty.
