# Cost-Aware Model Routing Policy R1

## 1. Global defaults

- Project default: `gpt-5.6-terra / medium`.
- No inherited model: every new assignment/context and every cross-thread follow-up that starts work must state `model_route` explicitly.
- Default maximum reasoning: `high`.
- `xhigh` and `max`: forbidden by default; require a new user authorization naming the task and reason.
- An active turn is not interrupted solely to change model. New routing applies at the next safe follow-up or assignment boundary.
- Idle/not-loaded tasks remain asleep; do not spend a turn only to acknowledge a model change.

## 2. Role matrix

| Role/work | Default route | Permitted bounded escalation |
|---|---|---|
| MAINLINE routine control, queue, acceptance | `Terra / medium` | `Terra / high` for multi-state conflict; `Sol / high` only for unresolved high-risk scientific-policy conflict |
| RULE_AUDIT ordinary audit/proposal | `Terra / medium` | `Terra / high` for cross-rule patch; `Sol / high` only after a documented Terra disagreement |
| Discovery S1–S6 breadth | `Terra / medium` | `Terra / high` for a frozen selective-depth packet |
| Discovery selected deep collision/closure | `Terra / high` | `Sol / high`, project-wide max 1 packet per six-lane cycle and only after nomination barrier |
| Measurement M1 | `Terra / medium` | `Terra / high` for claim-critical statistical ambiguity |
| Backtest PACKER | `Terra / medium` | none; mechanical hash/scan subtasks may use `Luna / low` |
| Backtest EXECUTOR | `Terra / medium` | `Terra / high` only for a frozen difficult case; never reveal gold to justify escalation |
| Backtest AUDITOR | `Terra / high` | `Sol / high` only for unresolved contamination or gold-label dispute |
| Stage 0 PRIMARY/SENTRY | `Terra / high` | none by default |
| Stage 0 DECISIVE | `Terra / high` | `Sol / high` only when primary/sentry disagree on a terminal scientific decision |
| Stage A owner: bootstrap/build/log/format | `Luna / medium` | `Terra / medium` when tool diagnosis is nontrivial |
| Stage A owner: mechanism/fidelity/claim analysis | `Terra / high` | `Sol / high` only after one recorded Terra attempt leaves a claim-critical ambiguity |
| Stage A independent gate | `Terra / high` | `Sol / high` only for a documented owner/gate conflict with terminal effect |
| Stage B owner after user approval | `Terra / high` | `Sol / high` only for final claim-critical integration, not routine runs |
| Stage B independent review | `Sol / high` | no automatic xhigh/max |
| Formal manuscript drafting/tables/citations | `Terra / medium` | `Terra / high` for synthesis |
| Final manuscript/claim-integrity review | `Sol / high` | no automatic xhigh/max |
| Hashes, manifests, bootstrap ACK, file existence | `Luna / low` | `Terra / low` on parser ambiguity |
| Monitoring, status relay, archive/pin/title | `Luna / low` | none |

## 3. Escalation evidence

Sol/high is allowed only if the assignment records at least one of:

1. two independent Terra judgments disagree on a terminal PASS/STOP or claim ceiling;
2. a formal equivalence/theory question remains unresolved after a bounded Terra/high pass;
3. Stage B or final manuscript review is independently checking a claim that can cause publication, retraction, unsafe hardware conclusions, or irreproducible release;
4. a complex compiler/RTL implementation has one documented Terra/high failure and Sol is used for one bounded correction packet.

“题目重要”“想更保险”“以前一直用 Sol”不是升级证据。

## 4. Automatic de-escalation

- Escalation applies to one frozen assignment or correction packet, never to the permanent thread.
- On handoff/acceptance/blocker, the lane returns to its table default.
- Follow-up messages that only ask status, hashes, or mechanical corrections use Luna/low or Terra/low regardless of the previous scientific turn.

## 5. Quality safeguards

- Model choice cannot change scientific gates or state semantics.
- A lower-tier model may abstain or request independent review; it may not weaken comparators or evidence to finish faster.
- Track quality failures by route. If two comparable assignments fail for the same model-related reason, audit that role and selectively raise one level; do not globally return all sessions to Sol.
- After 20 completed assignments, compare correction rate, wrongful gate reversals, total turns and observed usage before revising this policy.

