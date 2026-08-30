# PatchYield repair search log

## Input integrity

- Assignment file read from the frozen control path; its checked SHA256 is
  `888F955547D98D089A5D49CFC292EA3F443458A7C4401DACD38769D496963B5C`.
- The input ZIP SHA256 matched the assignment's frozen value exactly.
- Only the declared `patchyield/` prefix and three declared root package documents
  were read. No archive entry was executed or extracted.

## Static source checks

| Role | Source | What it established | Ceiling |
|---|---|---|---|
| CURRENT runtime flag surface | https://docs.vllm.ai/en/latest/cli/serve/ | Current official serve documentation lists tool parser/plugin and `--download-dir` arguments. | It does not certify frozen vLLM v0.26.0 CLI compatibility; that is a finite Stage-A static gate. |
| CURRENT harness isolation | https://github.com/OpenHands/benchmarks | Official benchmark documentation describes a pinned SDK submodule and isolated benchmark workspaces. | It does not establish performance, model determinism, or a paper result. |

No collision/newness search was performed because the assignment grants only repair
authority and forbids a new RQ or scientific absence inference.
