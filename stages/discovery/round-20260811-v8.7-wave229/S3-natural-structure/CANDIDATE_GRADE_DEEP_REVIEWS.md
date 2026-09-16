# Candidate-grade deep review — UOF-229-01

## Current-upstream reality check

| facet | frozen first-party evidence | consequence |
|---|---|---|
| generator | [Linux master `scripts/kallsyms.c`](https://raw.githubusercontent.com/torvalds/linux/master/scripts/kallsyms.c) (retrieved 2026-08-11) | actual source parses, filters, sorts, globally learns 2-byte-token profits, selects best tokens, compresses all valid symbols, and emits names/markers/token table/index/offsets/name sequence.  A “new token frequency heuristic” is absorbed. |
| reader | [Linux master `kernel/kallsyms.c`](https://raw.githubusercontent.com/torvalds/linux/master/kernel/kallsyms.c) and [internal declarations](https://raw.githubusercontent.com/torvalds/linux/master/kernel/kallsyms_internal.h) | stock expansion consumes the compressed stream through the token table/index; same-object requires identical expanded name/type/address lookup behavior, not encoded bytes alone. |
| build flow | [Linux master `scripts/link-vmlinux.sh`](https://raw.githubusercontent.com/torvalds/linux/master/scripts/link-vmlinux.sh) | full cost includes `NM` map generation, multiple kallsyms/link passes, final `System.map` creation and consistency check.  Master uses `--all-symbols` and `--pc-relative` conditions. |
| historical configuration contrast | [official v6.12 tag `scripts/kallsyms.c`](https://raw.githubusercontent.com/torvalds/linux/v6.12/scripts/kallsyms.c) | v6.12 contained `--absolute-percpu` and relative-base logic.  This is contrary evidence against assuming current master has that same flag/interface. |
| collision record | current source and its historical source comment describe table-lookup compression; a 2005 kernel mailing-list patch is an antecedent, not an absence proof | no source was found here that establishes a current union-external same-object cross-release constructor.  That is an unclosed collision review, not a novelty claim. |

No absence claim is made.  The recorded opposite evidence is that current source already performs a global, full-symbol token-profit construction rather than a local frequency pass; current build flow includes iterative relinking and a map consistency check.

## Same-object action certificate and six dimensions

| dimension | required frozen comparator | status |
|---|---|---|
| decision rule | stock current generator's global token-profit/selection and full output versus proposed cross-release constructor | no union-external rule named |
| information | same selected symbol mapping, tag/config/toolchain/build inputs | carrier configuration not frozen |
| complexity/resources | all link passes, generator CPU/RSS, emitted section bytes, final `vmlinux` bytes, boot and lookup CPU/RSS | denominator defined only |
| quality/guarantee | same expanded `(address,type,name)` relation; stock decoder and lookup oracle | no minimal witness |
| full cost | map extraction + repeated linking + kallsyms generation + assembly/link + final `System.map` validation + runtime lookup | mandatory; no observation claimed |
| generalization/no-gain | chronological held-out tags after all stated confound controls | natural law not observed |

## Finite fidelity closure and killer

Future Stage A may acquire a small 20–50 tag set, fixing one official architecture/config/toolchain and retaining tags/tree/config/artifact hashes.  It must compile/derive maps only under an independently approved Stage A assignment.  The 72-hour killer is any one of: no held-out controlled law; stock current generator reproduces the complete action; emitted structure fails the stock decoder or map equivalence; full build/update/bytes/boot/lookup CPU-RSS shows no residual; or pinning tags/configurations reveals that comparability requires changing the symbol set/object.

`structural_paper_potential`: conditionally `TIER_B_Q2_VIABLE` only if a stable law and nontrivial complete constructor survive.  `current_evidence_readiness`: low; this review has no downloaded natural artifact or measurement.  Decision: `NOT_ADMITTED_UNFROZEN`, no Stage0 brief.
