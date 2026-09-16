# LLVM-RVV-GROUP-MASK-SPILL-PARETODP — r5c A3 Independent Preclaim Fidelity Review

## 中文摘要

- 独立结论：`REJECT_PRECLAIM_FIDELITY__SPECIFIC_BOUNDED_ROUTE_OR_HARD_BLOCKER__NO_SCIENTIFIC_INFERENCE`；本案属于仍有有限同对象路线的 `SOFT_ENGINEERING_BLOCKER`，不是 hard external blocker。
- G0、G1、G3、G5、G6 通过；G2、G4 不通过；G7 因而不能进入 separate natural corpus/claim assignment。
- 通过部分是真实的：87/87 manifest 复算一致；两次 fresh llc/MachineVerifier 回执 exit 0、输出 byte-exact；14/14 command receipts 的 CWD/argv/exit/stdout/stderr/output hash/retry 均闭合；动态 roots、递归 ancestry、两条 split action 链与 exact 12-case set 均可静态复核。
- 决定性缺口：F4/F5 校验 closure 文件及内部哈希，但 labeled/quotient successor、frontier、backpointer 与 baseline full-cost 仍由旧的独立 DP 计算。closure 的 path/future/cost/parent-action obligations 没有进入这些状态、转移或 cost；F4 的 PASS 对 closure 仅要求 `successor_relation` 非空，F5 多个关键 parity 条件是常量 `True`。
- `MUTATED_TRANSITIVE_GRAPH_HASH` 与 `MUTATED_FUTURE_ACTION_OR_COST_SIGNATURE` 都因 mutation 后没有重封内部 graph/dependency hashes 而触发 `split closure internal dependency mismatch`。它们证明 integrity fail-closed，却不能证明一个内部自洽、重新哈希但 future-action/cost 不同的 closure 会改变 quotient 或 baseline 结果。
- 因此 owner 的 `PASS_PRECLAIM_ENGINEERING_FIDELITY__WAIT_INDEPENDENT_GATE` 作为待检验 hypothesis 被否定；不得写成预声明接受，更不得写成正式 Stage A PASS。未形成任何自然、selected、claim-bearing 或科学推断。

## Authority and boundary

- Assignment: `STAGEA-GATE-20260826-LLVM-RVV-R5C-A3-TRANSITIVE-SPLIT-PRECLAIM`
- Review lane/thread: `STAGEA_GATE` / `01a034d0-d990-7d50-9d9f-a6d05a81bf11`
- Owner lane/thread: `CANDIDATE_EXECUTION_LANE_1` / `01a034d0-d0a8-72c2-bb87-3ed590d87620`
- Reviewer-owner independence: PASS.
- Context SHA-256: `C62D5CC268FA70BDA38672B6BA1B6BAEA94E352FC4860901D3A795A3987A4BB1`
- Control SHA-256: `0EBA662071474F818A299B546E1AEAAC9164BC402CA821CAA1EBAADEBA9D7A8E`
- START SHA-256: `5D7C20242EC36EB34EF17A26A32D154A5D9218E2229EF4CB73A81F2A55E0D5DB`
- Evidence ceiling: `INDEPENDENT_PRECLAIM_CONTROL_FIDELITY_ONLY__NO_NATURAL_OR_SCIENTIFIC_INFERENCE`.
- Stage A mechanism pivot: `CONSUMED_1_OF_1__NO_SECOND_PIVOT`; scientific revision remains unconsumed, and this review neither consumes nor authorizes one.
- Review actions: static source/raw/receipt/hash/dependency audit only; no native tool, corpus, natural/selected/claim, resource, state, cleanup, revision/pivot, or Stage B action.

## Frozen G0–G7 result matrix

