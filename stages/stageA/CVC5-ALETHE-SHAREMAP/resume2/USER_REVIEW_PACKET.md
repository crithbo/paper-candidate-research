# User Review Packet — CVC5 resume2

## Completed

- Frozen controls and minimal CVC5 packages were verified.
- Official Carcara release/tag/commit and Apache-2.0 license provenance were
  checked against GitHub.
- Official release assets, registry, topic tree and D-root executable filenames
  were checked for the required Windows x64 checker.
- Resource and StageA contracts were frozen before any executable acquisition.

## Result

No Windows `carcara.exe` exists in the official release or supplied workspace.
The only release binary is Linux. Therefore bytes/SHA, version/help and stock
checker smoke cannot close, resource readiness is false, and StageA auto-resume
did not trigger.

## Not performed

No download, build, candidate, checker run, natural instance, full-cost probe,
StageB action, system install or global mutation occurred.

## Requested mainline disposition

Record `BLOCKED_USER_ACTION_REQUIRED`, preserve this immutable resume2 package,
release lane2, and request the provenance-frozen exact Windows binary described in
`USER_BLOCKER_PACKET.md`. No scientific decision or StageB review is supported.
