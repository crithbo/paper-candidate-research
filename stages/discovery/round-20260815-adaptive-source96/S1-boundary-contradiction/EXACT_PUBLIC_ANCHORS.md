# Exact public anchor

`A96-01`: Oracle Java SE 25 `java.lang.ref.Cleaner`, official documentation, <https://docs.oracle.com/en/java/javase/25/docs/api/java.base/java/lang/ref/Cleaner.html>, read-only 2026-08-15.

Roles: ANCHOR/CURRENT/CONTRARY. It freezes registration-to-cleanup happens-before, at-most-once action execution, action concurrency, and Cleaner thread termination. The anchor is not a novelty or Q2 conclusion.