| Gate | Result | Independent basis |
|---|---|---|
| G0 identity and preservation | PASS | Same topic/object/witness/action and accepted ceiling retained; owner manifest rehashed 87/87; A2 87/87 preservation receipt and A1/pass1 ancestry retained; no owner/shared write by reviewer. |
| G1 transitive split graph | PASS | Roots are derived from MIR children, not literals; recursive walk and ancestry/backpointer paths are implemented; observed roots are 4/11 with descendant chains 14→15 and 12→13 by spill/reload stack flow; cycle, unknown parent, cross-class/LMUL, orphan and multiroot cases fail closed. |
| G2 quotient and future action/cost | FAIL | Closure produces path/future/cost signatures, but F4's `LabeledState`, quotient key/successors and certificate do not contain or use them. Parent/action/backpointer and cost obligations remain outside the compared quotient transition system. |
| G3 native replay receipts | PASS | C4/C5 are exact llc greedy + `-verify-machineinstrs` commands, exit 0, retry 0; R1/R2 both hash `AE30D124...` and are byte-identical; all receipt hashes resolve. |
| G4 F3/F4/F5 dependency | FAIL | Exact closure hash is checked, but F4's certificate is computed independently and only tests `bool(successor_relation)` from closure; F5 candidate/baselines are the same old certificate and its split-closed/full-cost assertions do not drive their values. Integrity mutations do not test a self-consistent semantic change. |
| G5 exact negative controls | PASS_WITH_SCOPE_CAVEAT | Exact 12 keys and all 12 expected truth values are present; names/count/generators/values/polarity are unchanged and order is nonsemantic. The four dependency cases establish presence/hash integrity, not G2/G4 semantic consumption. |
| G6 reproducibility/resource | PASS | 87/87 manifest, 14/14 receipts, 251 files / 51 directories / 198,523,068 bytes, zero reparse, one unchanged preexisting pyc and zero observed python/llc process; reviewer network/resource/cleanup actions are zero. |
| G7 next route | REJECT_TO_BOUNDED_ENGINEERING_CORRECTION | G2 and G4 block natural/claim readiness. The remaining defect is assignment-local dependency semantics and can be corrected without changing object, mechanism, action, baseline, denominator, gate, pivot or scientific revision. |

## Decisive methodology audit

`split_closure.py` now materially improves the prior packet. It parses the MIR register section, derives child edges, recursively walks descendants, forms ancestry and action backpointers, verifies class/LMUL/physreg/spill/reload/restoration constraints, and hashes path, future-action, spill/reload cost and mask/interference obligations into two quotient signatures. The raw closure is internally consistent and the replay is exact.

The dependency stops at the F4/F5 boundary:

1. `load_split_closure` validates the raw file hash and recomputes graph/dependency integrity.
2. `quotient_certificate()` is then called with no closure argument. Its labeled state and quotient key remain `(index, used, typed, whole, cost)`; its successors, frontier and backpointer replay are calculated exclusively from the four-fractional-value/two-slot toy grammar.
3. F4 attaches closure fields to the output, but its PASS predicate uses them only through `bool(dependency["successor_relation"])`. It never compares the closure successor relation with labeled or quotient successors, never inserts closure state signatures into equivalence keys, and never charges closure obligations in the cost tensor.
4. F5 again calls the closure-independent certificate. `all_baselines_consume_identical_split_closed_grammar`, same-information and no-future-information checks are literal constants; the only data-dependent closure check is that each state has a nonempty `actions` list, plus an action count reported as spill/reload/future-use cost.

The strongest adversarial counterfactual is therefore static and finite: replace the closure with a different but internally self-consistent graph/future/cost packet, recompute all internal hashes, and keep `successor_relation` nonempty. The source shows that F4's certificate/frontier/backpointers and F5's candidate/baseline frontiers would remain unchanged. No such execution was performed by this reviewer; the counterfactual follows directly from the absence of closure data on those code paths.

## Specific bounded same-object correction route

Route ID: `RVV_R5D_SPLIT_CLOSURE_SEMANTIC_INJECTION_INTO_QUOTIENT_AND_BASELINES_V1`.

MAINLINE may, under the soft-engineering-blocker rule, freeze a fresh correction assignment that:

1. threads the validated closure state into labeled and quotient state keys and successor generation, including root/ancestry/path obligation, future-action signature, spill/reload/future-use cost, mask/interference and parent/action backpointer identity;
2. makes F4 compare projected labeled successors against the closure-conditioned quotient successors and replay backpointers under those same obligations, rather than treating a nonempty receipt as sufficient;
3. makes F5 derive candidate and every frozen baseline from the identical closure-conditioned action grammar and actual full-cost tensor; replaces constant parity assertions with computed comparisons;
4. adds at least one internally self-consistent, fully rehashed graph/future/cost semantic mutation whose changed obligation must alter the expected quotient/cost or fail for a semantic reason, while retaining exact hash-mismatch and missing-closure controls;
5. fresh-replays all affected preclaim controls with exact receipts and returns to this independent gate.

This is an implementation of the already consumed pivot, not a second pivot or scientific revision. This review does not authorize the correction, execution, natural/claim work, state change or Stage B.

## Final disposition

`REJECT_PRECLAIM_FIDELITY__SPECIFIC_BOUNDED_ROUTE_OR_HARD_BLOCKER__NO_SCIENTIFIC_INFERENCE`.

- Blocker class: `SOFT_ENGINEERING_BLOCKER` with the specific finite route above.
- Natural/selected/claim start: rejected.
- Formal Stage A PASS: not reached and not declared.
- Scientific PASS/STOP/state transition: none.
- User action: none at this gate; next authority is MAINLINE.

