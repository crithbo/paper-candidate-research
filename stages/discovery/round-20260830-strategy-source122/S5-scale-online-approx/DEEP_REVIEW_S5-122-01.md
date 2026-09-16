# Type-specific deep review S5-122-01

## Atomic action skeleton

`GuardCover` maintains a DAG/poset of exact cache-entry guard predicates. For each arriving signature it may:

1. dispatch an existing valid specialized or symbolic artifact;
2. compile a static artifact for the current signature;
3. compile a minimally broadened symbolic artifact using the current PyTorch dynamic-shape mechanism;
4. retain a faster covered specialization, or retire it only after guard implication and cost dominance are certified;
5. use eager execution when no compile action is expected to amortize.

The online policy sees only prior signatures and measured compile/runtime/byte costs. An offline dynamic program over the frozen finite trace is the oracle ceiling.

## Anti-collapse result

- Not plain LRU: lookup keys alone are insufficient; guard predicates define overlapping semantic regions and a safe coverage relation.
- Not ordinary threshold tuning: the action includes exact implication-certified retirement and choice between static and symbolic artifacts.
- Not DISC/Vortex: those works change dynamic-shape code generation/search; the frozen object is PyTorch's existing guarded multi-version cache and dispatch/fallback policy.
- Not unsafe guard skipping: `skip_guard_eval_unsafe` is explicitly outside the guarantee and is not a comparator action.
- Main collapse risk remains real: if Stage 0 finds a current implication-aware retirement path or if guard implication is intractable/unsound for PyTorch's full guard language, the candidate must be narrowed or dropped.

## Current union and subtractors

| Source | Covered | Residual |
|---|---|---|
| PyTorch `cache_size.py` | Entry/ID_MATCH counting and eager fallback safety caps | No observed joint compile/runtime/byte decision or guard-cover compaction in inspected locus. |
| `set_stance` | Default, force-eager, eager-on-recompile, fail-on-recompile, eager-then-compile, AOT-eager-then-compile | Coarse global phase stance, not per-frame guard-poset admission/retirement. |
| Inductor `GuardedCache/FxGraphCache` | Multiple guarded variants, first valid candidate, add on miss, local/remote persistence | No observed implication-based dominance ordering/deletion in inspected class locus. |
| DISC | Fully dynamic IR/runtime flow; static compiler when shape count is acceptable | Different compiler and action; strong dynamic-from-start baseline. |
| Vortex | Sample-free hardware-driven dynamic tensor program optimization | Different code-generation/search object; strong generalized-kernel baseline. |

## Mechanism predictions

- Benefit region: bursty or clustered shape streams where a small symbolic cover coexists with a few hot static shapes.
- Signature: fewer recompiles/fallbacks and lower cache bytes than static/current-default, while retaining lower steady-state runtime than dynamic-from-start.
- No-gain regions: one stationary shape; every signature unique; symbolic artifact already matches static runtime; guard regions non-overlapping; compile cost negligible.
- Strong null: `eager_then_compile` plus automatic dynamic shapes and a fixed limit already lands on the same Pareto frontier.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- Real interface: TorchDynamo cache entries/guard managers and Inductor `guards_expr`; no proxy cache may support the main claim.
- Comparator semantics: identical compiled frame and eager fallback; same input signatures and output checks.
- Small witness: exact guard expressions, implication oracle, dispatch replay, and exhaustive policy oracle.
- Finite steps: pin commit → enumerate flags/source paths → implement read-only ledger → validate implication → add admission/retirement behind assignment-local hook → run control before any claim workload.
- Structural failure: implication requires weakening/skipping guards, dynamic compile changes semantics, or current union already exposes the same action.

## Q2/Q1 shape

- Q2 hypothesis: compiler-tool paper with a nontrivial online algorithm, safe guard-coverage mechanism, current PyTorch implementation, public variable-shape workloads, strong current baselines, and full-cost evidence.
- Q1 path: formal competitive/regret result on a justified guard-family class plus broad workloads and CUDA Graph interaction.
- Current Discovery label: `TIER_B_Q2_VIABLE`, conditional on independent Stage 0 current-union and venue calibration.

