# Exact public anchor

## A01 — JNI primitive-array critical region

- Exact identity: Java SE 26 JNI `GetPrimitiveArrayCritical` / `ReleasePrimitiveArrayCritical`, with a fixed Java primitive array, native method trace, values/side effects, and JNI restrictions.
- Immutable endpoint: same Java-visible array state and native result, same JNI critical-region legality, and same VM progress/GC safety contract.
- Official specification: <https://docs.oracle.com/en/java/javase/26/docs/specs/jni/functions.html> and <https://docs.oracle.com/en/java/javase/26/docs/specs/jni/design.html>.
- Current upstream source locus: <https://github.com/openjdk/jdk/blob/master/src/hotspot/share/prims/jni.cpp>, `jni_GetPrimitiveArrayCritical`, `jni_ReleasePrimitiveArrayCritical`, and `lock_gc_or_pin_object` / `unlock_gc_or_unpin_object`.
- Natural carriers: JNI-based numerical and bulk primitive-array native methods; the JNI design explicitly names vector/matrix-style large primitive arrays as a reason for native bulk access.

This anchor fixes a public semantic object, not a claim that an optimization residual exists.
