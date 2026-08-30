# Neutral source snapshot — R16B S3 reseal

Captured after mainline's final mechanical reservation confirmation on
2026-08-13 and before this reseal's canonical disposition.  This snapshot is
append-only: it does not modify the original package.

| ID | Canonical signature | Exact object / stock semantics | Neutral natural carrier and falsifier plan |
|---|---|---|---|
| F04 | `GNU_INFO_DIR_INDEX__STOCK_INFO_TOPLEVEL_NAVIGATION__MANUAL_ENTRY_CHURN__WHOLE_DIRECTORY_CONSTRUCTION__BUILD_LOOKUP_STORAGE_CPU_RSS` | GNU Info `dir` menu under stock Info/Emacs navigation; same installed manual entries and reachable top nodes. | 20–50 pinned GNU release/install transitions; control manual additions/removals and metadata; reject a locality rule on held-out transitions. |
| F06 | `GNU_GLOBAL_GTAGS_SOURCE_INDEX__STOCK_GLOBAL_GTAG_LOOKUP__SOURCE_TREE_SYMBOL_CHURN__WHOLE_INDEX_CONSTRUCTION__BUILD_LOOKUP_STORAGE_CPU_RSS` | `GTAGS/GRTAGS/GPATH` under fixed GNU Global parser/config/query semantics. | 20–50 tagged public source releases; control language/file additions; reject held-out symbol/subtree locality. |
| F09 | `XKB_COMPILED_KEYMAP__STOCK_LIBXKBCOMMON_KEYCODE_STATE_TO_KEYSYM_ACTION_SEMANTICS__KEYMAP_COMPONENT_CHURN__WHOLE_KEYMAP_CONSTRUCTION__COMPILE_LOAD_LOOKUP_STORAGE_CPU_RSS` | Immutable libxkbcommon compiled keymap; same keycode+state to keysym/action semantics. | 20–50 xkeyboard-config/libxkbcommon releases; control layout/options/format version; held-out component-change tail falsifies the law. |
| F10 | `GRUB_PFF2_BOOT_FONT__STOCK_GRUB_LOADFONT_AND_UNICODE_GLYPH_RENDERING_SEMANTICS__VERSIONED_GLYPHSET_CHURN__WHOLE_PFF2_FONT_CONSTRUCTION__BUILD_BOOT_LOAD_RENDER_STORAGE_CPU_RSS` | GRUB PFF2 read by stock `loadfont`, preserving full-font identity and Unicode glyph bitmap/metric behavior. | Version-pinned GRUB font/glyph transitions; control face/size/release; held-out glyphset tail falsifies the law. |

Each stated regularity is a falsifiable Stage-A measurement plan, not an
observed result.  No artifact was downloaded and no experiment was run.

## Mechanical non-counting record

- `GOBJECT_TYPELIB...`: `EXCLUDED_HISTORICAL_REPEAT__WAVES291_321`.
- `KPATHSEA_LSR...`: `EXCLUDED_CROSS_LANE_DUPLICATE__S2_RETAINS`.
- `SELINUX_FILE_CONTEXTS...`: `EXCLUDED_HISTORICAL_REPEAT__CONTAINED_SPECIALIZATION__WAVES172_321`.
- `MERCURIAL_REVLOG...`: `EXCLUDED_HISTORICAL_REPEAT__WAVE188_CURRENT_UNION_DIRECTLY_COVERED`.
- `GSTREAMER_PLUGIN_REGISTRY...`: `EXCLUDED_BY_SOURCE_LANE__CACHE_OBJECT_NOT_COUNTED`.

Sources frozen from official first-party documentation: GNU Texinfo
`install-info`; GNU Global manual; libxkbcommon keymap API/format documentation;
and GNU GRUB 2.14 developer/manual PFF2 and `loadfont` sections.
