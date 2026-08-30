# Discovery log — Wave289 Qt RCC resource-tree/index/layout version-delta N2 closure

## Freeze and fixed contract

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE289-QT-RCC-RESOURCE-TREE-INDEX-LAYOUT-VERSION-DELTA-N2-CLOSURE.
- Cutoff 2026-08-11; method v8.7+R5-P0; DISCOVERY_QUALITY_MODE=OFF.
- Frozen hashes: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan 71B89CB6DC49FD01EEC1ECD49D08C1D14FCB17DA01461F4734C3A6B546D6747F; registry 234E8245C7CFB2F9677D8A6DC091488C53872F1BE9AC64D593E906B2774049E0; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.
- Current source pin: Qt qtbase dev bfe073592a0f85fa3ec96f1e85d2922937707ba6.

The exact object is two adjacent logical releases of one QRC tree: the same resource names, bytes for retained resources, aliases, prefixes, locale fallback and application-observable results. Each release must be consumed by stock QResource/QFile lookup and stock registration/load. A changed reader, changed RCC format, altered namespace/root/locale semantics, split package or application wrapper is outside the object.

## Current upstream reality check

Qt documents the current producer/reader union: rcc accepts QRC resource declarations and emits generated source or binary RCC; binary resources are registered by QResource. Current documented switches include binary form, format version, compression algorithm/level, root, namespace, temporary file and large-resource passes. QResource exposes locale-dependent lookup, direct data, compression state, registration and unregistration; a registered RCC may be file-read or memory mapped. These are comparator actions, not absences.

The source pin is frozen. The needed source facets for an eventual closure are the pinned rcc resource tree/name/data/locale index builder and the QResource binary parser/lookup path, including the stock format-version and validation checks. This Discovery-only pass did not reproduce a source-level enumeration of all writer and reader operations; it makes no claim that the listed public flags are exhaustive.

## Required adjacent-version two-file witness

Let T0/T1 be adjacent QRC logical trees and F0/F1 their binary RCC outputs. The required witness must show a source-authorized construction whose legal action jointly changes tree/index and physical layout while retaining each release's exact stock QResource results. It must use the same format version, reader, root, namespace, locale behavior and retained bytes; a deterministic full resource-tree scan and all selected locale lookups must agree with the corresponding stock baseline.

The action must additionally create a valid incremental/delta relation between F0 and F1 under a declared target profile W, with an exact, FPT, approximation or Pareto guarantee over construction, delta/apply, bytes and loader/query costs. No source-authorized native delta or legal independent tree/index-layout mutation was frozen. Simple resource ordering, hash/packing, compression/format flag choice or an external delta/postprocessor is explicitly insufficient. Thus no legal F0/F1 divergence witness exists in this evidence.

## Natural route, full cost and killer

A finite natural carrier is a version-pinned Qt application resource set, such as the official Qt examples plus adjacent source revisions, retaining 20–50 QRC paths and locale cases. The stock oracle is QResource registration, lookup, byte equality and full resource-tree enumeration. Charge profile/planner/build CPU-RSS-temp, F0/F1 bytes and delta/apply bytes/CPU-RSS, plus registration/load and cold/warm lookup/full-scan CPU-RSS-latency.

Within 72 hours, a Stage-A closure must enumerate the pinned builder/reader union and create stock-readable F0/F1. Fail closed if the change is only a listed flag/order/generic packing/delta, requires any changed reader/format/namespace/locale semantic, lacks stock equivalence, is current-union expressible, or has no bounded target-specific guarantee. Re-run primary direct-collision search only once a complete legal action exists.

## Decision

COMPLETE_ZERO_PROPOSALS; NOT_ADMITTED_UNFROZEN. The reason is missing source-authorized two-version action divergence and unclosed full union, never missing implementation, results, data/resources or AI readiness. It is not terminal STOP.
