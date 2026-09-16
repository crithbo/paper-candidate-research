# Source58 S5 ordinary source screen

Date: 2026-08-15. Bounded official/primary source review only. No build,
benchmark, experiment, installation, or download occurred.

## Identity and held-queue accountability

The preflight uses exact object, action/estimand, endpoint, semantic guarantee,
and full-cost boundary. No exact five-field identity was found for CMake File
API, Gradle configuration cache, or SCons signature database. This is
NO_EXACT_MATCH_FOUND__NOT_A_NOVELTY_OR_ABSENCE_CLAIM. Build-cache similarity is
RELATED_ONLY and was not used as an exclusion.

The Source55 MIPS-FCSR, Source57 Wasmtime-threads, and Source57 Wasmtime-GC
held closure queues were not read, reopened, used, or altered. Source56--57
parallel-audit output was forbidden input and was not read or applied.

## S58-01 CMake File API reply publication

Current CMake documentation fixes the File API query/reply directories,
versioned API, reply index selection, client rule to follow index references,
and CMake ownership of reply files. Reply file names are unspecified. A new
reply index is written for a generation; old reply files may be removed after a
new reply, while a client seeing a missing referenced file must restart from the
new index.

This is already a native publication/recovery state protocol. Keeping the same
client-visible index/reply semantics leaves only retention, deletion timing, or
query selection policy. A changed index or reader changes the object. No
union-external target-native atomic constructor was identified.

Disposition: STRUCTURAL_DROP__CURRENT_REPLY_INDEX_PUBLICATION_UNION_OR_POLICY.

## S58-02 Gradle configuration cache

Current Gradle documentation exposes configuration-cache enable/disable
controls, automatic invalidation from input tracking, and a deliberately named
unsafe property that ignores filesystem checks. The status documentation also
describes cases where configuration cache is automatically disabled.

The proposed state update either uses native tracking/invalidation or weakens
the tracked-input correctness contract through an unsafe-ignore configuration.
Changing cache placement or enabling policy is a controller. No distinct
target-specific maintained-state action and guarantee survives these current
controls.

Disposition: STRUCTURAL_DROP__CURRENT_TRACKING_UNION_OR_WEAKENED_GUARANTEE.

## S58-03 SCons signature database

Current SCons API documentation identifies operations on signature database
files and configure-cache modes. This anchors a native signature/cache state
surface, but does not freeze a source-supported non-generic action beyond
signature construction, cache lookup, or mode selection. A different hash/cache
policy is generic and a different invalidation result changes the fixed build
contract.

Disposition: LOCATOR_ONLY__SIGNATURE_CACHE_POLICY_REMAINDER.

## Source roles

| role | official source | use |
|---|---|---|
| ANCHOR/CURRENT/CONTRARY | CMake file API manual | current index/reply ownership and concurrent recovery semantics |
| ANCHOR/CURRENT/CONTRARY | Gradle configuration cache documentation | tracking, invalidation, flags, and weakened-contract counterevidence |
| ANCHOR/CURRENT | SCons 4.5.1 API documentation | signature database and cache mode surface |

URLs:

- https://cmake.org/cmake/help/latest/manual/cmake-file-api.7.html
- https://docs.gradle.org/current/userguide/configuration_cache_enabling.html
- https://docs.gradle.org/current/userguide/configuration_cache_status.html
- https://scons.org/doc/4.5.1/PDF/scons-api.pdf

