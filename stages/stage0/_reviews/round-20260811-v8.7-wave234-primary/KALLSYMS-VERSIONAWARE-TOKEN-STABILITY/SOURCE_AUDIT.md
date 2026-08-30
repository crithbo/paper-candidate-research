# KALLSYMS-VERSIONAWARE-TOKEN-STABILITY Source and Collision Audit

## Audit scope

- Role: independent Stage 0 PRIMARY
- Cutoff: `2026-08-11`
- Evidence policy: official upstream source/docs, standards, and original papers. Search results and transport failures are not absence evidence.
- Collision status: `SEARCH_BOUNDED_OPEN`
- Main claim ceiling: static current-source and design-boundary findings only; no effectiveness or novelty-finality claim.

## Frozen input integrity

| Input | SHA-256 | Result |
|---|---|---|
| Discovery brief | `3BF8B7737428D4C9274A413E604ABCAB5B84EE137820B94C825BC9451D2B5128` | matches assignment |
| Discovery handoff | `61753999C64164EF187304717C0DDE5021A310F7865C99B9C231B5E6CB2D6363` | matches assignment |
| Discovery manifest self | `05B47AEC024ABBEFA8965F61BE3E0036547E5C6DC3E5DB31D796A2E6AA46CB6D` | matches assignment |
| Discovery manifest entries | 7/7 | independently verified before review |
| Source collision matrix | `F6F309A48CDF8890669E2BC184BB0822BCBFC98CE00509EC68FF899BC8223653` | recorded |
| Candidate-grade review | `95446931B99689F822F2FECA7AE71D94C1C42EB94F56C6DA051CE6CA4B111231` | recorded |

## Current upstream reality check

### Native generator

Primary source: Linux [`scripts/kallsyms.c`](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/scripts/kallsyms.c), with current master independently inspected on 2026-08-11.

Verified source facts:

- `find_best_token()` scans the two-byte token-profit table and selects the maximum profit.
- `optimize_result()` fills unused byte-code slots from 255 downward, replaces the chosen pair across all symbols, and updates the compressed representation.
- `optimize_token_table()` builds current-input counts, inserts literal byte symbols, and runs that greedy optimization.
- output contains the compressed names, markers, token table/index, offsets and `kallsyms_seqs_of_names` consumed by the reader.
- current generator command-line actions are `--all-symbols` and `--pc-relative`; neither is predecessor-aware construction.

Conclusion: the current native constructor is a strong same-object current-only baseline. A frequency-only or scalar token-profit retuning is absorbed.

### Native reader and lookup

Primary source: Linux [`kernel/kallsyms.c`](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/kernel/kallsyms.c).

Verified source facts:

- `kallsyms_expand_symbol()` decodes length-prefixed names through `kallsyms_token_index` and `kallsyms_token_table`.
- `kallsyms_lookup_name()` searches `kallsyms_seqs_of_names`, expands candidate names and returns the corresponding address.
- marker and sequence arrays are part of native lookup cost and legality, not optional evaluation metadata.

Conclusion: changing the decoder, token grammar, symbol relation, or lookup path changes the object.

### Native link fixed point and configuration

Primary sources:

