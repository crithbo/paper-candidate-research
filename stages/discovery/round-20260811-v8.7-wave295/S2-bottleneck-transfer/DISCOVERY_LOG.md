# Discovery log — Wave295 fresh cross-component constructor breadth II

## Freeze

- Assignment: DISCOVERY-S2-20260811-V8.7-WAVE295-FRESH-BOTTLENECK-TRANSFER-CROSS-COMPONENT-CONSTRUCTOR-BREADTH-II.
- Cutoff 2026-08-11; production v8.7+R5-P0; DISCOVERY_QUALITY_MODE=OFF.
- Frozen controls: AGENTS 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063; plan 9E3CCCAF44139C78A31EBA8150586A1939D0F0D2250C33D1EFD72352323BE6DE; registry 06812EDF4BBA013B26EE03C55AF1187164771C35376D7F5C08CF80CB530245F0; ROLE FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3.

## Witness-first breadth

| Family | Fixed native object and stock semantics | Initial cross-component witness | Result |
|---|---|---|---|
| GIO module cache | Fixed shared-object module set and extension-point declarations; stock GIO extension discovery/load result | Cache must retain all module/extension information while changing a legal producer-plus-loader construction beyond module selection. | Deep; NOT_ADMITTED_UNFROZEN. |
| GdkPixbuf loader cache | Fixed loader modules/signatures and image decoding result | Same stock loaders.cache must retain dispatch/decoded pixels but alter a non-generic cache construction. | Deep; NOT_ADMITTED_UNFROZEN. |
| GTK icon cache | Fixed icon theme tree/index.theme and stock icon lookup result | Same mmap-able cache must retain icon name/variant results while changing a legal cross-component constructor. | Deep; NOT_ADMITTED_UNFROZEN. |
| Shared MIME cache | Fixed MIME XML declarations and stock content-type results | Source-authorized non-generic compiler/index action required. | Raw; source union not closed. |
| kmod dependency metadata | Fixed module set/aliases/dependencies and stock resolution result | Same metadata requires a non-selection whole constructor. | Raw; native action/witness not frozen. |
| Desktop MIME application cache | Fixed desktop entries/MIME associations and stock association result | Same registry object requires target-specific action beyond index/cache generation. | Raw; generic metadata/cache only. |

## Deep audits

### GIO module cache

Official GIO documentation says module query results are cached so modules need not be loaded merely to discover extension points; gio-querymodules is run after installation. But extension-point consumers can use all implementations, select highest priority, or choose by name. That selection is application policy, hence a controller/selector rather than a same-object package constructor. Changing module paths or extra module directories is also existing configuration. No source-authorized cache-layout action with an independent target-specific guarantee was frozen. The candidate is NOT_ADMITTED_UNFROZEN, not rejected due to missing results.

### GdkPixbuf loaders.cache

Official documentation fixes the two-step producer/loader union: modules reside in the loader directory, gdk-pixbuf-query-loaders writes loaders.cache, and runtime reads it to obtain loader signatures. The stock image result involves the selected decoder and exact pixels. A layout proposal must not change module order/signatures, select a different decoder, substitute an external cache, or alter image semantics. No legal two-cache witness with a non-generic constructor was frozen; generic text/index packing is insufficient. Status NOT_ADMITTED_UNFROZEN.

### GTK icon cache

GTK documents that gtk4-update-icon-cache produces mmap-able icon-theme.cache, reducing startup system calls/disk seeks; options include force, theme-index handling, image-data inclusion and validation. These establish the current producer/configuration union. The natural object is the fixed icon theme and stock icon lookup, but the only named choices are cache generation/configuration or image-data storage. No same-object, union-external joint cache/index/layout action and guarantee was named. Status NOT_ADMITTED_UNFROZEN.

## Common finite fidelity route and killer

Each later Stage-A closure can pin a corresponding first-party source revision and a versioned natural system asset set: installed GLib modules, GdkPixbuf loaders plus image corpus, or an official GTK icon theme. Use 20–50 extension/image/icon queries and stock loader or lookup oracle. Charge producer CPU/RSS/temp/bytes; module/cache load CPU/RSS; cold/warm discovery/lookup/decode latency and full scan. Fail closed within 72 hours if the only difference is cache/index packing, configuration, priority selection, module/image/theme semantics, a changed loader, or no bounded target-specific guarantee.

## Decision

COMPLETE_ZERO_PROPOSALS. Six unique fresh families were screened and three candidate-grade audits are NOT_ADMITTED_UNFROZEN. No direct collision, direct absence, or terminal STOP is asserted. None was rejected for implementation, result, resource or AI-readiness reasons.
