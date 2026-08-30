# LLVM-GC-STATEPOINT-ROOTREP-FRAME-REGISTER-PARETODP — Stage 0 revision1

## Decision

- Assignment: `STAGE0-P1-20260814-LLVM-GC-STATEPOINT-ROOTREP-FRAME-REGISTER-PARETODP-REVISION1-V8.7`
- Atomic gate: `SAME_STOCK_COLLECTOR_TWO_PLAN_ACCEPTANCE__ROOT_UPDATE_PRESERVING_BOUNDED_FRONTIER_CERTIFICATE`
- Decision: `BELOW_Q2_STOP__NO_SINGLE_STOCK_COLLECTOR_TWO_PLAN_ACCEPTANCE_OR_GENERIC_ROOT_FRAME_PACKAGING`
- Scientific revision: consumed (`1/1`): yes.
- Stage A/B: not authorized.
- Evidence ceiling reached: static source/interface audit only; no implementation, build, experiment, benchmark, installation or custom reader was used.

## Atomic disposition

The gate does not close.  The frozen candidate has no named, existing collector/runtime reader and exact source blobs that accept *both* a relocate plan and an explicit-alloca-root plan while maintaining one logical root/base/order/update/post-use contract.  Supplying one now would be an object-defining replacement, not a missing performance result.

LLVM itself explicitly does **not** provide a garbage collector; a `GCStrategy` describes code generation for a collector/runtime rather than implementing that collector [LLVM GC documentation](https://llvm.org/docs/GarbageCollection.html).  Thus `statepoint-example` cannot act as the required reader/collector.  The public statepoint utility library is only a parser/indexing aid intended to be incorporated by a collector; it likewise is not a fixed relocating collector contract [llvm-statepoint-utils](https://github.com/kavon/llvm-statepoint-utils).

The two advertised forms are not exchangeable by the LLVM contract.  The documented alloca form records the *address of a stack region*, leaves spill/fill to the generator, and provides no corresponding base pointer; it is restricted to values whose base the collector can derive from the pointer itself [LLVM Statepoints](https://llvm.org/docs/Statepoints.html).  The supplied alloca example is expressly a non-relocating collector example.  In contrast, a relocation record supplies base and derived locations and is designed to make post-safepoint updates explicit.  A byte-level StackMap resemblance cannot prove reader-level equality.

No frozen source package names a public stock moving collector and reader that defines both acceptance paths.  LLVM documents that such a runtime must itself provide allocation, stack-map format/crawler, global roots, and any required barriers.  The documentation’s statement that a commercial relocating Java implementation has shipped is insufficient for this gate because it supplies neither a named runtime/reader nor reviewable source blobs.  A custom reader, a non-moving identity relocation, or collector swap would either violate the contract or collapse the remaining problem to ordinary root/frame/register packing.

## Structural assessment

The generic *idea* of a joint root/frame frontier is not disproved.  This candidate’s exact object is: it quantifies over an unspecified runtime while requiring runtime-specific reader acceptance and update semantics.  That makes the promised N2 proposition non-falsifiable on a fixed same-object contract.  Repair would require a new topic ID with a named collector/runtime, pinned reader blobs, and a runtime-defined root/base/update ABI established before asserting the two-plan action space.

This is not a resource or readiness stop: the decisive negative is semantic.  No unobserved performance, hardware access, implementation, or natural-corpus result is needed to establish it.

## Full-union result and claim ceiling

The relevant current union contains `gc.statepoint`, `gc.relocate`, explicit alloca-region recording, `RewriteStatepointsForGC`, target register allocation, frame lowering, stack-map emission and the runtime reader.  The last member cannot be left existential.  Once the runtime is omitted, any proposed finite state

`(root/base class, representation, live order, register/spill choice, frame slot, stackmap role, post-use obligation)`

cannot be proved future-action or cost preserving: reader semantics decide both legal base recovery and mutation visibility.  Recasting that state as generic RA/frame/ILP would not be target-specific N2.

Accordingly, no bounded exact/FPT/certified frontier, same-reader two-plan witness, or Stage A fidelity killer exists for this same ID.  The only honest claim ceiling is a documentation observation about LLVM interfaces; it is below a Q2 paper contribution.

## Claim-by-claim delta

| Stage | Status | Correction made here |
|---|---|---|
| Discovery | Abstract joint root representation opportunity | Did not identify a concrete runtime reader. |
| PRIMARY | Conditional Tier B / revision | Correctly required same collector but left it to revision. |
| Confirmation | `CONFIRM_REVISE_ONCE` | Explicitly excluded `statepoint-example` and custom readers. |
| revision1 | STOP | No frozen existing reader can supply both complete plans; a replacement would change the exact object. |

## Research repair vector

`[OMITTED_CURRENT_SAME_OBJECT, ATOMIC_ACTION_UNCLEAR, EVIDENCE_LOCATOR_OR_VERSION_GAP, CONTRIBUTION_TYPE_CONTRACT_MISMATCH]`.

No same-ID revision is permitted.  A new ID would first need a public, pinned collector/runtime reader, complete source blobs and a reader-level acceptance specification for both plans; only then could it ask whether a non-generic bounded frontier exists.