- Linux [`scripts/link-vmlinux.sh`](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/scripts/link-vmlinux.sh)
- current Linux [`init/Kconfig`](https://raw.githubusercontent.com/torvalds/linux/master/init/Kconfig)

Verified source facts:

- the link flow generates a dummy kallsyms object, relinks to obtain correct size, regenerates after addresses shift, may add another pass if size changes, and finally compares final `System.map` against the kallsyms map;
- a kallsyms representation therefore feeds back into addresses and possible linker stubs; it is not safe to freeze a stock map and splice a different variable-size object after linking;
- `CONFIG_KALLSYMS` defaults to enabled;
- `CONFIG_KALLSYMS_ALL` widens the symbol set and is a non-default/fixed object dimension;
- `CONFIG_KALLSYMS_SELFTEST` defaults off and measures basic functionality/performance/compression rate;
- `--pc-relative` is selected for 64-bit or relocatable builds; `KALLSYMS_EXTRA_PASS` is a build workaround/debug input.

Conclusion: Discovery's exact object is finitely repairable but incomplete. The candidate frontier must be legal under the multi-pass native fixed point and final map validation.

## Standards, papers, and adjacent current work

| Source | Primary fact used | Role/classification |
|---|---|---|
| [RFC 3284: VCDIFF](https://www.rfc-editor.org/rfc/rfc3284.html) | generic source-to-target delta format, independent of encoder algorithm | mandatory same-information composition baseline |
| [Korn and Vo, USENIX ATC 2002](https://www.usenix.org/legacy/event/usenix02/full_papers/korn/korn_html/) | VCDIFF engineering; source/target windowing; fixed-code-table encoding and costs | direct methodological subtractor and paper-shape anchor |
| [FSST, PVLDB 2020](https://www.vldb.org/pvldb/vol13/p2649-boncz.pdf) | explicit static symbol-table construction and fast random-access decoding | dictionary-construction neighbor; different decoder/format |
| [REBL, USENIX ATC 2004](https://www.usenix.org/legacy/event/usenix04/tech/general/full_papers/kulkarni/kulkarni_html/) | full union of compression/dedup/delta and end-to-end evaluation | evaluation-shape anchor |
| [Chromium Courgette official design](https://www.chromium.org/developers/design-documents/software-updates-courgette/) | executable normalization and label adjustment before bsdiff | structure-aware deployment subtractor; different object |
| [2026 kallsyms line-info documentation](https://kernel.org/doc/html/next/admin-guide/kallsyms-lineinfo.html) and [v2 patch](https://www.spinics.net/lists/kernel/msg6084304.html) | block-indexed ULEB128 delta compression of source line-info tables | current nearby collision, but not the symbol-name token stream or cross-version objective |

## Collision search record

Bounded queries included:

- `site:lore.kernel.org kallsyms token table compression optimizer`
- `site:git.kernel.org kallsyms optimize token table`
- `kallsyms delta compression paper`
- `version-aware dictionary compression codebook paper`
- `joint dictionary selection delta compression versions paper`
- `multi-version string dictionary compression codebook stability`

Repositories/pages checked: current Linux generator, reader, link flow and Kconfig; kernel documentation/patch discussion; RFC 3284; original VCDIFF, FSST and REBL papers; Chromium's official Courgette design/source pointer.

Result: a 2026 kallsyms line-info delta series was found and recorded, but it compresses a different source-line table. No reviewed primary source completed the candidate's exact native symbol-name object, predecessor-aware action, fixed-point guarantee, natural release-chain result and full-cost claim. This is `SEARCH_BOUNDED_OPEN`, not proof of novelty.

## Direct-absorption test

| Facet | Candidate | Strongest reviewed source/union | Absorbed? |
|---|---|---|---|
| Object | native kallsyms token/name representation across fixed tag chain | Linux current per-tag representation | same object locally |
| Goal | local image plus cross-version patch/full build cost | stock local size + generic delta | not automatically absorbed |
| Action | predecessor-conditioned native codebook/name-stream construction | stock current-only greedy; deltas cannot choose native target representation | conditional residual |
| Guarantee | exact/certified optimum over deterministic legal frontier | no such native frontier identified | not yet defined enough to claim residual |
| Deployment | unchanged reader and native link/map fixed point | Linux current flow | hard constraint; Discovery narrowed |
| Evidence | official tags, held-out full-cost | no candidate evidence yet | readiness only |

Verdict: no `DIRECT_FATAL` source found, but immediate PASS is not justified because the candidate action/guarantee is underdefined at the native fixed point.

## Fair baseline catalog

1. pinned stock Linux kallsyms and full link flow;
2. stock artifact plus a frozen RFC 3284/VCDIFF encoder;
3. stock artifact plus a second strong binary-delta engine such as a pinned `bsdiff` implementation;
4. deterministic predecessor-token-stability heuristic with a finite settings grid;
5. small exact enumeration/CP only as an oracle, not a deployment baseline or paper mechanism.

Courgette and FSST are subtractors/negative controls because they change format/decoder/object. The 2026 line-info delta patch is a neighboring current feature, not a same-function comparator.

## Evidence, inference, hypothesis separation

- **Evidence:** current Linux performs per-input greedy token selection; the stock reader uses the emitted token table/index; the link flow iterates and validates the final map; generic and executable-aware delta methods exist; a distinct current line-info delta feature exists.
- **Inference:** no predecessor-aware action is visible in the checked native constructor/config surface, and a detached map encoder would violate the full native object.
- **Hypothesis:** a nontrivial fixed-point-preserving frontier exists and has natural cross-version delta headroom beyond stock plus strong deltas.

## Reproducibility and limitations

- Exact pinned GitHub blob pages intermittently returned transport errors during this review. Current official master source paths were independently inspected, and the exact Discovery pin/URLs are retained. No negative claim depends on the failed retrieval.
- No repository, kernel tree, tag corpus, build artifact, candidate output, or benchmark was downloaded or executed.
- Search cannot prove absence. Stage A/B must refresh collision status before any strong novelty claim.
- AI-assisted review disclosure: source discovery, comparison synthesis and report drafting were AI-assisted; all decisive statements are limited to the cited primary material and frozen local inputs.
