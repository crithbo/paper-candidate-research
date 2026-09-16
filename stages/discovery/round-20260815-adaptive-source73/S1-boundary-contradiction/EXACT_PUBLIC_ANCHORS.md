# Exact public anchor

## S73-01 — libstdc++ atomic wait pool

- Exact current public API/source anchor: libstdc++ `atomic` header. URL: <https://gcc.gnu.org/onlinedocs/libstdc++/latest-doxygen/a00050_source.html>.
- Current implementation locus: libstdc++ `atomic_wait.h`. URL: <https://gcc.gnu.org/onlinedocs/gcc-15.1.0/libstdc++/api/a00659_source.html>.
- Standard-facing contract reference: `std::atomic<T>::wait`. URL: <https://en.cppreference.com/w/cpp/atomic/atomic/wait>.
- Exact object: one or more libstdc++ `std::atomic<T>` instances executing fixed C++20 `wait(old, order)` and `notify_one/notify_all` calls, preserving the specified return-on-value-change and memory-order contract.
- Anchor question: can the address-to-waiter-pool boundary admit a non-generic library mechanism with a same-object wake/cost guarantee, rather than merely choosing an address hash or wake policy?

The anchor does not claim current absence or research quality.
