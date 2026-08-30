# Source70 ordinary source screen

## Source roles and boundary

| Role | Primary source | Date | Evidence used |
|---|---|---|---|
| ANCHOR/CURRENT/CONTRARY | Bazel official Skyframe reference | accessed 2026-08-15 | documents bottom-up invalidation, change pruning, bit-for-bit repeatability, and the JAR modification example as a theoretical possibility. |
| HISTORY | current registry exact five-field search | snapshot SHA256 C766BAB84B8F65B3C6B4C6F88A30BB5B2E8B695923A3D9311F634C16020FCF92 | no Bazel exact identity was found by the bounded string lookup. |

URL: https://bazel.build/versions/6.5.0/reference/skyframe

## Identity preflight

- Object: NONE in the bounded history lookup.
- Action: NONE in the bounded history lookup.
- Endpoint: NONE in the bounded history lookup.
- Guarantee: NONE in the bounded history lookup.
- Full-cost boundary: NONE in the bounded history lookup.
- Mechanical result: NO_MATCH. It is not an inference of novelty, absence, or admissibility.

## Closure result

The sole concrete proposal after label stripping is to edit/repack a ZIP/JAR while retaining a byte-identical output. Its decision variables are archive segment placement, compression/layout and rewrite selection; those are generic archive-packing actions, not a target-native Skyframe semantic action. If byte identity or stock reader acceptance is relaxed, the object/guarantee changes. If retained, no non-generic mechanism or finite target-specific action divergence has been named.

S70-01 is therefore EXCLUDED_BEFORE_RAW__GENERIC_PACKING_OR_CHANGED_ENDPOINT. This is not an implementation/result/resource inference, and it does not assert that a general Bazel incremental-construction topic is impossible.

No future-work text or issue was treated as an absence claim.
