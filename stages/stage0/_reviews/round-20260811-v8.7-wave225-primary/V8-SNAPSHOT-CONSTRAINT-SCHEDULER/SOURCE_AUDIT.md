# V8-SNAPSHOT-CONSTRAINT-SCHEDULER Source and Collision Audit

- Review date/cutoff: `2026-08-11`
- Search status: `SEARCH_BOUNDED_OPEN`
- Current-source reality check: completed for the pinned source surface and official current documentation.
- Transport limitation: a live `git ls-remote https://chromium.googlesource.com/v8/v8.git HEAD` failed with `schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS`. No absence inference is drawn from this failure.
- Evidence policy: first-party V8 source/docs and paper originals/author artifacts only; search snippets were used only to locate originals.

## Frozen input integrity

| Item | Expected | Observed | Result |
|---|---|---|---|
| AGENTS.md | `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063` | same | PASS |
| plan.md | `F5C7D04DF32391E3FD958C106BBE41B9A8063F137E7D847230CC5027D295AD22` | same at assignment start | PASS |
| registry.yaml | `253F93B7A0E39B9AEE80E5E42E728DA43EEC281CE2DCACE0A5EAE97F4A97D934` | same at assignment start | PASS |
| ROLE_STAGE0_REVIEW.md | `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E` | same | PASS |
| Discovery handoff | `814631EF014A9566EA15FCC8FF9FF204B3A0D0B8796BD14B9106355FF1B7802A` | same | PASS |
| Discovery manifest self | `9A2A422CB2347AC19AD6DCE754855B5BC2A665E46C3F95005BFF9EFB73962206` | same | PASS |
| Discovery manifest entries | `9/9` | `9/9` | PASS |

## First-party V8 sources checked

Pinned source root: `https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/`

