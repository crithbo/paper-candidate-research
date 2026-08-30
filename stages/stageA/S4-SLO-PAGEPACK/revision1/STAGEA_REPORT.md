# S4-SLO-PAGEPACK Stage A Scientific Revision Report

## Outcome first

`STOP_RECOMMENDED_FROZEN_NARROW_MECHANISM`, with evidence ceiling `FROZEN_THREE_EPOCH_TRACE_LEVEL_SCIENTIFIC_STOP_ONLY`.

The sole Stage A revision repaired the two fatal fidelity defects identified by the independent gate: it executed an auditable OBASE-style pointer relocation state machine, and it replaced the threshold/prefix proxy with one frozen deployable composition, `OBASE_DEFAULT_NEW_HOT_COLD_CIW3_SAMA_TO_MDK_AGE_RA20_PR5`. The original three MetaKV epochs, exact selected objects, trace hashes, page size, backend, semantics, mobility contract and candidate action were retained.

All three independent method replays are legal and semantic-equivalent. Nevertheless, `0/3` epochs meet the preregistered strict full-cost criterion. Epochs 1/3 show positive raw average reclaimed-byte differences, but exact planning is worse on states, transitions, target-subset evaluations, probes and hashes, so those points are not full-cost non-dominated. Epoch 2 is directly worse in reclaimed bytes. This is scientific negative evidence on the frozen narrow mechanism, not a readiness or sample-size STOP.

## Assignment and integrity

- Lane: `CANDIDATE-EXECUTION-LANE-1`
- Assignment: `STAGEA-L1-20260809-S4-SLO-PAGEPACK-REVISION1`
- Parent assignment: `STAGEA-L1-20260809-S4-SLO-PAGEPACK-INITIAL`
- Write scope: `stages/stageA/S4-SLO-PAGEPACK/revision1/` only
- Cross-assignment contamination: `false`
- Mechanism pivot: none
- Scientific revision consumed: `true`, after successful primary claim-bearing observation
- Resource blocker: none
- Stage B: `false`; `stageb_user_approval_id=null`

The gate handoff/review/manifest hashes were frozen as `ACD8555E...4C6D`, `0B918E06...1494`, and `5C3B6FAA...694B`. The revision trace is byte-identical to the parent frozen trace (`E5D16D84...F2A8`). The script recomputed the selection and initial layout and required equality with the parent stable artifact before solving.

## Evidence contract

The immutable contract is `REVISION_CONTRACT.yaml` (SHA-256 `86A55019...389A4`). It removes the initial uncalibrated normalized-work scalar. The fixed 5% SLO is a windowed promotion-rate constraint; bytes and all cost events are retained as typed dimensions without a work-to-byte conversion.

The positive gate required: legal candidate replay, legal comparator replay, a strictly larger time-averaged reclaimed-byte result, and no worse registered non-common deterministic costs. Any positive epoch would have been capped at `PRELIMINARY_SUPPORT`; no epoch is positive.

## Faithful same-object composition

The named OBASE side uses official-paper Guide access tracking, SODA-style discovery, `NEW/HOT/COLD` heaps, CIW=3 boundary classification, deterministic separate SAMA-style temperature runs and Guide/TAG/ATC/ODM relocation. It is one fixed configuration, not a threshold sweep or post-hoc envelope.

The named MDK side is the online AGE policy with age threshold 20 logical scans and a 5% promotion-rate SLO. Each 1,000-row block is one logical scan because the frozen MetaKV slice contains no wall-clock timestamps. OPP was excluded from deployment comparison because it needs future knowledge. AGE policy decisions were actually replayed window-by-window; pages aged, demoted, promoted and contributed to the recorded SLO.

## Pointer safety and semantics

The replayer does not use a common digest as evidence. It constructs separate original, candidate and comparator heaps. A stable Guide owns each object; operation TAGs keep ATC positive during GET/SET/DELETE; all handles drain before boundary relocation. Moved objects use lock CAS, destination capacity allocation, payload copy, guide commit CAS and source retirement. Independent logical transcripts and final states are hashed only after execution and then compared.

All method-local semantic and final-state hashes agree per epoch. All capacity checks pass, every ATC drains to zero, every migration lock clears, and no fallback is taken. Method-specific relocation transition hashes differ, demonstrating that the migration paths were separately executed.

## Killer result and mechanism interpretation

The result is not “JOB 4a-style natural structure inspection.” It is a claim-bearing finite solver/replay result on the frozen natural trace slice.

- Epoch 1: candidate reclaims one empty fast page produced by packing, but exact planning is costly; the fixed AGE comparator also violates its windowed SLO after one late promotion. No strict full-cost point.
- Epoch 2: candidate selects no slow page; the composition safely ages/reclaims pages and reaches 4,232 B average reclaimed capacity. Negative residual.
- Epoch 3: candidate reclaims one page from the boundary and has a +2,595 B raw average residual over legal AGE, but exact planning remains worse on every enumerative planning field, so the result is not full-cost non-dominated.

The no-gain boundary is therefore sharper than the initial proxy STOP: exact joint packing can expose an empty page, but under the frozen exact algorithm its planning burden prevents a cost-complete residual; the cheap named composition wins one epoch and remains a strong competing mechanism.

## Quality assessment

The Stage 0 paper kernel required an executable strict residual over current object-layout and SLO-policy work. That kernel is absent after its single permitted fidelity revision. The result is below the minimum Q2 continuation line for this frozen mechanism, so `BELOW_Q2_STOP` is recommended to mainline.

This does not claim that a different approximation algorithm, a larger object set, another SLO metric or a production OBASE/CacheLib runtime is impossible. Those would change the frozen mechanism/evidence object and cannot be used to rescue this assignment.

## Reproducibility and resources

Commands:

```text
node tools/run_revision_probe.mjs --mode primary
node tools/run_revision_probe.mjs --mode replay
node tools/validate_revision.mjs
```

Primary/replay stable SHA-256 is `2CA67973...0E19B`; byte equality and every nonvolatile validator field pass. Workspace remained far below 4 GiB; peak measured RSS was about 153.6 MiB; no GPU or exclusive device was used. One pre-result implementation attempt was stopped after it redundantly rescanned the full trace inside every layout. It emitted no artifact or claim; access windows were then losslessly preaggregated without changing search space or contract.

## Required boundary

No Stage B, automation, large-scale experiment, project write or user approval was started. Mainline should mechanically verify the manifest and dispatch an independent Stage A gate if required. After mainline acceptance, the lane is `IDLE_REUSABLE_AWAITING_MAINLINE`.

