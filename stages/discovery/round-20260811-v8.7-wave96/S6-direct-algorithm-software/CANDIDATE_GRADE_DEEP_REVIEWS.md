# Candidate-grade deep reviews

## D01 — Tree-sitter grammar-to-parser transform

- **Union / guarantee:** `tree-sitter generate` maps a fixed structured grammar to parser artifacts; upstream documents conflict detection, state splitting and compatible-state merging, including `--disable-optimization`.
- **Global cost:** grammar loading, conflict resolution, state/table construction, generated-C size, generation time, parser memory and identical corpus parse trees/errors must all be charged.
- **Minimal witness:** disabling state merging or varying compatible-state handling is an exposed construction action inside the current union. No union-external whole table constructor was named.
- **Natural 72-hour killer:** one official grammar plus a public repository corpus; compare generated parser behavior and total generation/parse/memory cost. Kill if the action is state-merge tuning or alters grammar/error behavior.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D02 — Open Babel canonical-SMILES transform

- **Union / guarantee:** fixed molecule connectivity/stereochemistry to Open Babel's canonical-SMILES output under a frozen version and options. The upstream format documentation exposes the canonical `can` format and options.
- **Global cost:** input parse/normalization, canonical labeling, ring/branch serialization, output bytes, allocation, and a read-back structural equivalence check.
- **Minimal witness:** no complete union-external canonicalization action was isolated; changing representation options risks changing canonical-output semantics or is an existing writer option.
- **Natural 72-hour killer:** public SDF molecules, canonical output plus native read-back graph equivalence and full parse+write ledger. Kill on output-contract change or option-only mechanism.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## D03 — HarfBuzz shaping transform

- **Union / guarantee:** a fixed Unicode buffer, font, direction/script/language and feature set maps to the same glyph buffer (glyphs, clusters, positions). Shaper selection and OpenType lookup application are native construction actions.
- **Global cost:** Unicode buffer setup, font data, lookup/substitution/positioning work, glyph-buffer memory and all output fields—not shaping time alone.
- **Minimal witness:** alternate lookup order/feature choices are part of the native feature/shaper union or change frozen output semantics. No independent complete global constructor was found.
- **Natural 72-hour killer:** a public font and multilingual text; native glyph-buffer equality plus build/shaping/memory ledger. Kill if a proposal changes feature set or is only lookup scheduling.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## D04 — ICU collation sort-key transform

- **Union / guarantee:** `ucol_getSortKey` for a fixed collator generates byte keys whose unsigned-byte comparison agrees with that collator's direct comparison. Locale and attributes are part of the frozen semantic contract.
- **Global cost:** collator initialization, normalization/weight generation, temporary/overflow buffer behavior, key bytes, allocation, and ordering-equivalence verification.
- **Minimal witness:** partial-key APIs, buffer sizing, key merging and collation attributes are already native actions or change the collator contract. No union-external global key constructor was isolated.
- **Natural 72-hour killer:** public multilingual name corpus; verify all pairwise sort-key/direct-compare order agreements and total key-generation/storage cost. Kill if locale/strength changes or full key/storage cost loses.
- **Disposition:** `STRUCTURAL_ABSORPTION`.

## Result

No grounded brief. The two `STRUCTURAL_ABSORPTION` decisions and ICU decision arise from current action/semantic unions; the Open Babel row remains nonterminal `NOT_ADMITTED_UNFROZEN`. No missing implementation, result, resource, or AI readiness was used as a negative scientific fact.
