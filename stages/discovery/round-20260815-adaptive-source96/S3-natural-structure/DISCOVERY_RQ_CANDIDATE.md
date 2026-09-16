# RQ candidate — S3-96-01

## Exact anchor and identity preflight

- Exact public anchor: ICU4C current resource-bundle documentation and ICU 78.1 API documentation, checked 2026-08-15; official release surface: <https://github.com/unicode-org/icu/releases>.
- Tentative object: an ICU4C `.res` bundle compiled from a fixed `.txt` resource bundle, with stock `UResourceBundle` lookup semantics.
- Immutable semantic boundary: same keys, values, nested structures, locale fallback behavior, index retrieval, and stock iteration behavior; no custom reader or changed package format.
- Historical five-field check: registry/history records an ICU `.dat` **common-data package lookup/layout** closure (S2 Wave273). The object/container, action, and endpoint differ from this `.res` table-order/offset hypothesis, so relation is `RELATED_ONLY`, not an exact or terminal containment. It supplies no novelty conclusion.

## Primary RQ

For versioned ICU locale-resource releases, can a predecessor-aware `.res` bundle constructor preserve every stock key/index/iteration observable while reducing complete per-release bytes plus transition bytes versus current `genrb` plus an equal-information generic binary-delta baseline?

## Scope and consequence

- Contribution route if viable: `N2` (target-specific offline joint constructor); possible `N3` only after a stable release-law is actually measured.
- Decision consequence: choose a legal bundle construction only if it changes complete release artifact and transition costs while retaining native reader outputs.
- Precommitted source roles: ANCHOR = official ICU Resources/Localizing documentation; CURRENT = current ICU API documentation and official release/source surface; CONTRARY = stock key/index/iteration semantics and historical ICU `.dat` related closure; ESCAPE = version-aware binary delta literature only if the RQ reaches raw.
- FINER-lite: answerable in a bounded source route, important only if a stock-legal writer action survives, and not a novelty or Q2 conclusion.
