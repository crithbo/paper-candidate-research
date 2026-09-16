# Stage A Report

## Identity and disposition

- Assignment: `STAGEA-L2-20260811-LLVM-RVV-GROUP-MASK-SPILL-PARETODP-INITIAL-V8.7`
- Topic: `LLVM-RVV-GROUP-MASK-SPILL-PARETODP`
- Owner lane: `CANDIDATE_EXECUTION_LANE_2`
- Owner recommendation: `BLOCKED_USER_ACTION_REQUIRED`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation: `false`
- Scientific revision consumed: `false`
- Stage B authorized: `false`

## Frozen research object

The candidate is a Pareto-DP construction for complete legal LLVM RVV
whole-register and guarded typed spill actions. The object stays inside the pinned
LLVM RISC-V register-allocation/spill semantics. VTYPE/VL, ABI, frame behavior,
MachineVerifier legality and equal-information baseline treatment are mandatory.
PR #105661 is a typed partial reference and is treated as unlanded at the pin.

No runtime claim is allowed without RVV hardware.

## PRE_CLAIM_CONTRACT_FIDELITY_GATE

The gate did not pass. F1 requires executing and hashing LLVM commit
`5bb2565693f062a9e99929db1814a7a076d4dc76` with the RISC-V target and
MachineVerifier capability. The workspace and PATH contain no verified toolchain
or build tree for that commit.

Two `llc.exe` paths discovered under unrelated candidate directories were not
executed: they are not registered shared artifacts and carry no acceptable proof
of the frozen commit. A different LLVM version, a proxy model, or static source
reasoning cannot satisfy the executable gate.

F2–F5 and the natural-trace probe were therefore not started. This preserves the
contract rather than converting unavailable execution into a scientific result.

## Evidence and costs

The only new evidence is resource-validation evidence: control/upstream hashes,
tool availability, write-boundary compliance and an auditable failure record.
There are zero MachineVerifier, candidate, baseline, natural-trace and full-cost
observations. Network acquisition and experimental compute are zero.

## Control drift handling

The user-frozen `AGENTS.md`, `plan.md`, `registry.yaml` and candidate-owner rule
were verified at assignment entry. Mainline later rewrote `plan.md` and
`registry.yaml` while this lane was active. The active assignment and write
boundary remained named in the observed registry. Following the assignment-freeze
rule, those later contents were not imported into the scientific contract; the
drift is recorded only for audit.

## Scientific conclusion

There is no scientific conclusion. In particular, this package does not recommend
PASS, STOP or HUMAN_RESEARCH_RESERVE and does not rescore the Stage-0 tier. The
topic remains at Stage A, recoverable from the blocker under the same frozen
scientific contract in a mainline-assigned resume directory.

The owner is not a final gate. Even after a future positive Stage-A probe, the
maximum claim is preliminary support/non-falsification and an independent Stage-A
gate remains mandatory.

