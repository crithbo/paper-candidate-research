# Confirmed replacement source snapshot

Mainline reservation confirmation is recorded in `../RESERVATION_PENDING.md`.
This snapshot was frozen on 2026-08-13 before the canonical pass.

| ID | exact signature and source-bound contract |
|---|---|
| F01 | `QT_QM_TRANSLATION_CATALOG__FIXED_TS_MESSAGE_SET_AND_PLURAL_RULES__STOCK_QTRANSLATOR_LOOKUP_SEMANTICS__LRELEASE_WHOLE_CATALOG_CONSTRUCTION__BUILD_LOAD_BYTES_CPU_RSS`. Qt 6.11 official `lrelease` documentation: TS→compact QM, finished-translation policy, and `-compress`, `-nounfinished`, `-fail-on-invalid`, `-fail-on-unfinished`, `-removeidentical` controls. Carrier: finite TS catalog. |
| F02 | `GNU_ASPELL_RWS_DICTIONARY__FIXED_WORDLIST_AFFIX_AND_LANGUAGE_RULES__STOCK_ASPELL_SPELL_CHECK_SEMANTICS__WORDLIST2WORDLIST_WHOLE_DICTIONARY_CONSTRUCTION__BUILD_LOOKUP_BYTES_CPU_RSS`. GNU official dictionary index confirms published language-dictionary inputs, but this bounded read did not close a current `word-list` source/config union or exact RWS writer semantics. Carrier: a finite official language dictionary release. |
| F03 | `LIBLOUIS_BRAILLE_TABLE_BINARY__FIXED_TRANSLATION_TABLE_RULESET_AND_UNICODE_INPUT__STOCK_LOUIS_TRANSLATE_STRING_SEMANTICS__LOUIS_COMPILE_TABLE_WHOLE_TABLE_CONSTRUCTION__BUILD_TRANSLATE_BYTES_CPU_RSS`. Official Liblouis upstream v3.37.0 describes rule/dictionary-based tables and current translation/checking tools, but no separate current binary table compiler is established by this read. Carrier: finite upstream `.ctb/.uti` table and Unicode strings. |
| F04 | `TEX_HYPHENATION_PATTERN_FORMAT__FIXED_LANGUAGE_PATTERN_EXCEPTION_SET_AND_WORD_INPUT__STOCK_TEX_HYPHENATION_SEMANTICS__PATGEN_OR_FMTUTIL_WHOLE_PATTERN_CONSTRUCTION__BUILD_HYPHENATE_BYTES_CPU_RSS`. Official Web2C/TUG documentation specifies patgen dictionary→pattern generation, exact argument form, and its use in TeX; the frozen union includes patgen's only `-help/-version` options. Carrier: finite hyph-utf8 pattern/exception set and words. |

No result, performance assertion, implementation absence, or canonical disposition is contained here. The prior original R16B four remain excluded repeats and are not altered.
