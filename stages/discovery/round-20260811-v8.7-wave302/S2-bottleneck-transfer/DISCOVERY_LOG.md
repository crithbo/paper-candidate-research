# Discovery log — Wave302 equal-object bottleneck migration cross-component breadth

## Freeze

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE302-FRESH-EQUAL-OBJECT-BOTTLENECK-MIGRATION-CROSS-COMPONENT-BREADTH.
- Cutoff 2026-08-11; v8.7+R5-P0; DISCOVERY_QUALITY_MODE=OFF.
- Frozen controls: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan 12657F38493BCCD502998E8086013B96A78BAA289888CE95D9925E7DE0AE9CCA; registry A9602176A012C9FDB4F46C29BA0B1F48D763B29708835769152F70531B72016A; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.

## Six unique equal-object families

| Family | Fixed output and cross-component migration hypothesis | Result |
|---|---|---|
| LLVM ThinLTO summary/index plus linker/backend | Same native executable and ABI; compile summaries shift work to combined index/thin link and parallel backends. | Deep; NOT_ADMITTED_UNFROZEN. |
| OpenJDK CDS archive plus class loader | Same JAR/module class behavior; class loading shifts to mapped archive lookup. | Deep; NOT_ADMITTED_UNFROZEN. |
| glibc dynamic-loader cache plus shared-object loader | Same executable and resolved soname behavior; library discovery/index precedes mapping/relocation. | Deep; NOT_ADMITTED_UNFROZEN. |
| CPython bytecode cache/import loader | Same module observable execution; compilation shifts to cache validation/load. | Raw; source/action union not frozen. |
| CMake/Ninja dependency metadata and executor | Same build artifact; dependency discovery shifts to dynamic scheduling. | Raw; scheduling/controller residual only. |
| Java classpath JAR index/class loader | Same classpath resolution; archive metadata precedes class lookup. | Raw; format/action witness not frozen. |

## Candidate-grade audits

### LLVM ThinLTO

LLVM documents a complete multi-component flow: bitcode carries summaries, the thin link merges summaries into a combined index, backends perform transformations and importing in parallel, and native objects return to the linker. Existing union also exposes backend parallelism, incremental cache and pruning policy. A retained N2 needs a whole same-executable algorithm over legal summary/import/backend actions with a guarantee beyond cache policy or scheduling. No such target-specific action-divergence witness was frozen; source-level current composition and direct collision remain unclosed. Status NOT_ADMITTED_UNFROZEN.

### OpenJDK CDS

Oracle documentation shows the old load cost is moved to archive build and memory-mapped archive access, with explicit static/dynamic archive composition, class lists and compatibility restrictions. The fixed contract must retain JDK build, class/module paths, class behavior and stock JVM loader acceptance. Selecting a class list or archive flag is existing policy/configuration; changing archive format/loader is out of object. No stock-equivalent two-archive legal action plus non-generic algorithmic guarantee was frozen. Status NOT_ADMITTED_UNFROZEN.

### glibc dynamic loader

Official glibc documentation establishes loader locations, cache/configuration and runtime environment constraints. Exact same-object behavior must retain executable, sonames, search/load semantics and dynamic-linker resolution. Path or environment selection is existing configuration and any alternate cache reader changes the object. No legal producer-plus-loader action domain yielding a target-specific joint algorithm was frozen. Status NOT_ADMITTED_UNFROZEN.

## Natural route, full-cost and finite killer

Each closure can use 20–50 public CPU artifacts: LLVM test/build inputs, version-pinned OpenJDK application JARs/class lists, or system shared-object dependency sets. Stock oracles are native executable behavior, JVM class loading and dynamic-linker resolution. Charge analysis/planner/build CPU-RSS-temp-bytes plus thin-link/archive/cache construction, loader/map/relocation CPU-RSS, cold/warm startup/query latency and final binary/archive/cache bytes.

Within 72 hours fail closed if a claimed action is an existing flag/cache/pruning/path/parallelism selector, generic packing, scheduler/controller, changes loader/format/ABI/output semantics, is absorbed by current union, lacks stock equivalence or lacks target-specific guarantee. A primary direct-collision audit follows only after a complete legal action exists.

## Decision

COMPLETE_ZERO_PROPOSALS. Three deep reviews remain NOT_ADMITTED_UNFROZEN and three families remain raw. This result makes neither direct-absence nor direct-collision claims and is not based on missing implementation, results, resources or AI readiness.
