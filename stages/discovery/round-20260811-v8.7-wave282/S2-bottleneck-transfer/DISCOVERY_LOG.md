# Discovery log — Wave282 GLib GSettings compiled-schema index/layout N2 closure

## Freeze and same-object contract

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE282-GLIB-GSETTINGS-COMPILED-SCHEMA-INDEX-LAYOUT-N2-CLOSURE.
- Cutoff: 2026-08-11; authoritative revision v8.7+R5-P0; DISCOVERY_QUALITY_MODE=OFF.
- Control hashes: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan 6E48D4CF5164CAA41D6C230234F7E0EA54F5C13F04B33D2C49FEB2B1DDCA0BDB; registry 8729810F2C04436E742FD419697D23FF07D2D0F9661B90CFF5546E02283368FF; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.
- Starting pin: GLib main b865b41591b2d9457c4bac34511a3f59cf03df6c.

The fixed object is one gschemas.compiled binary made from a fixed schema set: identical IDs, child/extends relationships, keys, types, paths, defaults, enums/flags and applicable vendor overrides. Stock GSettings and GSettingsSchema(Source) lookup and introspection must return identical results. Changing XML semantics, values, reader, compiled format, schema search/install semantics, or adding a post-load wrapper is outside the object.

## Current-upstream reality check

Official GLib/GIO documentation confirms that glib-compile-schemas converts gschema XML plus override inputs into compact binary schemas; schema ID, key/type/default and path are reader-visible semantics. It also confirms the existing install/search surface: glib-2.0/schemas, XDG data directories and schema-source lookup. Thus an install-path selector, override policy, format change, reader cache or compiler flag cannot be a gap.

The required current source facets are gio/glib-compile-schemas.c, GVDB builder/reader and GSettings schema lookup, including table sort/hash/index, string/value encoding, endianness and validation. The pin is frozen, but direct GitLab source reading was unavailable in this static session. No detailed producer-plus-reader action union is inferred from documents. This is an evidence closure limitation, not an absence claim.

## Required two-file action-divergence certificate

A valid certificate needs same input set S and two stock-format files F0/F1. F0 is made by frozen stock producer/configuration. F1 differs only by a source-authorized whole index-plus-physical-layout action, not source order, hash-table tuning, generic packing, flags, install path or reader. A stock schema source must load both; every ID/key lookup, type, path, default, enum/flags and full scan must agree. A common target profile W must select an algorithmic state/action with exact, FPT, approximation or Pareto guarantee.

No such F1 is frozen. Profile-aware GVDB/schema layout is not an action unless its source-authorized mutation domain is specified; otherwise it is generic packing or a format/reader change. The required witness and union are therefore UNFROZEN.

## Natural route, full cost, and 72h killer

A finite natural carrier is a version-pinned GNOME application or desktop schema collection with its installed XML and override history. The stock oracle is GSettingsSchemaSource lookup plus deterministic schema/key/default enumeration. A Stage-A closure can use 20–50 schema/key cases, enumerate all producer defaults/non-defaults and GVDB reader/builder actions, then require F0/F1 stock equivalence. Charge planner/build CPU, RSS, temp and bytes; load and cold/warm lookup CPU, RSS and latency; full schema/key scan.

Fail closed if F1 changes reader/format or any observable schema result, is only generic packing/hash/order/flag/path selection, is current-union expressible, or lacks a bounded target-specific guarantee. Direct collision review must be re-run after a real legal action is frozen.

## Decision

COMPLETE_ZERO_PROPOSALS; NOT_ADMITTED_UNFROZEN. This is not based on missing implementation, positive result, natural data, resources or AI readiness, and is not a terminal STOP.
