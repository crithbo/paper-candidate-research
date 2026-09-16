# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Stage A Resume 1 Report

- Lane id: `L2`
- Assignment id: `STAGEA-L2-20260809-S5-OCCUPANCY-CLIFF-JOINTCODEGEN-BLOCKER-RESUME1`
- Input freeze: initial handoff/report and revision1 handoff/manifest verified; both manifests complete
- Cross-assignment contamination declaration: none; no COH result, artifact, environment, or process was reused
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: `TIER_B_Q2_VIABLE` carried forward; resource failure does not re-score academic potential
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: `N2`
- Stage semantics: `RESUME_FROM_BLOCKER`; no Stage B authority

## Frozen contract

The contract preserves exact LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`, `amdgpu11.00`, wave32, identical complete pre-scheduler MIR, greedy RA, current `GCNSchedStrategy+greedy`, 8-16 natural regions, verifier legality, equal 2,000 ms method/region budgets, full cost, and two deterministic replays. Maximum resources remain 4 GiB and 4 CPU-hours with no exclusive device and no AMD GPU requirement.

Mainline's pre-attempt scope correction is recorded in `SCOPE_CORRECTION.md`: absent detached signature is not itself a blocker when official URL, exact size, frozen SHA-256, and signed exact commits form the provenance chain. No scientific gate was relaxed.

## Highest-risk probe result

- Risk-bearing premise: unchanged and not executed.
- Resource attempt: one official-release download, no retry.
- Exact failure: response expected `187,504,083` bytes; received `133,887,242`; short by `53,616,841`.
- Negative-result meaning: resource transfer failure only, not a counterexample and not evidence of current-LLVM absorption.
- Positive-result ceiling: not applicable because no claim-bearing observation exists.

## Non-relaxable quality audit

- Same-object: frozen, not executed.
- Latest collision: unchanged `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`.
- Strong fair baseline: not executed.
- Natural input/evidence: `0/8`; corpus stage not reached.
- Full-cost: complete for the failed resource attempt only.
- Reproducibility: input and failure hashes closed; scientific replay not available.
- Evidence/claim honesty: pass; no scientific conclusion drawn.

## Supported and unsupported claims

Supported: frozen inputs were intact; the only authorized download was truncated; the partial was rejected before extraction.

Unsupported: candidate legality, occupancy tier, spills, compile cost, residual headroom, current LLVM absorption, paper mechanism, runtime, GPU, or hardware claims.

## User-action blocker

- Claim-bearing observation obtained before failure: no
- Scientific revision consumed: no
- Immutable failure directory: this directory after hash closure
- Resume rule: any future attempt must use a new mainline-assigned resume directory and the unchanged scientific contract
- Blocker packet: `USER_BLOCKER_PACKET.md`

## Stage B boundary

- `pending_user_stageb_review`: false
- `stageb_user_approval_id`: null
- `stageb_authorized`: false

