# Raw screen row events

| Row | Native writer/planner exact object | Initial same-object action-divergence witness | Funnel result |
|---|---|---|---|
| R01 | clang-format source tokens to formatted token-equivalent output | global line-break grouping beyond one adjacent token decision | DEEP |
| R02 | rustfmt source AST/tokens to formatted token-equivalent output | global chain/argument layout grouping beyond local whitespace | DEEP |
| R03 | libpng image rows to PNG filtered scanline stream | cross-row filter-state assignment preserving decoded pixels | DEEP |
| R04 | GNU tar sparse file to archive sparse representation | not frozen: archive format/options change stored-object semantics | NOT_ADMITTED_UNFROZEN |
| R05 | FFmpeg packets to container interleaving | not frozen: timing/interleave constraints and streaming state not closed | NOT_ADMITTED_UNFROZEN |
| R06 | libtiff image to strip/tile file layout | not frozen: tiling/codec choices change fixed format/layout contract | NOT_ADMITTED_UNFROZEN |

R04–R06 were deliberately not promoted to candidate-grade review. The initial witness requirement prevented repeated deep reviews of known/unfrozen unions.
