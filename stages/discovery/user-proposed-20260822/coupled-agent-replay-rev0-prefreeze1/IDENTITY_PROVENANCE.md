# Identity provenance — blocked pre-evidence run

This file records only the frozen official identity route and mechanical transport outcomes. It contains no collision, novelty, baseline, agent-replay, CAR, coupled-generation, counterfactual-generation, PATCHYIELD, or PATCHVALUE material.

## Contract

- Assignment: `DISCOVERY-S3-20260822-COUPLED-AGENT-REPLAY-PREFREEZE1`
- Assignment SHA-256: `64CDB19D7DC54341C65A64431AB1D69FB47B984F63B3BE676C9A43A5579F54E1`
- Required first route: `https://api.github.com/repos/OpenHands/OpenHands/git/ref/heads/main`
- Invocation order: OpenHands ref first; model and dataset routes are prohibited until the first exact identity is resolved.

## Attempt ledger

| Attempt | Route | Transport | Outcome | Response persisted |
| --- | --- | --- | --- | --- |
| 1 | exact official OpenHands GitHub API ref URL | process-local PowerShell `Invoke-WebRequest`, in-memory only | authentication layer rejected request (`Authentication failed`) | no; zero response bytes available |
| 2 | exact official OpenHands GitHub API ref URL | Codex in-app browser, read-only direct navigation | browser transport returned `net::ERR_BLOCKED_BY_CLIENT` | no; zero response bytes available |

The browser/web safe-URL rejection occurred before a request was issued and is telemetry, not an additional official identity retrieval attempt. No alternative project, branch, mirror, source archive, or search result was used.

## Fail-closed boundary

The OpenHands ref response did not become available, so its commit SHA and tree SHA could not be frozen. Phase order therefore prevents the Qwen and SWE-bench metadata routes and prevents sorting or filtering task IDs. No model weights, source archives, containers, task images, dataset payloads, agent/model execution, build, benchmark, or evaluator were accessed.

Disposition: `RESOURCE_BLOCKED_IDENTITY_FREEZE__NO_SCIENTIFIC_INFERENCE`.
