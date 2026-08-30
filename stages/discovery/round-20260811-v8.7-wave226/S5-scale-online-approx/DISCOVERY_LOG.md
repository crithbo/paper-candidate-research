# Wave226 Cap’n Proto packed segment-layout depth

Frozen controls matched plan `D41BC012DDC0ADAADEB3F86A045E3B85EA9A4C960C25DB3DEE90C8DFB75B689A`, registry `1EC198936AFEF8667BC6E008752F4F404744D922D2A2C6E71812BCE833A8349A`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`. No experiment, download, Stage0/A/B, automation, or shared write.

## Fixed object and current reality

Object: a fixed Cap’n Proto schema and decoded message tree under stock reader acceptance, including exact values, pointer targets, traversal/depth limits and stream framing. The official encoding spec states objects/pointers form a **tree**, not an aliasing graph; changing aliasing is therefore not a same-object option. Messages may have several segments; far/double-far pointers and landing pads encode inter-segment placement. C++ builders allocate sequentially within arena segments and allocate a new segment rather than relocating prior data. Packed encoding is a transport compression; canonical messages are one segment and not packed.

Current union includes builder segment allocation, ordinary/far/double-far pointers, stream segment tables, packed/unpacked I/O, canonicalization, copying/traversal limits and all resulting stock reader validation. No absence claim is made. The target `capnproto/capnproto` current source could not be immutable-SHA pinned from this environment without a source fetch; this keeps source-level closure `UNFROZEN` rather than supporting a current-absence residual.

## Minimal two-output witness

Input message tree: root has two child structs `A`,`B`; `A` fits in segment 0, `B` requires a new segment 1. Output N0 uses the stock sequential allocation with root→`B` far pointer/landing pad. Output N1 would choose a bounded layout plan before writing: allocate sufficient segment-0 capacity or place `A`,`B` to minimize a stated number of far pointers/zero-word packing runs, while preserving every decoded field/list/struct, pointer tree and stock reader acceptance. Both outputs may decode identically but differ in bytes/layout.

This witness is only **syntactically legal** under the specification. It does not establish a new incremental transition: updating an existing packed message may require reserializing affected segments, and no source proof here closes planner legality under builder allocation, far-pointer landing pads, canonicalization, packed stream state, or bounded recourse. An external compressor, changed reader, graph aliasing, or threshold policy is excluded.

## Proposed conditional N2 / closure plan

Potential contribution shape, if closed: a whole-message bounded-recourse layout constructor with bounded affected segments/words after update, exact decoded tree, and a parameterized bound on far-pointer/packing overhead relative to stock allocation. This is not currently a brief because legality and natural carrier remain unclosed.

Natural route: pin official Cap’n Proto schemas/examples plus a public versioned message-update stream. Oracle: stock `capnp decode`/reader traversal and canonicalization where applicable; compare decoded values/tree and reader acceptance. Full cost: packed/unpacked bytes, builder/update/read CPU, peak RSS/temp, segment count/capacity, far/landing-pad words, repacked bytes, traversal cost and rollback. A <=72h killer rejects any decoded-tree/limit difference, nonlegal pointer/segment state, affected-segment bound breach, current-union absorption, or no full-cost/guarantee improvement.

Sources: [Encoding spec](https://capnproto.org/encoding.html), [C++ serialization](https://capnproto.org/cxx.html?src=www.discoversdk.com), [capnp tool](https://capnproto.org/capnp-tool.html), [official repository](https://github.com/capnproto/capnproto).

Decision: `COMPLETE_ZERO_PROPOSALS__UNFROZEN_SOURCE_AND_INCREMENTAL_LEGALITY_CLOSURE`; no scientific STOP.
