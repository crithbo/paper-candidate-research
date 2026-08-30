# Evidence-qualified question-card audit — Source86 S6

## QC-S86-01 — GNU gettext `msgmerge` fuzzy catalog update

**Exact object.** Fixed old PO catalog, fixed updated POT template, locale/context/plural metadata and `msgmerge` options under GNU gettext 0.26. The desired endpoint is a catalog with the same *translator-validated* translation semantics for changed messages, not merely a syntactically valid PO file. Natural carrier route: a versioned public GNU project PO/POT transition; stock oracle: `msgfmt` syntax/format checks plus human validation of fuzzy entries. Network-security scope: PASS.

**Candidate N2 action.** Jointly choose old-to-new fuzzy pairings and review ordering to maximize preserved translation value while controlling update CPU/RSS, catalog bytes, translator review effort and runtime lookup cost.

**Current union and contrary source.** The official manual documents exact merge, fuzzy matching when no exact match exists, `--no-fuzzy-matching`, `--previous`, and `--for-msgfmt` (which omits fuzzy entries and implies no fuzzy matching). Its workflow rules state that fuzzy says a translation might no longer be correct and only a translator can judge correctness. The Fuzzy Entries section calls the pairing a hypothesis from a slightly modified old `msgid`, requiring translator intervention.

**Action-survival witness.** For two similar prior `msgid`s and one changed new `msgid`, two fuzzy pairings can both yield a syntactically valid PO file marked fuzzy, but they offer different candidate translations. Neither is guaranteed to preserve the stated semantic endpoint without a human/oracle that supplies the intended mapping. Supplying that mapping changes the input object; without it, the optimization is generic string-similarity/bipartite correspondence plus workflow prioritization. Setting `--no-fuzzy-matching` removes the proposed action rather than creating a target-specific residual.

**Minimum falsifier and full-cost.** A small two-old/one-new PO/POT witness with a stock fuzzy flag shows semantic validity is unresolved until human review. A finite StageA plan would pin a public PO history, obtain independent translator labels, compare candidate pairings, and reject the topic if the only advantage is generic correspondence. Cost would include msgmerge CPU/RSS, PO/catalog bytes, `msgfmt`/lookup checks, human-review time and translation-correction effort. No test or build was run in Discovery.

**Raw decision.** The proposed guarantee necessarily relies on an external intended-translation mapping or human judgement. The fixed native inputs do not determine it, and the residual after adding labels is generic correspondence/workflow policy. Thus the source-supported non-generic discriminator required for raw is absent.

**Disposition.** `EXCLUDED_BEFORE_RAW__SAME_OBJECT_TRANSLATION_SEMANTIC_ENDPOINT_REQUIRES_HUMAN_ORACLE_PLUS_GENERIC_FUZZY_CORRESPONDENCE_KERNEL`. It is structural, not a conclusion from implementation, result, resource or AI readiness.
