# Discovery log — Wave351 OpenZFS send/receive state closure depth

## Freeze and exact contract

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE351-OPENZFS-SEND-RECEIVE-STATE-CLOSURE-DEPTH.
- Cutoff 2026-08-11; v8.7+R5-P0; QUALITY_MODE=OFF.
- Frozen controls: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan EB7043F18218AF3BD1167C034544F1EE135EEA392B7092C470DA43459043C0FC; registry 7189C5683169DEF9D5549398026F82D968725E4249E38BFEC6456A157B086FD1; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.
- Current source pin: openzfs/zfs master eec144ac031b1b4217f643b11ccd19f49faa8460.

The fixed same-object contract is source and destination dataset/snapshot state, common incremental base/bookmark, snapshot history required by the declared mode, dataset values/metadata and stock receive/scrub result. For an interrupted receive it also fixes partial state and receive_resume_token semantics. The stock oracle is zfs receive followed by snapshot/property equality and scrub; changing stream semantics, destination history, encryption/raw behavior or receiver is outside the object.

## Current producer/receiver union

Current official documentation identifies full, incremental and intermediate-snapshot streams; compressed, large-block, embedded and raw representations; recursive and property-related modes; destination rollback/overwrite constraints; partial receive with -s, receive_resume_token and send -t; and feature compatibility. Receive can override initial encryption properties in non-raw cases. Incremental replication requires a common base, and destination writes break the next increment. Stream checksums protect transport integrity. These actions/configurations are strongest current union, not a residual.

## Required joint action and action-divergence witness

A qualified N2 would need two stock-legal plans P0/P1 for the same source/target snapshots and base, both producing stock-equivalent received datasets and recovery/resume behavior. P1 must jointly choose a source-state construction plus receiver-state/recourse action outside all existing stream modes/options, while supplying an exact/FPT/approximation/Pareto guarantee over send, receive, resume, bytes and destination layout costs.

No such action is frozen. Stream packing, external compression/buffering, transport controller, send flag selection, raw/non-raw encryption choice, incremental-base selection, token scheduling or generic record transformation are all current configuration or forbidden wrappers. zstream manipulation is not a same-object native joint algorithm unless it preserves all declared stream and receiver state; no such witness/guarantee was established. Thus action divergence is UNFROZEN.

## Natural route, full cost and finite killer

A finite route is 20–50 version-pinned public OpenZFS snapshots/streams with one common base and controlled interrupted receive. Charge source snapshot/stream construction CPU-RSS-temp/bytes, transport bytes, receive CPU-RSS/temp, resume bytes/time, final dataset bytes, scrub and cold/warm access. The 72-hour killer requires P0/P1 stock receive plus snapshot/property/scrub equality and correct resume-token behavior. Fail if either plan changes base/history, feature/encryption semantics, destination rollback behavior, receiver, or reduces to modes/options/packing/buffering/controller without a target-specific guarantee.

## Collision status and decision

Official source and documentation establish the baseline union; no latest same-object paper collision is asserted cleared because no legal candidate action exists. SEARCH_BOUNDED_OPEN is not a novelty conclusion. COMPLETE_ZERO_PROPOSALS; NOT_ADMITTED_UNFROZEN. This is not caused by missing implementation, result, resources or AI readiness, and is not terminal STOP.
