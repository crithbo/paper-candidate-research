# LLVM-PPC-PREFIX-PRESSURE-PARETODP User Blocker Packet

- Stage/assignment: StageA / `STAGEA-L2-20260811-LLVM-PPC-PREFIX-PRESSURE-PARETODP-INITIAL-V8.7`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN`
- Failure time: `2026-08-11T09:59:25+08:00`
- Exact failure: no provenance-verified exact-commit LLVM/PPC64/MIR/MachineVerifier/MC/lld toolchain is available
- Claim-bearing observation before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- StageA scientific revision consumed: `no`

## Exact resource needed

- Commit: `f127b4c19c63b0492fb924934e37e032c17ea35b`
- Required executables/capabilities: `llc` or `clang` with PowerPC target,
  MIR parser and MachineVerifier, `llvm-mc`, `llvm-readobj`, `llvm-objdump`,
  `ld.lld`, `FileCheck`, and their runtime libraries
- Required target behavior: Power10, ppc64le Linux ELFv2, medium code model,
  prefixed PCREL34 assembly/relocation/linking
- Provenance: official `llvm/llvm-project` source at the exact immutable commit,
  build configuration, license, archive/file byte sizes and SHA-256 manifest
- Expected size/SHA: not invented here; mainline must freeze the chosen build or
  source asset's exact values before resumption

Accepted forms:

1. Preferred: a portable exact-commit bundle requiring no system install.
2. Exact source archive/checkout plus explicit authorization to build only in a
   new resume directory, with network/disk/CPU ceiling and cleanup disposition.

An arbitrary LLVM release, a different commit, GCC-only toolchain, GOT witness,
unregistered cross-candidate binary or precomputed proxy is not acceptable.

## Minimum user/mainline action

Place the portable bundle at a mainline-frozen path and issue a
`RESUME_FROM_BLOCKER` assignment naming its byte size, SHA-256 manifest,
provenance and the new write directory. If a source build is preferred, explicitly
authorize it and freeze the maximum transfer, peak disk and CPU-hours first.

The recommended resume path is
`stages\stageA\LLVM-PPC-PREFIX-PRESSURE-PARETODP\resume1\`; mainline owns the
actual directory assignment.

## First safe checks after resume

1. Recompute archive/file byte sizes and SHA-256 before extraction/execution.
2. Record `llc --version` and confirm a PowerPC target.
3. Validate exact commit/build provenance.
4. Run a non-claim PPC/MIR/MachineVerifier and MC/lld smoke.
5. Execute F1–F5 in order; only a five-part PASS unlocks natural functions.

## Work and cost already incurred

- Network/download: `0 B`
- Experimental CPU/storage/device: `0`
- Completed: control/upstream hash validation, four manifest replays, contract,
  tool inventory and canonical blocker package
- Not executed: compiler/linker witness, candidate, baselines, oracle, public
  functions, full-cost measurement, runtime or Stage B

This resource failure must not STOP, reserve or archive the topic.

