# x264 resume1 — official current-source locus closure

## Scope and authority

- Assignment: `SAFE-ROUTE-RECOVERY-S6-20260815-X264-RESUME1-OFFICIAL-API`.
- Exact object: fixed frame sequence with H.264 decoder semantics, on VideoLAN x264’s current default branch.
- Authority: `NONE__ROUTE_AND_CURRENT_UNION_CLOSURE_ONLY`.
- This document records source loci only. It makes no novelty, current-absence, residual, raw, brief, or scientific-negative inference.

## Neutral upstream pin

The official GitLab commit API resolved `master` to commit `0480cb05fa188d37ae87e8f4fd8f1aea3711f7ee` (`riscv64: add compile support`, committed 2025-09-10T09:40:56+08:00). The metadata and all fetched raw files are preserved and hashed in `RESOURCE_INVENTORY.yaml`.

## Static action-locus map

The recovered implementation and public parameter surface establish these currently expressed native action families for lookahead and frame-type planning:

| Locus | Current action expressed | Evidence lines |
|---|---|---|
| `encoder/lookahead.c` | Initializes lookahead state; selects threaded versus on-the-fly decision flow; queues input/next/output frames; invokes slicetype decision; shifts a decided mini-GOP into encoder order. | 68–87, 90–125, 132–161, 192–248 |
| `encoder/slicetype.c` | Analyses candidate frame sequences, including B-frame adaptive path selection, scene-cut handling, keyframe treatment, VBV lookahead and slice-type decision/reordering. | 1225, 1333, 1430, 1473–1741, 1745–1972 |
| `x264.h` | Publicly exposes lookahead threading/buffer parameters plus keyframe, scenecut, intra-refresh, B-frame count/adaptation/bias/pyramid, and rate-control lookahead controls. | 320, 324, 364–371, 469 |

The resulting bounded map is: input frames enter a synchronised or direct lookahead queue; `x264_slicetype_decide` chooses and annotates mini-GOP frame types; candidate paths, scenecut/keyframe and VBV conditions feed that choice; then selected frames are shifted/reordered for encoding. The public configuration surface includes both default-relevant fields and non-default toggles listed above.

## Bounded incompleteness, deliberately not interpreted

`encoder/slicetype.h` was listed in the addendum but not fetched: the first official metadata attempt failed during local TLS establishment and consumed one of the five frozen attempts; the remaining three were pre-registered for the two implementation files and public parameter surface. This is a budget/transport fact only. No statement is made about declarations in that header, a complete source union, an action gap, or whether any candidate is absorbed.

## Prohibited conclusions respected

No browser-page fallback, robots/Anubis bypass, unofficial mirror, clone, build, experiment, new RQ, or absence/novelty inference was used. The only network source was VideoLAN’s official GitLab API.
