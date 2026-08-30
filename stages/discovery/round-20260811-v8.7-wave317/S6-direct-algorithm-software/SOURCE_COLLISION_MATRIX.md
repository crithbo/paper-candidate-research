# Source / collision matrix

| deep row | official/primary anchor | strongest absorption or open gap | decision |
|---|---|---|---|
| minimap2 | [upstream](https://github.com/lh3/minimap2), [current man page](https://github.com/lh3/minimap2/blob/master/minimap2.1) | current DP chaining, RMQ, alternate modes and chain/output actions absorb generic chaining | DROP |
| WFA2 | [WFA primary material](https://github.com/smarco/WFA-paper) | exact gap-affine WFA/WFA-Adapt with score-parameter bounds directly subtracts target shape | DROP |
| Lean 4 | [official upstream](https://github.com/leanprover/lean4) | current elaborator union/direct collision not closed | UNFROZEN |
| sourmash | [official upstream](https://github.com/dib-lab/sourmash) | native union and target-specific sketch theorem not closed | UNFROZEN |

First-party source and paper anchors only. An incomplete row is not a claim that the current implementation lacks an action.

