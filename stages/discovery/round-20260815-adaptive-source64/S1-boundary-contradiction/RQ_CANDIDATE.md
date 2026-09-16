# S64-RQ01

- Seed: `S64-SEED01`; type hypothesis `SYSTEM_ARCHITECTURE / N2`.
- Primary RQ: **For a fixed gfortran asynchronous-I/O program, I/O unit, record/result, `WAIT` visibility semantics and POSIX-thread platform, is there a gfortran-specific whole-operation construction that changes completion grouping while providing a non-generic cost or correctness guarantee beyond the current async-I/O composition?**
- No alternate was frozen. Changing to another language/runtime, changing I/O semantics, or asking for a generic worker policy changes the research object or contribution type.
- FINER-lite: feasible `CONDITIONAL`; interesting `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevance `CONDITIONAL`.
- Null: once data-access and `WAIT` semantics are fixed, remaining choices are generic async-I/O queue, worker and wait scheduling.
- Ordinary closure route: official current async-I/O documentation plus official GCC source history that identifies the async runtime/WAIT implementation. No selective nomination.
- Closure result: `EARLY_FATAL__GENERIC_ASYNC_IO_SCHEDULING_SHELL`.
