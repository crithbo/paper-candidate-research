# Stage A Report

## Decision first

- Assignment: `RESOURCE-STAGEA-L3-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-RESUME1`
- Topic: `RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP`
- Resource gate: `PASS`
- PRE_CLAIM_CONTRACT_FIDELITY_GATE: `PASS`
- Owner recommendation: `STOP`
- Final authority: independent Stage A gate / mainline, not this owner
- Claim-bearing observation: yes, only after PRE_CLAIM PASS
- Scientific revision consumed: `false`
- Stage B authorized: `false`
- Lane release state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`

## What was established

The exact LLVM commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba` was built locally with the required RISC-V backend and native tools. The two complete witness plans pass MachineVerifier, native assembly/link/readback and unwind checks. The WL-ZCMP planner maps its frozen joint pre-RA location/rlist-adjust/residual-spill actions into unmodified LLVM; its small exact frontier matches an independent Cartesian oracle for widths `0..4`.

The current native action and flag audit closes default/greedy/basic/fast allocation, target hints and cost controls, CSR cost scales, first-use costs, shrink-wrap, fixed pushable register prefixes, legal rlist/adjust, ordinary spill paths, CFI/FrameLowering and late PushPop/POPRET expansion. The comparator is a finite collection of individually executable same-information arms.

## Natural pilot

The corpus was frozen before result observation from official Embench-IoT `embench-1.0` (23 source modules, 273 canonical functions). Five functions passed the result-independent abstract screen; exact same-commit single-function replay removed `freeecc` before comparison because it had no remaining cross-call interface. Four functions remained.

All 11 candidate plans and all 72 current-union arms passed the exact five-step native chain. On all four functions, the union matched the candidate's best complete function text and frame coordinate. Paired p50/p90 text and frame residuals were both zero. Candidate full construction added positive CPU and wall cost. Useful residual coverage was 0%, below the frozen 10% killer threshold.

The raw assembly-hash action gap was 8/11, but these distinct actions were equal or worse in the registered primary metrics. They cannot support a paper claim merely because they are different.

## Contract-fidelity notes

- Atomic action mapping: PASS; pre-RA identity/location decisions and native stack objects flow through the unmodified exact continuation.
- Native codec/writer/reader parity: PASS; no post-object rewriting or alternative reader.
- Comparator semantics: PASS; 18 individually executable same-information current configurations.
- Common denominator/full cost: PASS for static construction and native verification; target runtime unavailable and explicitly unestimated.
- Small witness: PASS; both native plans plus exact DP/oracle equality.
- Natural CFI state: all compared outputs share the input's CFI/unwind state; the explicit unwind-rule witness is the claim-critical CFI check.

## Why STOP is recommended

The candidate remains a real bounded constructor, but its natural useful action residual is zero. The current union produces an equal primary point on every retained natural object, while the candidate pays additional planning cost. That is direct same-object baseline absorption and a preregistered scientific falsifier, not an infrastructure shortfall.

This recommendation is limited to the frozen candidate ID and contract. It does not authorize renaming/revival, Stage B, a mechanism pivot, shared-file edits or a new assignment.

## AI execution ledger

The AI owner executed all six claim-critical work packages completed here: exact source/tool acquisition, isolated exact build, candidate implementation and tiny oracle, complete current-union implementation, canonical natural-corpus pipeline, and deterministic full-cost analysis. Thus the measured package-level AI core fraction is `6/6 = 100%` of executed claim-critical packages; this is not presented as a human-labor time estimate. User/mainline contribution was policy authorization and the frozen scientific contract.

## Q1 evidence gap and Stage B route

The upstream Q1 calibration contains one paper-grade generic joint-codegen anchor plus the ratified ISA and current LLVM implementation anchors. It does not satisfy the ordinary three-paper Q1 parity minimum, and this run did not start a new Discovery search. `Q1_EVIDENCE_GAP_REVIEW.md` records that limitation. The candidate already fails the stronger same-object natural residual gate, so missing Q1 breadth is not used to manufacture the STOP result.

A Stage B plan is `NOT_APPLICABLE_UNDER_OWNER_STOP_RECOMMENDATION`; Stage B remains unauthorized. If an independent gate rejects the scientific falsifier, only mainline may issue a new frozen instruction.

## Integrity and budget

All claim-critical inputs/results are listed in `HASH_MANIFEST.sha256`. Exact source/tool provenance, resource bytes, build costs, command failures and the retained partial controls are documented. The run stayed below 35 GiB storage and 64,800 CPU-second authorization; no system/global mutation occurred.
