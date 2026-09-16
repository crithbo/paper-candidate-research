# Question card — S6-CAR-QC01

## Frozen identity

- Exact public identity: `OpenHands/OpenHands@4bf8dd3aaf1217916b2ce8a6f9168fa7633a26f8`; `Qwen/Qwen2.5-Coder-7B-Instruct@c03e6d…`; `SWE-bench_Verified@c104f…`, first 16 ordered test instances.
- Intended object/estimand: the assignment’s paired native terminal outcome difference between I1 and I0 from one complete agent state under shared exogenous randomness.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY` with a fixed canonical benchmark/evaluator boundary.
- Contribution hypothesis: `METHOD_ALGORITHM`, N2, target endpoint = variance/sample-complexity bound for an agent-level coupling.

## Raw-required audit

| Field | Status |
|---|---|
| Exact identity and semantic boundary | Frozen by pre-evidence packet. |
| Native coding-agent policy and state at pinned repository | **Fails**: official README calls this repository Agent Canvas, a control center for multiple backends; it names the OpenHands agent as an external Agent Server/SDK. |
| First native tool-action boundary | **Fails**: no frozen native OpenHands policy is defined by the pinned repository. |
| Same-object branch/copy-isolation action | **Fails**: replacing the pinned repository with the external SDK/backend would change the frozen object. |
| Minimum falsifier | Satisfied: the official README/package/tree establish the mismatch. |
| Finite closure route | Not available without forbidden object replacement. |

## Identity and source check

- Historical preflight: this is a new topic and does not inherit PATCHYIELD/PATCHVALUE status or evidence.
- Direct current source: `README.md` at the exact commit says Agent Canvas can use OpenHands, Claude Code, Codex, Gemini or any ACP-compatible agent, and its architecture points to an external OpenHands Agent Server repository. `package.json` names the package `@openhands/agent-canvas` and describes it as a UI.
- Result: `EXCLUDED_BEFORE_RAW`; no no-match/newness inference is made.

## Disposition

`EXCLUDED_BEFORE_RAW__SAME_OBJECT_STRUCTURALLY_UNCLOSABLE`. The defect is not a missing source, implementation, result, or resource: it is an official-source conflict between the frozen object and the required native-agent semantics. A new assignment could define and freeze a particular Agent Server/agent-policy source, but that would be a new object and is outside this assignment.
