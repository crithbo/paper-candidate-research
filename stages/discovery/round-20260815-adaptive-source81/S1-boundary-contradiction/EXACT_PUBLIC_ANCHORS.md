# Exact public anchor

## A01 — Java FFM Arena temporal scope

- Exact identity: Java SE 26 `Arena.ofConfined` / `Arena.ofShared`, their associated native `MemorySegment` objects, and `Arena.close`.
- Immutable endpoint: fixed segment values, foreign-call result, spatial bounds, temporal safety, thread-access semantics, and explicit-close behavior.
- Official contract: <https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/foreign/Arena.html> and <https://docs.oracle.com/en/java/javase/26/docs/api/java.base/java/lang/foreign/package-summary.html>.
- Current upstream implementation locus: <https://github.com/openjdk/jdk/blob/master/src/java.base/share/classes/jdk/internal/foreign/MemorySessionImpl.java>.
- Natural carriers: Java FFM native-memory allocation and foreign-function calls; the API’s own `Arena`/`MemorySegment` examples provide a canonical public native-memory carrier.

The anchor identifies an exact semantic object; it does not assert that current Arena implementations lack a mechanism.
