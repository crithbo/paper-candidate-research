# Primary collision audit — RISC-V GP layout

## Frozen query boundary

The only searches were the three assignment-specified site-restricted queries.  Results were locator-only.  At most the first primary candidate matching the explicit current-ISA RISC-V GP condition was opened.

| Query route | Locator result | Primary analysis |
|---|---|---|
| ACM DL query | No eligible primary selected | No candidate opened. |
| IEEE Xplore query | No eligible primary selected | No candidate opened. |
| arXiv query | arXiv:2605.25602 | Opened once.  Abstract says it evaluates variants that *add near-addressing features to the RISC-V ISA*. |

## Relation

arXiv:2605.25602 is `RELATED_ONLY__CHANGED_ISA`.  It concerns the GP range pressure but changes the ISA, whereas the frozen object requires fixed current ISA, one gp, stock LLD relaxation and unchanged ELF endpoint.  It neither establishes direct same-object coverage nor supports an absence claim.

## Bounded conclusion

No direct same-object primary-paper collision was established within the three queries.  That bounded fact is not novelty evidence.  The structural disposition instead follows from the positive current LLD union plus reduction of the remaining joint GP/data-placement decision to a generic placement kernel.
