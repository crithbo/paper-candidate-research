# User Review Packet — LLVM-APX-PREFIX-PRESSURE-PARETODP

## Decision requested

No scientific decision is requested. Please treat this assignment as `BLOCKED_USER_ACTION_REQUIRED`, release lane 1, and decide later whether to provide/authorize the exact pinned LLVM resource for a new `resume1`.

## What is verified

- All frozen inputs passed their declared hashes: controls `4/4`, Discovery `8/8`, Stage0 revision `4/4`, closing `2/2`.
- The Stage0 proposition remains only a static, conditional Tier-B candidate.
- The local environment lacks every LLVM/APX execution tool and portable build prerequisite except Git.
- No candidate or natural experiment ran; no scientific revision was consumed.

## What is not verified

Native APX bytes, MIR/MachineVerifier legality, value/flags/ABI equivalence, full native action catalog, certified transition bisimulation, labeled/quotient exactness, natural action incidence, strongest-union residual, full-cost benefit, and runtime are all unobserved.

## Minimum unblock action

Authorize a new `resume1` and provide an unmodified Windows x86-64 LLVM tree at exact commit `a1194be1baefa99d20a09bd04b16056be0ab7225`, including APX-capable `llc`, `llvm-mc`, `llvm-objdump`, `llvm-readobj`, `opt`, `FileCheck`, MIR tests, hashes, provenance, build configuration and LLVM license files. Preferred destination and safe verification sequence are specified in `USER_BLOCKER_PACKET.md`.

## Boundaries retained

- Same MachineIR/program/APX features/ABI/CFI/unwind object.
- Current LLVM complete chain, finite tuning, Unison-equivalent exact subtractor, labeled DP and micro oracle remain the fair union.
- Natural run remains forbidden until all five ordered preclaim items pass.
- StageB remains false and approval remains null.
