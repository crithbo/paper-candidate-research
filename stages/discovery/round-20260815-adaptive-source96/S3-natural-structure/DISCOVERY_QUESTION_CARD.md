# Question Card — S3-96-01

**Status:** `LOCATOR_ONLY__SAME_OBJECT_TABLE_REORDER_SUBROUTE_INVALID__REMAINING_LEGAL_ACTION_UNFROZEN`

## Frozen fields

| Field | Recorded fact / boundary |
|---|---|
| Exact public identity | ICU4C resource-bundle `.txt` source compiled by `genrb` into `.res`; current docs/API surface checked 2026-08-15. |
| Carrier | prospective natural version chain of official ICU locale-resource releases; an exact release-pair panel was not frozen or acquired in this Discovery cycle. |
| Same-object problem | Construct each `.res` while preserving the stock reader’s keys, values, locale fallback, index access, and iteration behavior. |
| Tentative endpoint | Complete release artifact bytes plus same-information transition/delta bytes, with build CPU/RSS and read/lookup cost retained in the denominator. |
| Current source locus | ICU Resources and Localizing documentation; ICU 78.1 `ResourceBundle` API docs; official ICU release surface. |
| Minimum falsifier | A stock reader returns a different resource/key at any index, fallback differs, or an iteration sequence differs for a frozen bundle. |
| Finite closure ceiling | Before any raw: pin 20–50 official releases or a deterministic release-pair rule; enumerate current `genrb` writer actions and flags from source; use `ures_getByKey`, `ures_getByIndex`, and iterator APIs as oracle; compare current per-release writer plus equal-information delta. |

## Ordinary closure finding

Official ICU documentation says tables can be accessed by key, index, and iteration. It also documents that table items use key ordering for binary structure and that table iteration order may vary by release. Thus the contemplated atomic action “reorder table items according to predecessor affinity” is not stock-semantics preserving: it can alter index and iteration observations. This is a direct failure of that one action subroute, not a claim that no legal `.res` serialization action exists.

The documents establish that `genrb` compiles text bundles to binary `.res` files, but this bounded review did not freeze a current source-level catalogue of legal, order-preserving placement/offset actions, relevant defaults/non-default flags, or a version-pinned natural release panel. Without those fields, the non-generic discriminator and atomic action are not defined. The card therefore cannot enter `EVIDENCE_QUALIFIED_RAW`.

## Current-upstream reality record

- Supporting baseline evidence: ICU’s official Resources guide names `genrb`, key/index/iterator APIs, and table ordering constraints; official localizing documentation describes `.txt` to `.res` compilation and nested table/array semantics.
- Contrary evidence: those same APIs make index/iteration observable; order freedom cannot be presumed from a binary-format representation.
- Flags/configs: `genrb --help` is the official option enumeration locus. No source-level or full CLI flag audit was performed because the primary action already failed and the residual action class is not frozen. No absence claim is made.

## Raw-gate disposition

`LOCATOR_ONLY`. This is neither a scientific STOP nor a resource-negative inference. No source-closure queue is opened because the remaining source route is not a single frozen action/estimand bundle; opening one would violate concrete-queue accountability.

## Primary sources

1. ICU, “Resources,” <https://unicode-org.github.io/icu/userguide/locale/resources.html> (official docs; accessed 2026-08-15).
2. ICU, “Localizing with ICU,” <https://unicode-org.github.io/icu/userguide/locale/localizing.html> (official docs; accessed 2026-08-15).
3. ICU 78.1 API, `icu::ResourceBundle`, <https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/classicu_1_1ResourceBundle.html> (official API docs; accessed 2026-08-15).
4. ICU official releases, <https://github.com/unicode-org/icu/releases> (official upstream release surface; accessed 2026-08-15).
