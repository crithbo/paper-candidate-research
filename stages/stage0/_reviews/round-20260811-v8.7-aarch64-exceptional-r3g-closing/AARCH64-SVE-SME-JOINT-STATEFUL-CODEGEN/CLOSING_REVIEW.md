# Independent exceptional-R3G Stage 0 closing

**Assignment:** `STAGE0-C2-20260811-AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN-EXCEPTIONAL-R3G-CLOSING`  
**Reviewed packet:** `STAGE0-P1-20260811-AARCH64-SVE-SME-JOINT-STATEFUL-CODEGEN-EXCEPTIONAL-STATIC-R3G`  
**Authorization:** `POLICY-HOLD-DISPOSITION-20260811-R3G`  
**Atomic gate:** `COMPLETE_PREDECESSOR_LAZY_DIAMOND__UNION_EXTERNAL_ACTION_DIVERGENCE__SAP_FDP_CERTIFICATE`  
**Closing decision:** `CONFIRM_HUMAN_RESEARCH_RESERVE__USER_DIRECTED_POLICY_HOLD__NO_SCIENTIFIC_STOP`  
**StageA/B:** `false`

## Scope and independence

This review reads and attacks the exceptional-R3G packet only.  It does not repair the packet, propose an alternative witness, reuse an earlier revision conclusion as a conclusion here, create a second revision, or execute a toolchain/solver/experiment.  The packet manifest was recomputed as `4/4 PASS` before review.

## Independent findings

### 1. The predecessor-lazy diamond is not join-closed

The packet's own state ledger fixes equal entry state but leaves action B with `LOCAL_SAVED`/TPIDR2/save-buffer ownership on the call incoming edge and `ACTIVE` on the ZA-use incoming edge.  Its same shared-`inout ZA` join/exit instead requires a single ABI-legal ZA/TPIDR2/save-buffer state and the same typed Z/P/frame/exception obligations.  Thus B is not a complete trace at the join; it is a partial placement observation.

### 2. Both stated repairs have unenumerated native obligations

The packet identifies the only two relevant repair shapes: make the ZA-use arm lazy before the join and reactivate after it, or reactivate the call arm before the join.  Neither is supplied as a complete native trace.  Each changes the transition sequence and requires a charged accounting of TPIDR2/save-buffer lifetime, ZA restore/enable, fixed SM-boundary effects, scalable typed Z/P spill/reload, frame state, and normal/exception exit obligations.  Consequently the two-action comparison has neither an equal exit state nor a fair full-cost vector.

### 3. `ACTIVE` fallback is not a union-external witness

The packet accurately observes that current `MachineSMEABI` uses CFG edge bundles and may choose `ACTIVE` for conflicting desired incoming states.  That observation alone does not show that a repaired B plan lies outside the current full composition.  The packet supplies no complete edge-bundle assignment, no current-union action plan for the same repaired trace, and no non-dominance comparison after all repairs are charged.  It therefore cannot establish current-union externality.

### 4. SAP-FDP has not reached a certified finite guarantee

The state sketch names relevant dimensions but does not provide a finite canonical alphabet for future-use signatures and all listed Z/P/group/spill/VL/SVL/frame/exception effects.  It also lacks both directions of an action/path bijection, a future-native-action-and-cost-preserving merge proof, an explicit function behind the claimed FPT bound, and a finite Pareto/no-gain degeneration rule.  Calling the sketch a generic DP/ILP or hiding identity enumeration would violate the atomic gate rather than close it.

## Disposition

The exceptional packet is internally consistent in finding its gate `NOT_CLOSED`; the four independent attacks above confirm that disposition.  This is not a scientific STOP: it does not establish direct absorption of every possible same-interface target-specific construction, nor does it rest on missing implementation, performance results, source transport, or resources.  It is also not a Stage0 PASS.

Under the user-authorized R3H policy fallback, the appropriate mainline-only state action is the reversible:

`HUMAN_RESEARCH_RESERVE__USER_DIRECTED_POLICY_HOLD__NO_SCIENTIFIC_STOP`

The reserve must preserve the original Stage0 location, exceptional contract, owner packet hashes, blocker/gate result, and the exact resume point.  There is no automatic revision, StageA/B dispatch, archival deletion, or tier downgrade.  Reopening requires the user alone to issue `RESUME_FROM_RESERVE` with a new explicit authorization and write boundary.
