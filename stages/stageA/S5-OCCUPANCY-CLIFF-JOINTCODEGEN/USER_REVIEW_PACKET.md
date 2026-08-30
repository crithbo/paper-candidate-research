# User Review Packet — S5-OCCUPANCY-CLIFF-JOINTCODEGEN

## Owner recommendation

`REVISE_ONCE`. Do not advance to Stage B and do not set `PENDING_USER_STAGEB_REVIEW`.

## What was actually done

The experiment froze LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`, target `amdgpu11.00`, two public upstream MIR regression artifacts, normalized tier thresholds, exact search budgets, commands, and hashes. A deterministic tier-frontier scheduling model was implemented and run, then replayed twice with identical non-timing output hashes.

## Result in one table

| Case | Candidate vs input proxy | Tier/spill outcome | Interpretation |
|---|---|---|---|
| 78-instruction partial excerpt | cycle proxy 126→93 | tier 8→8; spills 0→0; peak pressure 8/1→9/2 | latency-model gain, no cliff evidence; pressure worsens |
| 26-instruction complete regression | cycle proxy 31→30 | tier 8→8; spills 0→0; SGPR peak 5→3 | small model gain, no cliff evidence |

## Why this is not a PASS

The current machine lacks `llc`/AMDGPU tools and has an NVIDIA rather than AMD GPU. The executed model omits physical-register aliases, regmasks, hazards, allocator interference, and verifier legality. The inputs are compiler regression artifacts, not natural workload evidence. Therefore the mandatory Stage A tuple—natural workload + strongest named baseline + runnable minimum mechanism + mechanism-specific result—is incomplete.

## Why this is not yet a STOP

The failed discriminator is the coarse model, not the exact LLVM object. Upstream current LLVM already establishes that occupancy/pressure interaction is real, but the bounded scan did not find the exact fixed-budget multi-bank joint certificate. A small, concrete tool/corpus addition can test the original killer without Stage B or large-scale experiments.

## Exact bounded resource request

- Purpose: execute actual GCNSchedStrategy + greedy RA, verify candidate MIR legality, and measure real tier/spill/compile-cost deltas.
- Resource: immutable candidate-local LLVM AMDGPU build at commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791` with `llc`, `FileCheck`, and `llvm-calc-occupancy`; manifest of 8–16 complete public natural-kernel-derived `amdgpu11.00` MIR regions.
- Size/time: ≤4 GiB disk, ≤4 CPU-hours, no exclusive hardware, no AMD GPU required for this Stage A revision.
- Rollback: delete only the candidate-local tool bundle/corpus.
- Failure consequence: strongest-baseline, legality, and natural-cliff gates remain untestable; Stage A should not PASS.

## Authority boundary

- Independent Stage A gate: not yet passed.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B approval ID: null.
- Stage B authorized: false.

