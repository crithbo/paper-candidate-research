# Primary RQ — S3-97-01

## Anchor and identity boundary

- Exact public anchor: GNU C Library 2.43 manual, checked 2026-08-15, including the official `locale-archive` / `localedef` installation route and `setlocale` semantics.
- Tentative exact object: a fixed set of glibc locale category data installed in `locale-archive`, read through the stock glibc locale loader.
- Same-object boundary: locale names, category values, `setlocale` selection/failure behavior, and stock loader operation remain fixed; no per-locale file mode, alternative reader, or changed locale semantics.
- Five-field history preflight: held `glibc TLSdesc` identities share a project only. Object (`locale-archive` vs TLS descriptor), action, endpoint, semantic guarantee, and full-cost boundary do not match, so the relation is `RELATED_ONLY`; no novelty implication follows.

## Primary RQ

For a version-pinned series of official glibc locale-data releases, is there a target-specific predecessor-aware `locale-archive` constructor that preserves all stock locale selection/category results while improving complete archive bytes plus release-transition bytes versus current `localedef` archive construction and an equal-information binary-delta baseline?

## Decision consequence and source roles

- Tentative route: `N2` only if a non-generic archive-construction action and guarantee survive; `N3` only after an actual repeated natural change law is measured.
- Decision consequence: alter the offline archive construction for a fixed locale set, without changing locale selection or category outputs.
- ANCHOR/CURRENT: official glibc manual 2.43; CONTRARY: the documented archive-versus-individual-file construction modes and loader semantics; ESCAPE: version-aware archive-layout work only after raw admission.
- Full-cost boundary if ever admitted: localedef/archive generation CPU, temporary space/RSS, final archive bytes, delta bytes/apply cost, and stock locale load/lookup latency/RSS.
