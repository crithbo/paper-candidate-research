# TORCHDYNAMO-GUARD-COVER-CACHE-REV0 Revision 1 Independent Closing Report

## 中文摘要

- Closing verdict：`PASS_RECOMMENDED`。
- First unclosed Stage 0 gate：`NONE`。
- 质量档：`TIER_B_Q2_VIABLE`，仍是条件性论文潜力判断，不代表机制或性能结果已经成立。
- 为什么：revision 1/1 保持 exact PyTorch 2.13 frame/bucket/stream/endpoint/ceiling；任意 guard implication 已收缩为 exact non-shape quotient 与 solver-certified ShapeEnv implication；compatibility oracle、logical/physical ownership split、all-cell denominator、current native baselines、Q2 breadth 与 Stage A killer 均已冻结且彼此一致。
- 下一步：MAINLINE 可登记 Stage 0 PASS 并另冻 Stage A assignment。首次 claim-bearing run 前必须实际闭合 source-pinned hook、solver replay、compatibility oracle、ownership ledger 与完整 cell freeze。
- 用户操作：无。

- Lane id: `STAGE0_SENTRY`
- Assignment id: `STAGE0-CLOSING-20260830-TORCHDYNAMO-GUARD-COVER-CACHE-REVISION1`
- Input context SHA-256: `93581458D4BC710A05A0F46C5191FDA2BFF1A3155218CE2DEBF5E51C79AAC528`
- Revision handoff SHA-256: `005B9299234B8D0211078041D0E035BCA3414B7BC4BDAAAFD32B991210BA19B9`
- Revision manifest SHA-256: `C5CCD4F55828DBCEDF671794EC58CE76B9DD111A6E96813DB21CF3A22EF50143`
- START SHA-256: `94D2FBC063156258AEF070A3B08A257663C5A683A0F52B76EB8DEDC1637ACD80`
- Model route: `gpt-5.6-sol/high` temporary user-command override
- Scientific revision: consumed `1_of_1`; no second revision authorized or performed
- Search/open: `0/8`
- Implementation/build/claim execution/Stage A/Stage B/shared write: `0`
- Claim-bearing observation: `false`
- Current-cycle usage reset confirmed: `false`
- Evidence ceiling: `STATIC_CONTRACT_ONLY__ZERO_CANDIDATE_RESULT`
- Confidence: `0.95`

## Judge record

- Verification mode: independent revision re-review / Stage 0 closing.
- Verification judge: current Sol/high SENTRY session.
- Independent cross-model pass: `not_configured`; no external content upload occurred.
- Evidence seen: closing control, revision handoff/manifest, revised Stage 0 contract, restricted quotient/compatibility contract, retirement ownership contract, denominator/native-baseline contract and Stage A killer plan.
- Verification method: each required gate mapped to exact contract clauses; author's handoff claim was checked against the referenced artifacts; manifest replay completed 14/14.
- Judging budget: local read-only verification, `0` search/open, `0` execution.
- Disclosure: This verification round ran on the same model family that drove the revisions; over-optimization to this judge's latent biases is possible (Ren et al. 2026, arXiv:2607.13104 §8.1.2).

## Priority-1 revision traceability

