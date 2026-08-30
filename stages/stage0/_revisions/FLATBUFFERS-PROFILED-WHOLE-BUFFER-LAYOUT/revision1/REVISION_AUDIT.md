# FlatBuffers Revision 1 — Native Action and Certificate Audit

## Audit result

- Atomic gate: `NATIVE_ACTION_COMPLETE__GLOBAL_REUSE_AWARE_FLATBUFFERS_LAYOUT_CERTIFICATE`
- Gate disposition: `STATICALLY_CLOSED__SEND_TO_INDEPENDENT_CLOSING`
- Revision: `1/1 CONSUMED`
- Failure sentinel: `BELOW_Q2_STOP__NATIVE_ACTION_OR_GENERIC_LAYOUT_SCHEDULING_ABSORPTION`
- Source/collision disposition: `SEARCH_BOUNDED_OPEN`
- Native execution or experiment: `NOT_RUN`

## Input and control integrity

All frozen inputs were independently rehashed before construction.

| Item | Frozen SHA-256 | Verification |
|---|---|---|
| `registry.yaml` | `4FF441512ACD4C96AC386C377A74F2A68F51373E661C0B6B7164642AEA0E45F0` | exact |
| `plan.md` | `8E635D5599E00C0AB209F3CB71CBF2F72BACAA9290D913E39BA5F955A603C37A` | exact |
| `rules/ROLE_STAGE0_REVIEW.md` | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` | exact |
| PRIMARY manifest self | `0812CDFE89C2B5ADDFB3E538A8079F106F35E424331D02A004C5D25AFE91FFDE` | `4/4 PASS` |
| cross-confirmation handoff | `96D393B5C237AFA4A675C3BC7C9FD20FE0F500F9CDECA7FF04A85AC281E75E12` | exact |
| cross-confirmation manifest self | `EFB773E2660F2D795FFEF8CD76F4520A8A8611AE808D31B6F3C4ADB2588844C5` | `2/2 PASS` |

Only the frozen FlatBuffers PRIMARY and cross-confirmation packets were admitted as candidate evidence. Shared controls were not modified.

## First-party source pin and current reality

- Repository: <https://github.com/google/flatbuffers>
- Peeled release source commit: `7e163021e59cca4f8e1e35a7c828b5c6b7915953`
- Observed master in the frozen upstream audit: `81edeb17d9118143f2c81caf27edfb0df401279e`
- Decisive builder source: <https://github.com/google/flatbuffers/blob/7e163021e59cca4f8e1e35a7c828b5c6b7915953/include/flatbuffers/flatbuffer_builder.h>
- Verifier source: <https://github.com/google/flatbuffers/blob/7e163021e59cca4f8e1e35a7c828b5c6b7915953/include/flatbuffers/verifier.h>
- Official internals: <https://flatbuffers.dev/internals/>
- Official C++ guide: <https://flatbuffers.dev/languages/cpp/>
- Official schema guide: <https://flatbuffers.dev/schema/>

The pinned builder establishes the equations used in the revision: backward construction and `NotNested`; padding as a function of current size; aligned `ReferTo`; exact raw-vtable search in `EndTable`; default vtable deduplication; builder-wide shared-string pooling; explicit reusable offsets; fixed-order vector realization; and configurable finish/default/alignment arms. Current native actions therefore absorb the old “new order” interpretation, but not the revised algorithmic certificate.

## Action-catalog closure

| Surface | Treatment | Reason |
|---|---|---|
| independent descendant construction order | enumerated optimized action | stock caller-expressible |
| per-table present-field call permutation | enumerated optimized action | changes offsets/padding while preserving field semantics |
| generated object API `Pack` | distinguished baseline path | current native union |
| vtable dedup on/off | finite fair arm | public current control; global history retained |
| ordinary/shared strings | frozen/permitted identity arm | shared pool is global and may merge equal content |
| explicit alias offset reuse | mandatory per frozen alias class | preserves identity-labelled DAG |
| vectors/keyed vectors | fixed logical/key order, legal native helper variants only | physical reverse write is not reorder permission |
| `ForceDefaults`, identifier, size prefix, minimum alignment | frozen or finite fair arm | same-object/header semantics and bytes |
| allocator, capacity, reset/reuse | full-cost fair arm | cost control, not layout novelty |
| repeated slot writes/dead nodes/raw pushes | excluded normalization | noncanonical emitter escape, not generated/direct object construction |
| schema/codec/reader changes | excluded | changed object |

The catalog is complete for the expressly declared canonical generated/direct-builder family. The claim does not silently expand to every byte sequence reachable through low-level escape hatches.

## State-sufficiency attacks

| Attack | Retained fact | Why suffix behavior is preserved |
|---|---|---|
| alignment depends on entire prefix | exact `p` and `mu` | determines future `Align`, `PreAlign`, and finish padding |
| uoffset depends on prior object position | live alias map `A: identity -> Offset.o` | determines exact `ReferTo` result |
| vtable reuse crosses subtrees/types | future-matchable raw signatures and offsets `H_V` | reproduces exact earlier-vtable equality and signed table link |
| shared-string reuse is builder-wide | future-queryable pool `H_S` | reproduces reuse versus creation and returned offset |
| aliases serve multiple unbuilt parents | last-use-aware `A` | prevents premature forgetting and duplication |
| vector/key order constrains assembly | frozen action preconditions in `D` | permits construction scheduling without semantic reorder |
| profile edges close late | unresolved endpoints `E` | charges each exact distance once when both addresses exist |
| forgotten prefix may still matter | reuse-closure rule plus `p/mu` | forget only after no future action/event can observe the item |

The proof obligation is suffix congruence, not similarity of local subtree summaries. A closing reviewer can falsify the certificate by giving two equal normalized states with different legal suffix actions or costs.

## Algorithm and guarantee audit

`FB-RCFDP` is a finite acyclic shortest-path/DP over completed dependency ideals and the FlatBuffers-specific observable histories. It provides:

1. a plan-to-public-call expansion for every transition;
2. a public-call-plan-to-path inverse for every admitted canonical plan;
3. exact within-state Pareto dominance justified by suffix congruence;
4. last-use forgetting justified by an observability lemma; and
5. exact optimum/Pareto frontier over the declared grammar.

Complexity is output-sensitive in reachable normalized frontier states `R`: `O(R*g*poly(n))` time and `O(R*poly(n))` space. Worst-case `R` is exponential and can equal the Cartesian-product oracle. No polynomial, general FPT, or approximation claim is made. The format-specific contribution is viable only if later natural cases exhibit strict certified quotient compression. This honesty prevents an exact-but-generic solver from masquerading as N2.

## Witness arithmetic audit

For the two-Child schema in the report:

- first child: vtable 6 + table 8 = 14 bytes;
- second child: 2 alignment + vtable 6 + table 10 = 16 bytes;
- root before finish: vtable 8 + table object 14 (including its two alignment bytes) = 22 bytes;
- finish root uoffset: 4 bytes;
- total: `14 + 16 + 22 + 4 = 56` bytes (the root's two alignment bytes are included in its 22-byte pre-finish segment).

Both byte images encode root at address 12. Plan A places `(left,right)=(48,32)`; Plan B places `(left,right)=(32,48)`. Root field uoffsets land exactly on those addresses. Child values are swapped between the 8-byte and 10-byte physical Child layouts but remain attached to their fixed logical identities. With only `root->right` weighted, distance is `20` versus `36`; final bytes tie.

This is a static byte derivation from the pinned builder equations. It was not produced by running the candidate or stock builder. The first Stage A preclaim gate must reproduce it and pass the unmodified verifier/reader before any observation can support a claim.

## Genericity and absorption audit

The revision fails if its executable form is only:

- a local subtree DP;
- ready-node hot-first or stable order;
- caller order/configuration enumeration without the suffix quotient;
- an ILP/CP-SAT/precedence scheduler with an unproved or incomplete builder model;
- a builder/emitter patch; or
- a solver whose only guarantee is exhaustive search with no FlatBuffers-specific certified merging.

The current union directly absorbs all of those weak forms. It does not directly absorb a correct complete-grammar suffix quotient with exact reuse/alignment/alias semantics. Generic layout and scheduling work remains a methodological subtractor. The latest direct-paper collision review is bounded-open, and no failed transfer is absence evidence.

## Stage A preclaim gate frozen, not executed

The first permissible claim-bearing work after an independent Stage 0 PASS is, in order: stock reproduction of the 56-byte witness; unmodified verifier/accessor/identity equality; exhaustive tiny oracle equivalence and 100% catalog coverage; measured canonical-state compression; then two source-builder-backed natural corpora with frozen profiles and the complete full-cost baseline union. Any mismatch fails closed before a performance claim.

## Audit conclusion

The atomic gate is internally complete enough for independent closing. The scientific revision is consumed. Conditional `TIER_B_Q2_VIABLE` survives because the algorithmic proposition is no longer a local/order-only sketch and because it has a finite, falsifiable fidelity path. No implementation, positive result, or Stage A/B authority is implied.
