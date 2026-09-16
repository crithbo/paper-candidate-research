# LLVM-BITCODE-ABBREV-PLANNER User Review Packet

- Stage: `STAGEA`
- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260811-LLVM-BITCODE-ABBREV-PLANNER-RESUME1-V8.7`
- Decision: `STOP_RECOMMENDED__AWAITING_MAINLINE_ADJUDICATION`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `NEGATIVE_KILL__B2_FULL_ACTION_ABSORPTION`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `no`
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

The fidelity gate passed before natural execution.  On 100 frozen public
modules, all 400 B0/B1/B2/WL files passed exact expanded-trace equality,
canonical decoded-IR equality, native parse/disassembly, `opt verify`, and read
trials.  WL improved B0 on 63 modules by 320 bytes total, but B2 emitted the
same bytes and hashes as WL on all 100 modules.  Residual coverage is 0/63 = 0%,
and p50/p90 union residual is 0 B.

## What is not established

No positive candidate advantage, access benefit, paper-level N2 residual,
universal impossibility, or result for other LLVM versions/action universes is
claimed.  The old failed-offset and rejected top-level BLOCKINFO constructions
are controls only.

## Exact object and narrow claim boundary

One pinned Module plus its frozen expanded semantic trace maps to one ordinary
raw native LLVM bitcode file.  Only legal abbreviation grammar, scope/order,
induced IDs/CodeLen, and unchanged-record assignment can differ.  No record or
offset value, IR, module boundary, codec, or reader changed.

## Decisive evidence

- 100/100 WL outputs byte/hash equal B2.
- 0/63 useful modules have a strongest-union residual.
- p50/p90 residual = 0/0 bytes.
- Identical B2/WL files preclude a candidate-only access benefit; timing noise
  is not promoted to a claim.

These satisfy three frozen scientific STOP conditions.  This is not a resource
blocker and cannot be routed to `BLOCKED_USER_ACTION_REQUIRED`.

## Fair baseline and full-cost status

B0 includes the pinned native writer; B1 is the exact current-grammar oracle;
B2 has the same candidate universe, scope feasibility, bounds, and exact ledger;
B3 is a tiny ceiling only.  Measured CPU was 0.019831 hours, max planner RSS
35.1 MB, max native RSS 17.1 MB, and workspace 1.354628 GiB.

## Reproducibility and integrity

The package includes exact archive URL/commit/tag/license/hash, deterministic
selection, 100 source/module/trace/command hashes, every arm and verification,
scripts, command log, reports, handoff, and final SHA-256 manifest.

## User action requested

No resource or Stage B action is requested.  Mainline should mechanically
validate the manifest and adjudicate the owner recommendation.  The owner has
not modified shared control state.

## Recommended next state

`STOP`, subject to mainline acceptance.  Do not start Stage B and do not create
a formal project.