| # | Required repair | Contract location | Independent verification | Status |
|---|---|---|---|---|
| C1 | Preserve exact object, stream, information, guarantee, endpoint and resource ceiling | `REVISED_STAGE0_CONTRACT.yaml: preservation` | One PyTorch 2.13 code object/frame and isolate bucket, online result-independent signature stream, past-only information, exact observable semantics, cumulative full-cost endpoint and public CPU/single-CUDA ceiling remain unchanged | `FULLY_ADDRESSED` |
| C2 | Replace arbitrary guard reasoning with exact non-shape quotient | `RESTRICTED_QUOTIENT_AND_COMPATIBILITY.yaml: exact_equal_non_shape_quotient` | Code/bucket/backend/options, type/identity/global/module state, alias/mutation/side effects, outputs/autograd/recompute/fallback and downstream cache context must all be exact-equal; unknown/non-equal means incomparable | `FULLY_ADDRESSED` |
| C3 | Freeze correct ShapeEnv implication orientation and certificate | `shape_region_relation` | A covers B exactly when `B_shape_guard ⇒ A_shape_guard`, within the same quotient and compatibility class; normalized predicates, symbol map, direction, solver version/options, certificate and timeout are mandatory | `FULLY_ADDRESSED` |
| C4 | Freeze a complete compatibility oracle | `compatibility_oracle` | Output pytree/value/dtype/shape, aliasing/mutation, Python side effects/state, backend/fallback/graph-break behavior, autograd saved tensors and checkpoint recomputation, plus downstream cache/CUDA Graph context are mandatory; mismatch or unknown blocks retirement | `FULLY_ADDRESSED` |
| C5 | Separate logical retirement from physical reclamation | `RETIREMENT_OWNERSHIP_CONTRACT.yaml` | Logical action only disables a Dynamo dispatch entry and uses native invalidate/move-to-back as baseline. Physical deletion is optional and requires stable identity, complete reference graph, sole-owner proof, no active user and observed byte/residency change | `FULLY_ADDRESSED` |
| C6 | Freeze all-cell denominator and full cost | `ALL_CELL_DENOMINATOR_AND_BASELINES.yaml` | Model×frame×stream×policy×temperature×control product, exact cell identity, every failure/ownership-unknown cell, cold/warm and hook on/off controls are explicit; no result-aware exclusion or denominator rewrite | `FULLY_ADDRESSED` |
| C7 | Freeze complete PyTorch 2.13 native/simple baselines | `native_baseline_union` | Default automatic dynamic/PGO/MRU/limits, dynamic grid, isolate/limit grid, eager stances, MRU/insertion, exact guard evaluation, simple cache and offline full-cost oracle are mandatory; unsafe filters cannot win the primary comparison | `FULLY_ADDRESSED` |
| C8 | Freeze credible Q2 breadth | `minimum_q2_panel`, `required_stream_strata` | At least 12 public models, 3 families, CPU plus one public CUDA route, held-out frames/models, certified-positive and multiple negative strata including recomputation/ownership are mandatory | `FULLY_ADDRESSED` |
| C9 | Freeze a mechanism-specific Stage A killer | `STAGEA_KILLER_PLAN.yaml` | Two real frames/two families, 4–8 preregistered signatures, certified-overlap positive, recompute incompatibility negative, source-pinned hook, real Dynamo entries, full native controls and nine explicit kill conditions are frozen | `FULLY_ADDRESSED` |

All required closing items are fully addressed. No second revision request is generated.

## Exact object, endpoint and ceiling

The exact object remains one PyTorch 2.13 `torch.compile` code object/frame and one isolate bucket containing real Dynamo guarded compile units. The input is a result-independent online signature stream; the policy may use only past signatures, guards and measured costs.

The endpoint remains cumulative compilation/recompilation, execution, guard dispatch, eager fallback and retained residency full cost under exact PyTorch observable semantics. The evidence ceiling remains public CPU plus a single public CUDA GPU. The revision forbids arbitrary guard dropping, unsafe filtering as the primary method, generic cache/set-cover substitution and result-dependent stream/cell selection.

Closing result: `PRESERVED`.

## Non-shape quotient and ShapeEnv orientation

Entries may be shape-compared only after exact equality across every frozen non-shape dimension. The quotient includes code/bucket/backend identity, tensor metadata and aliasing, Python identity/global/module state, mutations/side effects, output and autograd signatures, saved tensors/recompute identity, graph-break/fallback behavior and downstream cache context.

For entries A and B:

`A covers B ⇔ ∀ inputs, B_shape_guard ⇒ A_shape_guard`.

This orientation is correct: every input accepted by B must also be accepted by the more general covering entry A. The contract records normalized predicates, source-symbol mapping, implication direction, solver result/version/options, checkable certificate and timeout budget. `UNKNOWN`, timeout, unsupported atoms, noncheckable proof or sampled truth tables yield `INCOMPARABLE`.

Closing result: `CLOSED_WITH_CORRECT_ORIENTATION`.

## Compatibility oracle

Guard overlap is not treated as interchangeability. The oracle requires all mandatory dimensions:

- output pytree, values/numeric policy, dtype/shape/observable stride;
- input/output aliases, tensor mutations and Python-object mutations;
- Python side-effect order, global/module state reads/writes, backend/options, graph-break resume and eager fallback;
- requires-grad/autograd output signatures, saved tensor count/order/shape/dtype/aliasing, activation-checkpoint forward/recompute identity and backward observables when training is retained;
- FxGraphCache, AOTAutograd, Triton/native code and CUDA Graph context.

