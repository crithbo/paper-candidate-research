# Candidate-grade deep review — UOF-234-01

## Current-upstream reality check and collision

| facet | pinned first-party record | conclusion |
|---|---|---|
| current constructor | [upstream `scripts/kallsyms.c` at `d58772d`](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/scripts/kallsyms.c) | counts two-byte tokens globally within one input map, greedily selects best profit and emits complete tables.  It is a strong local baseline; no current-absence claim is made. |
| reader semantics | [upstream `kernel/kallsyms.c` at `d58772d`](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/kernel/kallsyms.c) | decoder expands names through `kallsyms_token_table`/`kallsyms_token_index`; unchanged reader constrains legal encodings. |
| build flow/config | [upstream `scripts/link-vmlinux.sh` at `d58772d`](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/scripts/link-vmlinux.sh) | source invokes kallsyms across link passes, with `CONFIG_KALLSYMS`, `CONFIG_KALLSYMS_ALL`, 64-bit/relocatable conditions and final `System.map` consistency validation. |
| standard delta comparator | [RFC 3284 VCDIFF](https://www.rfc-editor.org/rfc/rfc3284.html) | portable source→target differencing is a required strong composition baseline, not the contribution. |
| direct literature collision | source history documents the table-lookup replacement; an explicit bounded search found no primary paper/source claiming a cross-version, decoder-preserving joint kallsyms codebook constructor | `SEARCH_BOUNDED_OPEN`, not a novelty conclusion. Stage0 must independently update this collision check. |

## N2 algorithm contract

Let `M_i` be the immutable selected symbol mapping for version `i`.  Let `F_i` be a finite, explicitly generated set of decoder-legal table/stream candidates for `M_i`; each candidate includes all required names, markers, token table/index, offsets and name sequences.  Given a fixed previous encoded `E_{i-1}`, find

`argmin_{e_i in F_i} [ full_image_bytes(e_i) + lambda*delta_bytes(E_{i-1},e_i) + mu*generator_build_cost(e_i) ]`.

For a release chain, dynamic programming over the finite candidate graph finds the exact optimum **over the enumerated legal frontier** in `O(sum_i |F_{i-1}|*|F_i|)` edge evaluations; it makes no unsupported global-optimality claim over every possible token table.  The candidate frontier must be constructed by a specified deterministic bounded procedure and fully costed.  This is a nontrivial N2 joint-construction action, not a generic ILP, controller, cache or post-hoc delta wrapper.

## Fairness, full cost and closure

| dimension | frozen requirement |
|---|---|
| same information | candidate and composition receive identical `M_{i-1}, E_{i-1}, M_i`, config/toolchain and deployment delta format |
| strongest union | stock per-version global optimizer + VCDIFF/binary delta; source is available to both, but only proposal changes construction rule |
| semantic guarantee | unchanged stock decoder/lookup and normalized `System.map` relation equal at every tag |
| denominator | full `vmlinux` bytes and kallsyms bytes; delta bytes; map extraction; candidate generation; all kallsyms/link passes; build CPU/RSS; boot and lookup CPU/RSS; verifier time |
| natural route | 20–50 sequential official tags under one frozen config, chronological train/held-out split, with tag/tree/config/toolchain/artifact hashes |
| no-gain | report per-tag and chain total; no selected-pair-only result and no outer compression-only result |

**72-hour Stage A killer:** reject if any held-out tag has unequal stock lookup/System.map semantics; if the proposed DP is reproducible by stock optimizer plus delta under equal inputs/cost; if candidate-frontier construction is unbounded or depends on changed mapping/reader; or if full-cost delta/image/build/boot/lookup yields no residual.  This is a finite future test, not an observation.

`structural_paper_potential`: `TIER_B_Q2_VIABLE` conditionally—an exact same-semantics joint codebook algorithm, clear strongest composition and natural official chain form a Q2 paper shape if a residual survives.  `current_evidence_readiness`: moderate-low: source/pin/witness/plan are frozen, but no natural artifact was acquired or measured.  Decision: `PROPOSE_STAGE0`.
