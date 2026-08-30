# Stage 0 Revision-1 Independent Closing Review

## Frozen scope and independence

- Assignment: `STAGE0-C1-20260811-AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN-REVISION1-CLOSING-V8.7`
- Topic: `AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN`
- Role: independent revision closing reviewer.
- Disclosure: this reviewer authored the original-primary *confirmation* only. This reviewer did not author the frozen PRIMARY or revision-1 package, and this closing attacks revision-1's new certificate rather than treating the earlier confirmation as evidence.
- Revision package: the four named payload files match the supplied SHA-256 values. Its manifest uses a leading `*` filename convention; a literal two-space parser rejects that convention, but direct per-file hashing confirms the stated 4/4 payload values. This is not a scientific finding.
- No implementation, execution, experiment, download, Stage A, or Stage B was performed or authorized.

## Closing decision

**`INCONCLUSIVE_POLICY_HOLD`**

Revision 1/1 was consumed and offers a plausible target-specific N2 direction, but its gate-bearing certificate does not yet establish a complete pair of same-interface, ABI-legal native traces or the claimed future-action-preserving frontier. The defect is not an implementation/readiness shortfall and is not evidence that all possible fixed-interface research mechanisms are structurally absorbed. It therefore cannot be promoted to `CONFIRM_STAGE0_PASS`, while the record does not support a scientific `STOP` under the frozen policy.

The topic must remain nonterminal and inactive until the user either authorizes an exceptional further scientific revision or chooses withdrawal/archival. No automatic re-revision is permitted.

## Decisive review findings

### 1. Native/ABI action facts are real, but not the claimed complete witness

The current LLVM source does expose `ACTIVE`, `ACTIVE_ZT0_SAVED`, `LOCAL_SAVED`, `LOCAL_COMMITTED`, `ENTRY`, and `OFF`; it maps `RequiresZASavePseudo` to `LOCAL_SAVED`, and provides an `ACTIVE -> LOCAL_SAVED` state change. Arm's current AAPCS64 text also defines active/dormant ZA, TPIDR2 lazy-save setup, abandon/commit behavior, and asynchronous-control ordering. Thus the revision correctly avoids inventing an instruction or treating `LOCAL_COMMITTED` as a ZA-saving alternative.

However, the proposed two traces are not specified as two complete paths with equal entry and equal merge/exit ABI state. The `predecessor-lazy` trace says it restores only on the ZA-using arm of a diamond, while the other arm makes the private/normal call and both paths join. It does not specify the required resulting ZA state, TPIDR2 value, save-buffer ownership, Z/P values, or mandatory state changes on **both** incoming edges of the join. A global architectural state cannot be left path-dependent at a join merely because the source-level interface is fixed.

This is material: AAPCS64's dormant-state obligations constrain all normal returns and require preservation or commit behavior; the LLVM pass assigns states over CFG edge bundles and inserts state changes at the determined locations. A valid alternative needs a complete action listing that shows every transition on both paths and proves the same admissible join state. The current prose is an outline, not that listing.

### 2. Current LLVM composition is stronger than the revision's baseline map admits

Current `MachineSMEABI` is not only a local before-call rule. It collects required ZA states, assigns a state per CFG edge bundle, uses a deterministic `ACTIVE` fallback for incompatible incoming desires, then inserts transitions using the selected bundle state and live-register information. It also searches an insertion window, subject to call boundaries, to manage physical X0/NZCV liveness.

This does not prove a complete Pareto frontier, so it is not a direct scientific absorption. But it means the claimed divergence cannot rest only on “the source has an ACTIVE fallback.” The revision must provide a concrete native action plan outside that complete composition, including the precise edge-bundle divergence, not merely a policy-level alternative placement.

### 3. SAP-FDP exactness/fixed-parameter claim is not closed

The stated state tuple is a promising specification sketch, but the required future-action/cost-preserving merge proof is circular at the decisive point: it says a bijection exists for values with identical typed future-use signatures and spill slots, without defining a finite canonical signature alphabet for all AArch64 Z/P group, tied-operand, subregister, call-clobber, VL/SVL, exceptional-return, and frame effects. Nor does it construct a complete action-to-state and state-to-action map for the declared diamond.

The displayed complexity `O(|R| * f(k,t,p) * A^O(t))` only asserts the existence of an unspecified `f`; it does not demonstrate a fixed-parameter bound for the claimed signature domain or a finite Pareto representation. This is insufficient for the revision's requested static exact/FPT guarantee. A generic DP/ILP cannot be substituted silently, and the report does not do so; the gap is therefore a missing certificate component rather than a generic-method collision.

### 4. Immutable source pin limits the ceiling, but is not a stop by itself

Revision 1 records only an observation of moving LLVM `main` and cannot supply the claimed immutable commit/file hash. The official source and documentation do confirm the relevant broad action families, but a complete native action grammar must ultimately bind a commit and file hash before any claim-bearing replay. This is a finite fidelity closure requirement, not a resource-based scientific stop. It compounds the witness/guarantee incompleteness and prevents a closing pass now.

## Claim matrix

| Claim | Closing status | Reason |
|---|---|---|
| Fixed ACLE/IR/AAPCS64 same-interface object | `ACCEPTED_WITH_PIN_CEILING` | Properly frozen in intent; immutable LLVM source pin remains a Stage A fidelity prerequisite. |
| ACTIVE/LOCAL_SAVED components are native and ABI governed | `ACCEPTED` | Current LLVM and AAPCS64 support the individual components. |
| Two same-interface complete native traces diverge | `NOT_CLOSED` | The diamond does not supply equal join/exit ZA/TPIDR2 and typed Z/P-state obligations for both paths. |
| Divergence is outside current complete union | `NOT_CLOSED` | Current CFG edge-bundle assignment must be beaten by an explicit native plan, not a fallback observation alone. |
| SAP-FDP has exact/FPT target-specific guarantee | `NOT_CLOSED` | State equivalence/action bijection and finite parameter bound remain schematic. |
| Finite future Stage A fidelity killer | `PLAUSIBLE_BUT_DEPENDENT` | It becomes viable only after the native trace and finite state certificate close. |

## Source basis

- LLVM, [AArch64 SME documentation](https://llvm.org/docs/AArch64SME.html): fixed attribute/interface semantics and the consequence of SM transitions for vector state and instruction legality.
- LLVM, [current `MachineSMEABIPass.cpp`](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AArch64/MachineSMEABIPass.cpp): ZA-state alphabet; `RequiresZASavePseudo`; CFG edge-bundle assignment and `ACTIVE` fallback; state-change insertion constraints.
- Arm, [AAPCS64 current source](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst): dormant ZA, TPIDR2 lazy-save lifecycle, normal-return and asynchronous-control constraints.

`SEARCH_BOUNDED_OPEN` is retained only for any wider direct-collision search. It is not used to infer that the current union is absent.

## Required policy routing

- Scientific revision: `1/1_CONSUMED`.
- Closing outcome: `INCONCLUSIVE_POLICY_HOLD`.
- Stage A: `false`; Stage B: `false`.
- No same-ID automatic revision, reserve transfer, archival, or Stage A creation is authorized.
- Mainline/user decision required: exceptional revision authorization with a new, fully enumerated two-path native certificate; or user-directed withdrawal/archival. Until then: `IDLE_REUSABLE_AWAITING_MAINLINE` for this reviewer lane.

