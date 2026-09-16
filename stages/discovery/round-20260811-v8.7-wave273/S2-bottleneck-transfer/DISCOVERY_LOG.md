# Discovery log — Wave273 ICU DAT package lookup/layout N2 closure

## Assignment and frozen control plane

- Assignment: `DISCOVERY-S2-20260811-V8.7-WAVE273-ICU-DAT-PACKAGE-LOOKUP-LAYOUT-N2-CLOSURE`
- Cutoff: 2026-08-11. Discovery method: authoritative v8.7+R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.
- Frozen controls: `AGENTS.md` `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; `plan.md` `613DB37C4449107ADA912D014DB85C15C2480B3A1B4D14AFDE30A823C3E511EB`; `registry.yaml` `DCB50114E416DFE4A480BD7CEF38CD92627580DC6E7409B8676464B2213B257C`; `rules/ROLE_DISCOVERY.md` `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Current upstream pin: ICU `main` commit `f86dc86d89aa3c3cd661af8b88e6b4d2ac99ca59` (queried 2026-08-11). This is a source pin for follow-up, not a claim that every source facet was exhaustively reproduced here.

## Fixed same-object contract

The contemplated object is one ICU common-data archive containing a fixed logical resource-bundle set: the same resource item names, locale keys, values, aliases, bundle fallback behaviour, data version, chunk contents, and package identity. The observable contract is acceptance and returned data from stock ICU `udata` and `ures` APIs, including a full package scan; a changed reader, changed resource semantics, split package, or changed data modality is outside the object.

The candidate carrier would be a version-pinned ICU data release built from the bundled CLDR-derived data sources, with a version-pinned lookup profile over naturally occurring locale/resource accesses. This is a finite acquisition route, not a present benchmark result.

## Current-union reality check

First-party ICU documentation establishes a material existing action/configuration surface: data can be packaged for library, static, file, or archive deployment; package data may be supplied through common or application data; loader path and caching are part of loading; and the data build uses ICU packaging tools. The documentation also identifies package/archive endianness and data-format handling as existing concerns. `ures_` is the stock C resource-bundle interface. The pinned upstream source locations to close in Stage A are `source/tools/toolutil/pkg_gencmn.cpp` and the relevant package tooling, plus common-data and resource-bundle reader paths.

That is enough to reject an absence inference from old format descriptions, but not enough to freeze a union-external stock-legal index operation. In particular, the following proposed action needs a legal two-layout certificate before it can become an N2:

> Given bundle set `B` and target lookup distribution `W`, jointly construct a package lookup index and physical item placement while preserving the stock archive representation and every `udata`/`ures` observable result; optimize a stated cold-page/lookup objective under a fixed byte and update budget, with an exact, FPT, approximation, or Pareto guarantee.

The contemplated state/action/guarantee is nontrivial in the abstract, but the present audit did not freeze its legal native action domain. Existing packaging, ordinary resource ordering, alignment/endianness choices, and build configuration are either already in the current surface or are expressly insufficient for this assignment. A generic placement/packing algorithm, MPH substitution, compression change, reader change, or package split would not repair that deficiency.

## Minimal divergence witness required but not closed

The required certificate would use two archive files `F0` and `F1` made from the identical bundle set `B`:

1. `F0` is the current stock-tool package under a frozen configuration.
2. `F1` differs only by a source-authorized package-index plus physical-layout construction action; it retains the same archive modality, item names, bytes/values, reader and API contract.
3. Stock `udata_open`/`ures_open` results and a deterministic full scan agree for every chosen bundle/key; no custom loader or reader is present.
4. The action is not merely item reordering, alignment, endianness, compression, or a configuration selection, and the target-specific algorithm supplies a stated guarantee.

No official current-source evidence was found in this static pass that proves such an `F1` is a legal current package action rather than generic packing or a reader/format modification. Therefore the divergence witness and complete producer+reader union remain **UNFROZEN**. This is not a negative claim about ICU capability or a claim that the action is absent.

## Finite fidelity-closure and killer plan

Within 72 hours, a Stage-A preclaim probe can pin the above ICU commit and one versioned ICU/CLDR data input, enumerate the package-tool options and source-level index/placement construction, and construct the smallest 20–50 bundle/key carrier required by the source contract. It must compare only stock-built files and stock APIs. It records package build CPU, peak RSS, temporary storage and final bytes; then cold/warm `udata`/`ures` lookup latency and RSS, full-scan cost, and all loader/read costs.

Fail closed before a claim if any of the following holds: (a) `F1` requires a custom reader/loader, split package, changed data modality, or altered key/value/fallback semantics; (b) its only action is ordinary ordering, configuration, alignment, endianness, compression, or generic packing; (c) the pinned source shows the current union already expresses the claimed whole constructor; (d) stock oracle equivalence fails; or (e) no bounded target-specific algorithm/guarantee can be stated. A successful closure would still require current direct-collision review and fair full-cost comparison before any Stage-0 recommendation.

## Decision

`NOT_ADMITTED_UNFROZEN` — no grounded brief and no `PROPOSE_STAGE0`.

This result follows from the unclosed legal action/witness and complete union, not from missing implementation, missing positive results, unavailable data, resources, or AI readiness. The raw opportunity is retained only as a repeat/rescreen record; it is not a terminal scientific STOP.

