# Source54 S5 ordinary source screen

Date: 2026-08-15. Bounded read-only public official/primary source review only.
No build, downloaded asset, benchmark, or candidate experiment was performed.

## Identity preflight

The frozen key is exact object, atomic action or estimator, endpoint, guarantee,
and full-cost denominator. Registry/history search found no exact five-field
match for Fossil, Borg, or Julia. This is NO_EXACT_MATCH_FOUND__NOT_A_NOVELTY_CLAIM.
Repository, compaction, and runtime overlap are RELATED only. OpenJDK CDS and
OpenROAD/OpenSTA were not reopened because their historical surfaces have no
external evidence delta.

## Fossil exact artifact deltas

The current Fossil delta format defines exact target-size/checksum reconstruction.
The current schema documents blob/delta records and the srcid predecessor
relation. Current src/delta.c says the algorithm is generally applicable rather
than Fossil-specific; Fossil documentation calls delta compression a storage
optimization. Native exact delta encoding/decoding, predecessor links, artifact
reconstruction, and rebuild form the checked union.

The imagined online base choice is therefore a general delta-coding/packing
action, not a frozen target-specific atomic constructor. Making it
target-specific would need a separately anchored transaction/rebuild invariant.
It fails the non-generic discriminator before raw, not because it lacks an
implementation or result.

Disposition: LOCATOR_ONLY__GENERIC_ACTION_SURFACE. No queue item.

## Borg tiny-pack compaction

Current official Borg documentation exposes borg compact and its threshold:
default 10, 0 compacts any segment, and 100 compacts none. Current Borg 2
development documentation describes tiny-pack merging and says a merge does not
produce a further merge candidate. The native union includes compact's pack and
segment rewrite, threshold configuration, and that tiny-pack merge construction.

Changing when compact runs or its threshold is a forbidden controller. Generic
pack replacement is not target-specific, while the only concrete same-object
non-recurrent merge action is native. No union-external atomic action was found.

Disposition: STRUCTURAL_DROP__CONTROLLER_OR_NATIVE_UNION.

## Julia method-world state

Julia's official developer documentation defines world-age semantics and
world-specific invocation, explaining the avoidance of unwanted method
invalidation/recompilation across executing code. The source review establishes
dispatch/world operations but no unique target-native maintained-state
constructor. Eviction, compaction, or recompilation-state selection is a generic
cache/controller without a further frozen action.

Disposition: LOCATOR_ONLY__NO_TARGET_NATIVE_ATOMIC_ACTION_FROZEN. This is not
an absence claim or scientific negative conclusion.

## Source map

| role | official primary source | selector | use |
|---|---|---|---|
| ANCHOR/CURRENT | Fossil Delta Encoding | official trunk, accessed 2026-08-15 | exact delta bytes/checksum |
| CURRENT | Fossil Database Schema and src/delta.c | official trunk, accessed 2026-08-15 | srcid and generic-algorithm contrary evidence |
| ANCHOR/CURRENT | Borg compact documentation and Borg 2 internals | current official docs, accessed 2026-08-15 | native action, flags, merge invariant |
| ANCHOR/CURRENT | Julia developer world-age documentation | current official docs, accessed 2026-08-15 | fixed-world dispatch semantics |

URLs:

- https://fossil-scm.org/home/doc/trunk/www/delta_format.wiki
- https://fossil-scm.org/home/doc/trunk/www/fileformat.wiki
- https://fossil-scm.org/home/file/src/delta.c
- https://borgbackup.readthedocs.io/en/stable/usage/create.html
- https://borgbackup.readthedocs.io/en/latest/internals/data-structures.html
- https://docs.julialang.org/en/v1/devdocs/worlds/

