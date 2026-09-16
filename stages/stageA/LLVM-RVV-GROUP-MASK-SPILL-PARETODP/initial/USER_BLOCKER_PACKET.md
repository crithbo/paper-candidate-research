# USER_BLOCKER_PACKET

## Blocker

- State requested: `BLOCKED_USER_ACTION_REQUIRED`
- Kind: `TOOLCHAIN_RESOURCE_UNAVAILABLE`
- Failure point: `PRE_CLAIM_CONTRACT_FIDELITY_GATE / F1`
- Exact requirement: LLVM commit
  `5bb2565693f062a9e99929db1814a7a076d4dc76`, built with the RISC-V target,
  MIR parsing and MachineVerifier support
- Missing locally: verified `llc`, `FileCheck`, LLVM companion tools and an exact
  source/build tree
- Claim-bearing work completed: none

## Minimum user/mainline action

Provide one of the following through a new, explicitly assigned resume directory:

1. A portable exact-commit LLVM bundle containing at least `llc` and `FileCheck`
   (plus any required runtime libraries), with RISC-V listed by `llc --version`;
   or
2. An exact source checkout/archive plus explicit authorization and resource
   ceiling to build it wholly inside that resume directory.

For either form, include:

- immutable commit ID above;
- per-file/archive byte size and SHA-256 manifest;
- source/release URL and license/provenance;
- build configuration sufficient to show the RISC-V target, MIR parser and
  MachineVerifier are present;
- no requirement for a system-wide install or global environment change.

The lowest-risk action is option 1: place the portable bundle at a mainline-frozen
path and send its manifest/hash in a `RESUME_FROM_BLOCKER` assignment.

## Acceptance smoke after resume

Before any scientific observation, the lane will:

1. verify byte sizes and SHA-256 values;
2. record `llc --version` and the RISC-V registered target;
3. verify that the executable provenance resolves to the exact commit;
4. run a tiny non-claim MIR parse/MachineVerifier smoke;
5. resume F1–F5 in order; only a five-part PASS unlocks natural traces.

## Safety and cost boundary

- No asset was downloaded in this assignment.
- No existing cross-candidate binary was used.
- No system install, global environment mutation, GPU or exclusive device is
  needed.
- If a source build is chosen, mainline/user must first freeze its disk, network
  and CPU ceiling; none is inferred here.
- Resumption must not overwrite this `initial` package.

## Non-inference

This is a resource blocker before the first claim-bearing observation. Evidence
ceiling is `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`; scientific revision
is unconsumed. The topic must not be stopped, reserved or archived because of this
packet.

