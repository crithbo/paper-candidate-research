# Exact public anchor

## S69-01

- Exact anchor: OpenJDK, **JEP 444: Virtual Threads**, delivered in JDK 21, current page updated 2025-10-30. URL: <https://openjdk.org/jeps/444>.
- Current contrary/collision anchor: OpenJDK, **JEP 491: Synchronize Virtual Threads without Pinning**. URL: <https://openjdk.org/jeps/491>.
- Current implementation locus: OpenJDK `jdk` master, `src/hotspot/share/runtime/objectMonitor.cpp`, virtual-thread monitor-enter/preemption path. URL: <https://github.com/openjdk/jdk/blob/master/src/hotspot/share/runtime/objectMonitor.cpp>.
- Exact candidate object: an OpenJDK virtual thread executing a fixed Java task with a fixed monitor/native-call boundary, carrier mapping, and Java-visible results/exception/monitor semantics.
- Anchor question: after retaining that object and its Java monitor/native semantics, is there a non-generic whole-runtime action that lowers carrier pinning beyond the current runtime mechanism?
- Primary route: JEP 444 -> JEP 491 -> current HotSpot monitor implementation. Transport fallback was not needed.

The anchor is a locator only. The JEP 491/current-source combination becomes contrary evidence below; it is not used as an absence claim.
