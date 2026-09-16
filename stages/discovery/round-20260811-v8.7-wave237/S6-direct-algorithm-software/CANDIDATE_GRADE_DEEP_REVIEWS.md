# Candidate-grade deep review

## F1 — BOLT multiscale joint layout/relaxation

**Disposition:** `NOT_ADMITTED_UNFROZEN`; no brief.

| Gate | Frozen record |
|---|---|
| Same-object semantics | Fixed binary/profile/ISA/ABI/export/relocation/unwind/exception semantics; stock loader and functional behavior unchanged. |
| Current strongest composition | BOLT basic-block and function reordering, hot/cold splitting, profile-driven optimization, alignment/debug options, and LLVM target branch-relaxation/trampoline mechanisms; all current flags/order/target paths must be included. |
| N2 hypothesis | A joint algorithm/guarantee for chains, function order, split, alignment and relaxation that accounts for rewrite CPU/RSS, bytes, startup, i-cache and branches. Known actions are legitimate inputs. |
| Witness | Hot-chain contiguous versus interleaved function placement with regenerated references and valid branch targets. |
| Direct subtractors | BOLT; ext-tsp; Codestitcher; compiler PGO/code-layout and linker relaxation baselines. |
| Natural route | Public LLVM Test-Suite binary/profile route, frozen exact inputs. |
| Full cost | Rewrite CPU/wall/RSS/temp; binary bytes; loader/startup CPU/RSS; i-cache/branch measurements; validation/unwind/debug cost. |
| 72h killer | Pin LLVM commit; enumerate BOLT reorder/split/alignment/relaxation flags and pipeline; create the two-layout witness; validate ABI/unwind/function behavior; reject if stock composition realizes it, only weights/options differ, relaxation invalidates equivalence, direct work absorbs guarantee, or full cost erases advantage. |

The gap is not missing an atomic action or implementation. It is that no distinct, source-pinned multiscale guarantee survives the documented composition and collision set.
