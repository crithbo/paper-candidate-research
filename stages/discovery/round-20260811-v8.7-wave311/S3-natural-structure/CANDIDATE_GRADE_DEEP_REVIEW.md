# Candidate-grade deep review — TZif/zic adjacent-release recourse

## Frozen object and source-first change schema

The exact object is each zone file generated from adjacent official IANA tzdb releases by matching current stock `zic`, with the same transition-time → `(UT offset, DST flag, abbreviation)` answers, leap-second behavior, TZif version, and POSIX footer/tail semantics. The release carrier is official IANA `tzdataV`/`tzcodeV` history: releases are named, tagged, include a `version` file since 2016h, and publish both compiler source and data. Natural train/holdout would use ordered triples `(V-1,V,V+1)` rather than arbitrary byte pairs.

The preregistered layout-independent phenomenon schema is: for each source edit, partition zones into (a) zones whose resolved transition/leap/tail answer function changes and (b) zones that have no changed dependency. Measure the latter’s byte identity and the former’s semantic change class after controlling source rule/link edits, zone alias/rename, `zic` version, `-b` output version, `-r` range truncation, `-L` leap input and data cutoff. It is a *test plan*, not a claimed stable measured law.

## Current writer/reader union

Current zic source/manual, the released code/data bundle, and RFC 9636 define the union to pin: all input zone/rule/link/leap files; `zic` defaults and `-b`, `-r`, `-L`, output directory and any data-range/options; TZif version; first and second headers/data blocks; transition arrays/type indices/designations; leap records; and the POSIX footer. The reader must retain the same answers also after the final explicit transition (footer), and for leap behavior. RFC 9636 documents compatibility caveats: readers can ignore the footer, use type-zero heuristics, or reject certain truncated version-4 leap tables. Therefore a reduced representation or changed reader is forbidden.

The strongest fair baseline is complete per-release stock zic rebuild with the same options, crossed with a same-information VCDIFF/binary patch from predecessor zone-tree bytes. A generic dependency build cache/unchanged-file copier is also a baseline action, not a contribution.

## Minimal stock-legal witness and residual test

For a source change that does not reach zone `Z` in the Rule/Zone/Link dependency relation, `zic(V)` emits the same TZif byte sequence for `Z` as `zic(V-1)` under matching options; reuse of the old file is stock-reader legal. For an affected zone, a full zic rebuild emits a new valid file. This is the smallest two-version/two-output witness.

However, the witness proves only conventional incremental build recourse: unchanged output reuse plus rebuild of affected targets. It introduces no alternate legal transition-block ordering, no changed optimization decision, no new query/index action, and no quality/guarantee beyond dependency correctness. VCDIFF already charges distribution cost for both unchanged and changed files. Any attempt to emit a special patch-oriented TZif layout changes reader/interoperability assumptions or becomes generic packing/delta.

## N1/N2/N3, collision and decision

No N1 action exists in the fixed object. The possible N2 is merely dependency-directed incremental compilation/cache invalidation; no target-specific nontrivial algorithmic guarantee beyond the standard affected-set closure was identified. N3 would require evidence that a held-out repeated transition-block locality law yields a legal construction advantage over rebuild+delta; no such law has been measured, and output order freedom is not established. Generic incremental-compilation literature is a subtractor, not a same-object residual.

Full cost was nevertheless frozen: source dependency analysis and zic CPU/RSS/temp; final zone-tree bytes; patch and apply bytes/time; installation; stock reader load/query CPU/RSS/latency; and all error/verification behavior. The 72h killer is finite: three official releases, two changed and two unaffected zones, source-dependency audit, all zic options, RFC semantic probes including footer/leap/range, and comparison against rebuild+VCDIFF. It either confirms only cache/rebuild or exposes a new legal construction.

**Disposition:** `STRUCTURAL_DROP__ONLY_DEPENDENCY_DIRECTED_REBUILD_REUSE_OR_GENERIC_DELTA__NO_TARGET_SPECIFIC_N1_N2_N3_RESIDUAL`. This is not based on unavailable implementation, positive results, resource or AI readiness.