Any mismatch is `INCOMPATIBLE`; any unknown/unobservable dimension is `INCOMPARABLE`. Logical retirement additionally requires certified cover, exact quotient, compatibility, frozen-past full-cost dominance and absence of active recompute/pin dependency.

Closing result: `COMPLETE`.

## Logical retirement versus physical reclamation

Logical retirement acts only on a Dynamo dispatch entry. It must demonstrate that the entry no longer dispatches, other entries remain valid, limit accounting is reported and active forward/backward/recompute users are absent or pinned. The PyTorch 2.13 native invalidation behavior is a required baseline.

Physical reclamation is separately optional. The contract spans Dynamo code, FXGraphCache, AOTAutograd, generated/loaded Inductor modules, Triton/native binaries, autotuning, PGO/Mega-Cache and CUDA Graph pools. Deletion requires a stable artifact identity, complete reference graph, sole-owner/refcount proof, no active user, reacquisition-cost accounting and observed bytes/residency change. Shared/external/unknown ownership means retain and count full cost.

The primary endpoint does not require a physical-saving claim, but retained physical residency remains charged. Therefore reducing logical entries cannot be misreported as freeing memory or disk.

Closing result: `CLOSED_AND_NONCONFLATED`.

## All-cell denominator, baselines and Q2 breadth

The denominator is the frozen Cartesian product:

`MODEL × FRAME × SIGNATURE_STREAM × POLICY × CACHE_TEMPERATURE × PROCESS_CONTROL_ARM`.

It retains solver unknowns, quotient/compatibility failures, missing safe hooks, ownership unknowns, eager fallback, execution failures, unobservable full cost and negative-control failures. Cold/warm and hook-on/off strata are mandatory; policy/solver/hook/ownership overhead is charged.

The native baseline union covers the current PyTorch 2.13 mechanisms named by PRIMARY/SENTRY. Adjacent DyPARS/DISC/Vortex remain direct baselines only when same-function, information, platform and full-cost fairness is achievable; otherwise they are contextual subtractors. The offline oracle is never presented as deployable.

Q2 requires at least 12 public models across three workload families, CPU and one public CUDA route, held-out frames/models and preregistered positive/negative streams. Failure conditions stop a thin or generic cache paper.

Closing result: `CLOSED_FOR_STAGE0`.

## Stage A killer

The future Stage A packet is deliberately smaller than the Q2 paper plan and attacks the decisive premise:

- two public real Dynamo frames from two families;
- 4–8 signatures per frame;
- one solver-certified overlap positive pair;
- one activation-checkpoint/saved-tensor recomputation negative pair;
- exact PyTorch v2.13.0 base and source-pinned hook;
- hook on/off, cold/warm, full native grid, simple cache, offline oracle and ownership controls.

It kills the direction if no certified pair exists, any observable/recompute mismatch occurs, no safe logical hook exists, logical retirement has no independent full-cost benefit without physical reclamation, native/simple baselines sit within 5% of the offline frontier everywhere, effects disappear under controls, negatives show comparable gains, ownership-unknown cells must be excluded, or the residual becomes generic caching/set cover.

Closing result: `MECHANISM_SPECIFIC_AND_BOUNDED`.

## Strongest counter-argument and resolution

The strongest objection is that the exact hook patch/hash, solver implementation/certificate replay, concrete frames/signatures, ownership reference graph and per-cell IDs do not yet exist. If these were left open during claim execution, the repaired contract would be cosmetic.

The contracts place every item behind explicit preclaim gates and forbid proxy-only science. Stage 0 requires a finite, same-object fidelity-closure route; Stage A must actually materialize it before any claim-bearing observation. Failure to do so yields a preclaim execution/fidelity failure with no scientific inference, not permission for another revision or a weaker proxy claim.

This is a future execution gate, not an unclosed Stage 0 scientific gate.

## Decision

- Scientific verdict: `PASS_RECOMMENDED`
- First unclosed Stage 0 gate: `NONE`
- Operational disposition: `READY_FOR_MAINLINE_STAGE0_PASS_REGISTRATION_AND_SEPARATE_STAGEA_ASSIGNMENT`
- Quality tier: `TIER_B_Q2_VIABLE`
- Claim ceiling: `CONDITIONAL_PAPER_POTENTIAL_ONLY__STATIC_CONTRACT_CLOSED__ZERO_CANDIDATE_RESULT`
- Revision budget: consumed `1_of_1`; no second revision available
- Reset handling: current cycle remains unconfirmed; if later confirmed, this closing is complete and no successor is accepted by this lane

