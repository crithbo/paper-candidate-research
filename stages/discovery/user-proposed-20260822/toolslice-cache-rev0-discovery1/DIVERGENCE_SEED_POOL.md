# ToolSliceCache Rev0 — non-evidence seed portfolio

Assignment: `DISCOVERY-S1-20260822-TOOLSLICE-CACHE-REV0`  
Date: 2026-08-22  
Status: seeds are routing hypotheses only; they are not novelty, feasibility, or paper-quality evidence.

| Seed ID | Non-evidence divergence prompt | Candidate type | Why it was retained for one RQ | Early contrary lens |
|---|---|---|---|---|
| S01 | Two coding-agent branches can have different Git histories yet present the same executable, argv, and locally relevant repository state to one supported tool. | N2 | Suggests a certificate-mediated execute-or-reuse decision with the required same-version SDK object. | A hidden dependency can make a locally observed slice incomplete. |
| S02 | A command-result memo can be keyed by content, environment, or a dependency trace rather than by branch identity. | Comparator seed | Separates a possible semantic certificate from ordinary shell-command memoization. | If this is only a different cache key, it is a generic memoization variant. |
| S03 | A stateful tool cache can require an exact previous history to protect sandbox state. | Collision seed | Tests whether a dependency slice offers a nontrivial alternative to full-history matching. | TVCACHE may already make the relevant distinction, or soundness may require the same history closure. |
| S04 | A hermetic build action can be reused across workspaces when its declared inputs, command and environment match. | Current-union seed | Tests whether the proposed benefit reduces to build caching for the compiler/build subset. | Bazel/Nix may already cover every sound restricted formulation. |

Seed-selection note: S01 was selected because it is the only seed that preserves the assignment’s exact object and endpoint. S02–S04 are deliberately retained as subtractors, not candidate claims. No paper, repository, or attachment fact was used to promote a seed.

