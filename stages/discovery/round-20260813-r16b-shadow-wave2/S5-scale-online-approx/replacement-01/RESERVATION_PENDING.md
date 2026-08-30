# R16B S5 replacement-01 — mainline reservation request

This append-only file is a reservation request only.  It does not modify the
original package, freeze a neutral snapshot, make a canonical disposition,
write V9 shadow material, or count any family as accepted.  The original four
families are retained unchanged and are `EXCLUDED_REPEATED` by mainline.

Pre-reservation literal checks against `plan.md`, `registry.yaml`, `history.md`,
the R16A accepted/excluded ledger, and visible R16B lane artifacts found no
exact match to the following signatures.  Mainline must nevertheless perform
global/history/cross-lane reservation before any further action.

1. `ICU_RESOURCE_BUNDLE_DAT__FIXED_LOCALE_RESOURCE_TREE__STOCK_ICU_URES_OPEN_AND_FALLBACK_SEMANTICS__GENRB_PACKAGE_WHOLE_CONSTRUCTION__BUILD_LOAD_BYTES_CPU_RSS` — `REJECTED_HISTORICAL_REPEAT_OR_CONTAINED__WAVES273_243`.
2. `QT_QM_TRANSLATION_CATALOG__FIXED_TS_MESSAGE_SET_AND_PLURAL_RULES__STOCK_QTRANSLATOR_LOOKUP_SEMANTICS__LRELEASE_WHOLE_CATALOG_CONSTRUCTION__BUILD_LOAD_BYTES_CPU_RSS` — `PROVISIONALLY_CONFIRMED_UNIQUE`.
3. `GNU_ASPELL_RWS_DICTIONARY__FIXED_WORDLIST_AFFIX_AND_LANGUAGE_RULES__STOCK_ASPELL_SPELL_CHECK_SEMANTICS__WORDLIST2WORDLIST_WHOLE_DICTIONARY_CONSTRUCTION__BUILD_LOOKUP_BYTES_CPU_RSS` — `PROVISIONALLY_CONFIRMED_UNIQUE`.
4. `GLIB_GRESOURCE_BINARY_BUNDLE__FIXED_RESOURCE_MANIFEST_AND_FILE_BYTES__STOCK_GRESOURCE_LOOKUP_SEMANTICS__GLIB_COMPILE_RESOURCES_WHOLE_BUNDLE_CONSTRUCTION__BUILD_LOOKUP_BYTES_CPU_RSS` — `REJECTED_HISTORICAL_EXACT_REPEAT__WAVES279_321`.

Boundaries: R01 is ICU locale-resource packaging, not GSettings/GVDB; R02 is
Qt translation catalog compilation, not Qt RCC; R03 is Aspell dictionary
construction, not Tesseract DAWG; R04 is GResource manifest bundle creation,
not Gtk/GdkPixbuf/GIO cache construction.  No claim of a residual, source
absence, performance result, or proposal is made at this stage.

## Replacement reservation round 2 — pending mainline response

The two rejected signatures are not counted and are replaced only to restore
the four-family sample target.  `rg` exact-string screening across the same
project/R16A/active-R16B scopes found no hit for either proposed replacement.
They are submitted for global reservation, not source/canonical evaluation:

5. `LIBLOUIS_BRAILLE_TABLE_BINARY__FIXED_TRANSLATION_TABLE_RULESET_AND_UNICODE_INPUT__STOCK_LOUIS_TRANSLATE_STRING_SEMANTICS__LOUIS_COMPILE_TABLE_WHOLE_TABLE_CONSTRUCTION__BUILD_TRANSLATE_BYTES_CPU_RSS`
6. `TEX_HYPHENATION_PATTERN_FORMAT__FIXED_LANGUAGE_PATTERN_EXCEPTION_SET_AND_WORD_INPUT__STOCK_TEX_HYPHENATION_SEMANTICS__PATGEN_OR_FMTUTIL_WHOLE_PATTERN_CONSTRUCTION__BUILD_HYPHENATE_BYTES_CPU_RSS`

R05 boundary: compiled Liblouis braille-table rules and stock text-to-braille
translation, not an Aspell word dictionary or generic trie.  R06 boundary:
TeX's hyphenation-pattern/exceptions object and stock TeX line-breaking
hyphenation semantics, not Kpathsea `ls-R`, TeX format macro regimes, or a
generic word-list index.  Neither action has been source-verified or admitted.
