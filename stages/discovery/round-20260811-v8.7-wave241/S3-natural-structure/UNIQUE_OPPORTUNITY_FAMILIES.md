# Unique opportunity families

## UOF-241-01 — version-aware FDT string/layout construction

Input/output: a fixed decoded device-tree relation; output a legal DTB with the same node/property/value semantics and accepted by the stock FDT reader.  The format's structure block references property-name offsets in a concatenated strings block, so legal string placement is a possible construction degree of freedom.  Current `dtc`/libfdt union, exact writer flags and a release-pair carrier need freezing.

## UOF-241-02 — version-aware kmod binary dependency-index construction

Input/output: fixed dependency and alias mapping for a fixed module tree; output an index accepted by libkmod/depmod consumers.  Candidate is a predecessor-aware finite-frontier trie/layout construction versus depmod's current per-version index producer plus VCDIFF.  Exact binary index grammar, deployed configurations and official adjacent fully matching module trees remain unfrozen.

## UOF-241-03 — version-aware OpenJDK jimage resource-index construction

Input/output: fixed module/resource names and bytes in `lib/modules`, with stock jimage lookup/read semantics.  Candidate is a legal resource-index/layout frontier jointly optimized for per-image bytes and delta.  JEP 220/jimage evidence establishes a native image and reader purpose, but a current exact jlink builder union/config and legal layout action set are not frozen.

## UOF-241-04 — .NET ReadyToRun composite image

Reader/builder and identity/compatibility fields were not frozen from current primary sources. `NOT_ADMITTED_UNFROZEN`.

## UOF-241-05 / 06 — Linux ORC and GNU build-id

ORC lacked a non-wrapper whole layout action under ordered lookup semantics; build-id changes an observable identity field when bytes change. Both are structural `DROP`, not readiness judgments.
