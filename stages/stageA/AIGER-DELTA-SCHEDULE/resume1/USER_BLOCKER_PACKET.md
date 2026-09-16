# AIGER-DELTA-SCHEDULE User Blocker Packet — Resume1 R3E

- Stage and assignment: Stage A resource resume / `RESOURCE-STAGEA-L2-20260811-AIGER-DELTA-SCHEDULE-RESUME1-R3E`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN`
- Failure point: exact Windows native build and stock binary smoke, before six-AND or any natural run.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\AIGER-DELTA-SCHEDULE\resume1`

## Exact resource needed

- Exact components: AIGER `039ec1a2cc37d3093ac35c4b6df65336b346f409`, Yosys `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552`, ABC `6c51a9238544bce6eb300b7b1c3e5bb4215bec84`.
- Required capability: standard binary AIGER write/read roundtrip on Windows x64, Yosys `write_aiger` including `-no-sort`, and ABC standard `write_aiger` plus `-u` control.
- Required provenance: executable and runtime-DLL byte sizes and SHA-256; exact commit/build command/compiler/runtime provenance; upstream license files; unchanged source/test statement; passing help/version and stock AIGER roundtrip transcript.
- Preferred size: portable bundle no more than 1 GiB compressed and 3 GiB extracted.
- No weak checker, alternate codec, rewritten graph, patched result, system installation, or global PATH dependency is acceptable.

## Minimum user/mainline action

Provide one portable Windows x64 bundle meeting the above exact pins and smoke contract, then issue a new immutable resume assignment. Alternatively, explicitly authorize one newly frozen platform route, such as portable Cygwin/another POSIX Windows runtime or Linux/WSL, with its object-parity proof, budget, write directory and evidence ceiling. The current assignment does not authorize those routes or any system installation.

## Approved finite recovery envelope and exhaustion

- Authorization: `AIGER-EXACT-TOOLCHAIN-RESUME-20260811-R3E`.
- Route: official exact codeload sources + mainline-registered portable MSYS2/Clang, no source patch, at most two clean builds per component.
- AIGER: 2/2 builds used; attempt 2 built, but stock binary roundtrip failed due Windows CRLF output.
- ABC: 2/2 builds used; final attempt failed in bundled CaDiCaL unlocked stdio API.
- Yosys: source and exact gitlink dependencies acquired; build not started after the conjunctive route became impossible.
- Approved routes remaining: none.
- Registry-directed reserve fallback: mainline may evaluate only after this `ROUTES_EXHAUSTED` proof. Owner did not and cannot self-reserve.

## Resume contract and safety boundary

- Parent contract SHA-256: `8262CCF6F5C39C9F7E2E586AFF592D1A62429B7971B40514267DF2DBC7584287`.
- New future resume directory must be assigned by mainline and must not overwrite `initial` or `resume1`.
- First checks after unblocking: bytes/SHA/license/provenance, help/version, stock native reader/writer smoke, then six-AND native union replay and full fidelity gate.
- Only after every gate passes may HWMCC or any claim-bearing run begin.
- No Stage B, system/global change, automation, formal project, or external submission.

## Cost and unexecuted work

- Downloaded: 14,325,374 bytes from seven official archives.
- Recorded build cost: about 437.42 CPU seconds and 382.28 wall seconds.
- Storage before report closure: 204,022,805 bytes.
- Not executed: Yosys build, six-AND native union, candidate, baselines, HWMCC, natural full cost, scientific revision, Stage B.

