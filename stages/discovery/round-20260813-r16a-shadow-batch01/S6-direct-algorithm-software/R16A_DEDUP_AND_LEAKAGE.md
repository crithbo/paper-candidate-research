# Deduplication and leakage check

| Check | Result |
|---|---|
| Counted signatures | rr trace, rustc CGU, Souffle relation index, OpenJDK C2 IR |
| Tree-sitter | Excluded: historically reviewed current-union absorption kernel |
| mold | Excluded: potential GNU ld/lld layout-relaxation implementation relabel |
| Canonical before shadow | Pass: canonical files and sub-manifest were completed before final shadow files were generated |
| Shadow influence on canonical | None; canonical handoff states `shadow_consulted: false` |
| Cross-lane duplicate observed | None in the available R16A control snapshot |

No absent-current-action conclusion was used to promote a candidate. The
unfrozen rows retain finite source/action/collision closure plans only.