| Source | Symbols/surface read | Evidence established |
|---|---|---|
| [`serializer.cc`](https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/src/snapshot/serializer.cc) | `SerializeDeferredObjects`, `SerializeObject`, `ObjectSerializer::Serialize`, `SerializeDeferred`, pending refs | Deferred objects are queued and later popped; ordinary serialization is recursive; deferral is conditional on native eligibility/requirements; pending references have native register/resolve support. |
| [`serializer.h`](https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/src/snapshot/serializer.h) | deferred stack, `QueueDeferredObject`, forward-ref state | The checked source exposes a fixed deferred container/protocol, not a configuration for arbitrary generic-object scheduling. |
| [`serializer-deserializer.h`](https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/src/snapshot/serializer-deserializer.h) | bytecodes, hot-object count | Native stream includes allocation/backref/synchronization/hot-object machinery; hot list has eight entries. |
| [`serializer-deserializer.cc`](https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/src/snapshot/serializer-deserializer.cc) | `CanBeDeferred` | Map slots and several object classes are nondeferrable; a witness must bind actual allowed types and ordinary slots. |
| [`startup-serializer.cc`](https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/src/snapshot/startup-serializer.cc) | root/cache/backref/fresh-object order; strong/weak/deferred phases | Root and cache obligations precede candidate freedom and must remain fixed. |
| [`snapshot.cc`](https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/src/snapshot/snapshot.cc) and compression source | partition payloads, compression, checks/version | Read-only/startup/shared/context payloads and matching-build checks are part of the frozen object; fixed zlib compression follows serialization and is globally stateful. |
| [`mksnapshot.cc`](https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/src/snapshot/mksnapshot.cc) | startup blob and warmup interface | Provides the native generation/fidelity path. |
| [`flag-definitions.h`](https://chromium.googlesource.com/v8/v8.git/+/c635f0d160b6e988b5ea5a907511a2929beb5d5e/src/flags/flag-definitions.h) | snapshot stress/profile/checksum, extensible RO, builtin reordering | Relevant default/non-default controls are finite baselines; builtin profile ordering does not expose generic heap-object scheduling. |
| [V8 Snapshot and Serializer System](https://chromium.googlesource.com/v8/v8.git/+/refs/heads/main/docs/snapshot/architecture.md) | official current architecture | Confirms bytecode deserialization, partitions, version/build matching and compression architecture. |
| [Custom startup snapshots](https://v8.dev/blog/custom-startup-snapshots) | official embedder workflow | Establishes natural startup-snapshot creation context; it is not an ordering algorithm. |

### Source-level conclusions

- **Fact:** current V8 contains native forward-reference, back-reference, hot-object and deferred-object actions.
- **Fact:** current source/configuration checked here does not expose a complete configurable scheduler for all eligible generic non-code objects.
- **Inference:** a reader-preserving action gap is plausible because an implementation can choose when an eligible referenced object becomes pending/deferred and which deferred object is serialized next. This must be validated on a concrete typed witness before any claim-bearing observation.
- **Hypothesis:** scheduling these native actions can create useful byte/locality Pareto points. No current result supports it.

## Paper originals and collision boundary

1. Matteo Basso, Aleksandar Prokopec, Andrea Rosà, Walter Binder, [“Heap-Snapshot Matching and Ordering using CAHPs”](https://www.dag.inf.usi.ch/wp-content/uploads/oopsla25a-preprint.pdf), PACMPL OOPSLA2 2025, artifact DOI `10.5281/zenodo.16522289`.
   - Read: abstract/contributions, ordering model, correctness discussion, evaluation, limitations, related work and artifact statement.
   - Coverage: cross-build CAHP exact/partial matching plus profile-guided Native Image heap ordering; published page-fault/startup gains and artifact.
   - Boundary: different VM/format, profile information and object-matching problem; not a same-object V8 constructor. It directly absorbs broad heap-snapshot-ordering/locality novelty.
2. Matteo Basso et al., [“Improving Native-Image Startup Performance”](https://www.dag.inf.usi.ch/wp-content/uploads/cgo25.pdf), CGO 2025, DOI `10.1145/3696443.3708927`.
   - Read: abstract, pipeline, heap/code ordering goals, evaluation/artifact descriptions.
   - Coverage: profile-guided Native Image code/heap ordering and startup/page-fault improvement.
   - Boundary: different runtime/action grammar and extra profile information; strong method/evaluation subtractor.
3. Shuf et al., [“Creating and Preserving Locality of Java Applications at Allocation and Garbage Collection Times”](https://doi.org/10.1145/582420.582422), OOPSLA 2002.
   - Read: official metadata/abstract and contribution boundary.
   - Coverage: long-standing heap allocation/locality mechanisms, not static V8 snapshot serialization.

No paper located in the bounded search covered the conjunction of: fixed current V8 startup snapshot, same static graph/information, existing V8 bytecode/stock reader, complete eligible-object scheduling, and a target-specific algorithmic guarantee. This is `SEARCH_BOUNDED_OPEN`, not proof of absence.

## Reproducible search log

Search families, 2026-08-11:

- `V8 snapshot serializer deferred object scheduling snapshot compression`
- `V8 startup snapshot object ordering serializer research paper`
- `site:chromium.googlesource.com/v8/v8.git snapshot serializer deferred object ordering mksnapshot`
- `heap snapshot object ordering startup locality paper`
- `"Improving Native-Image Startup Performance" CGO 2025 PDF`
- backward/forward citation inspection of the OOPSLA 2025 CAHPs paper, especially its Native Image ordering genealogy and related-work section.

Search inclusions: official V8 source/docs; author/publisher paper originals; author artifact statements. Exclusions: secondary blogs as technical evidence, search snippets as claim support, generic serverless snapshot papers without the same serialization object, and issue/transport failures as evidence of absence.

## Comparator/action audit

| Action or information | Current V8 union | Candidate allowed | CAHPs/CGO | Fair treatment |
|---|---:|---:|---:|---|
| fixed root/cache/partition traversal | yes | preserve only | different | native baseline constraint |
| recursion/deferred stack behavior | yes | may replace only within legal eligibility | different | stock + stable queue baselines |
| pending forward refs/backrefs/hot list | yes | existing bytecodes only | different format | complete native catalog |
| builtin profile ordering | yes | no | analogous profile input | native subtractor; candidate gets no profile |
| generic heap object profile | no | no | yes | disallowed extra information |
| arbitrary whole-heap permutation | no | no | effectively broader in Native Image | not an equal-function baseline |
| alternate reader/format/compressor | no | no | different | excluded object |
| tiny exhaustive legal schedule | oracle only | validation only | n/a | never deployment baseline |

## Decisive uncertainty and claim ceiling

- The action boundary is credible, but the Discovery algorithm is not yet distinguishable from a bounded local score or generic precedence scheduler.
- The schematic `R,A,B,C` example is insufficient until object types, ordinary slots, partition, map availability and native byte stream legality are fixed.
- Fixed zlib size is a globally stateful result; no exact additive guarantee may be claimed without modeling compressor state.
- Therefore the only proper Stage 0 disposition is one atomic static revision, not PASS and not scientific STOP.

## AI/research integrity disclosure

AI assisted source routing, facet comparison, adversarial review and report drafting. No candidate code, snapshot generation, benchmark, measurement or main-claim result was produced. Every factual current-source statement is tied to an official path; collision claims are bounded to the listed originals.

