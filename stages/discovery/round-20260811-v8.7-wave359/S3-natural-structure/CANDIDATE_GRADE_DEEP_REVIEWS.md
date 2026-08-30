# CANDIDATE_GRADE_DEEP_REVIEW — R lazy-load stock-action closure

## Current upstream reality check

Pinned at the frozen cutoff (2026-08-11): the official R source trunk paths `src/library/tools/R/makeLazyLoad.R` and `src/library/base/R/lazyload.R`, and R 4.6.1 official manuals.  The source mirror is not used as an absence claim; the official R Subversion paths are the primary pin.

- `code2LazyLoadDB` calls `makeLazyLoadDB` after loading a package namespace; `makeLazyLoading` exposes `compress`, `keep.source`, `keep.parse.data`, and `set.install.dir` in the normal package route.
- `makeLazyLoadDB(from, filebase, compress, ascii, variables, set.install.dir)` accepts an explicit full `variables` sequence.  Without one it obtains names via `ls(..., all.names=TRUE)`; it serializes each selected value into `.rdb`, records name-to-key/reference metadata in `.rdx`, and stores `compressed` in that map.
- The stock reader reads `.rdx`, takes `names(map$variables)`, uses the corresponding keys to invoke `lazyLoadDBfetch`, reconstructs references/environments, and installs lazy bindings.  Consequently both proposed sequence orders are legal only because the same current producer/reader already supports them.
- Default and non-default facets considered: `compress=TRUE/FALSE/2/3`; `ascii`; explicit `variables`; `set.install.dir`; installer `--data-compress`, `--with/--without-keep.source`, `--with/--without-keep.parse.data`, byte compilation and staged-install controls.  These are contrary evidence against any claim that a predecessor-aware writer action is currently absent.

## Six-dimensional residual test

| Dimension | Result |
|---|---|
| Decision rule | Candidate would select a predecessor-aware variable order; the stock writer already takes an explicit `variables` order. |
| Information condition | Previous release data can be supplied equally to a user of the stock writer and to generic VCDIFF/binary-delta baselines. |
| Complexity/resource | Ordering/segmentation has no identified R-specific constraint beyond serializing the same objects; proposed optimization reduces to generic stream ordering. |
| Quality/guarantee | Same namespace/lazy-load semantics can be retained, but no nontrivial R-specific exact/FPT/approximation guarantee is identified. |
| Full cost | Any future evaluation would charge rebuild CPU/temp/RSS, `.rdb+.rdx` bytes, patch bytes/apply CPU, namespace load, first lazy fetch CPU/RSS and installed storage.  No values were measured. |
| Generalization/no-gain | Stable recurrence is unmeasured and must be falsified on held-out releases; even if present, it only benefits a generic order/delta composition. |

## Direct subtractor and disposition

Strongest fair union: current `makeLazyLoading`/`code2LazyLoadDB` and `makeLazyLoadDB` complete writer actions (including explicit variable sequence, serialization and compression options), stock `lazyLoadDBexec` reader semantics, plus a same-information standard binary-delta/VCDIFF baseline.  The minimum legal witness lies inside this union.  A custom predecessor-aware ordering cannot supply N2/N3 unless it changes only generic packing/delta behavior, which is excluded; a new reader or changed binding/object semantics would fail same-object.

**Disposition: `STRUCTURAL_DROP_CURRENT_UNION_AND_GENERIC_DELTA_ONLY`.**  This is a scientific action-space conclusion, not a result/resource/readiness conclusion.  No `TOPIC_BRIEF` is produced.
