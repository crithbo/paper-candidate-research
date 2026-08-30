# Exact public anchor

## S74-01 — libstdc++ C++20 barrier phase/drop boundary

- Current implementation anchor: libstdc++ `<barrier>` source. URL: <https://gcc.gnu.org/onlinedocs/libstdc++/latest-doxygen/a00053_source.html>.
- Current code details: GCC libstdc++ barrier source with `__tree_barrier`. URL: <https://gcc.gnu.org/onlinedocs/gcc-12.3.0/libstdc++/api/a00056_source.html>.
- Contract locator: C++20 `std::barrier` / `arrive_and_drop` semantics. URLs: <https://en.cppreference.com/w/cpp/thread/barrier> and <https://en.cppreference.com/w/cpp/thread/barrier/arrive_and_drop>.
- Exact object: a fixed libstdc++ `std::barrier` phase sequence with `arrive`, `wait`, `arrive_and_drop`, completion function, and C++20 phase happens-before semantics.
- Anchor question: can dynamic expected-count adjustment and phase completion be implemented by a library-specific, non-generic construction with a same-object cost/semantic guarantee beyond the current cache-aware tree barrier?
