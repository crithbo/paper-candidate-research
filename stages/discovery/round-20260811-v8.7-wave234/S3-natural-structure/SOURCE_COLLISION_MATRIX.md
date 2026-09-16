# Source and collision matrix

| source | evidence | effect on proposal |
|---|---|---|
| [Linux current pinned generator](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/scripts/kallsyms.c) | complete per-version global token-profit/greedy construction | strongest local baseline; frequency-only variants absorbed |
| [Linux pinned decoder](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/kernel/kallsyms.c) | table/index-driven stream expansion | same-object oracle and unchanged-reader constraint |
| [Linux pinned link flow](https://github.com/torvalds/linux/blob/d58772d8520c7ef247c4b95c9bd76d3a25da9ff5/scripts/link-vmlinux.sh) | repeated link/kallsyms passes and map validation | full-cost path; not an emitter-only comparison |
| [RFC 3284](https://www.rfc-editor.org/rfc/rfc3284.html) | standard source→target delta format / algorithm-independent decoder | required binary-delta composition, prevents delta-wrapper claim |
| [Linux v6.12 generator](https://github.com/torvalds/linux/blob/v6.12/scripts/kallsyms.c) | historical base-relative/absolute-percpu contrast | no false claim that master and older flag/action spaces are identical |

Bounded collision conclusion: no direct same-object joint version-aware kallsyms codebook constructor was identified in the reviewed first-party source/history and standards material.  This remains `SEARCH_BOUNDED_OPEN`; it is not an absence or novelty proof.
