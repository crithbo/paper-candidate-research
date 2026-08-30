# KNATIVE-DRAIN-CREDIT Source and Collision Audit

## Scope and method

- Cutoff: `2026-08-10`
- Review role: independent Stage 0 PRIMARY
- Upstream: `knative/serving`, tag `knative-v1.23.0`
- Annotated tag target: `7ed4aa2ab601e3a33c6552285f6e0d910747351d`
- Commit date/message: `2026-07-29`, `Replace duplicate intMax helpers with builtin max (#16665)`
- Search status: `SEARCH_BOUNDED_OPEN`
- Retrieval note: terminal Schannel failed, then a scoped Git fetch using Git's OpenSSL backend succeeded. No resource failure was used as scientific evidence.

The audit inspected official source at the frozen tag, official Knative documentation/release metadata, the Microsoft Azure public dataset description, and original/official paper records. No experiment or benchmark was run.

## Frozen source integrity

| File | SHA-256 |
|---|---|
| `pkg/activator/handler/context_handler.go` | `60aa61b106c9cbc8070b57b4eaef3cf26bd0be6995124cd28b81d0a1b8cfc1ca` |
| `pkg/activator/handler/handler.go` | `b783ee4f024fc186a096b41238e1917ff6ae3ca1ba0ab5266ab55168536f3ad7` |
| `pkg/activator/net/throttler.go` | `2aece4050cbb5b5eb27ef3b6390dce31c41202076fb4699208d0cfd6271f9de2` |
| `pkg/queue/sharedmain/handlers.go` | `f68d20a3ef1b6a3141e2edbd6e56cc835b211caae7c23cdc3a7b959498fad33e` |
| `pkg/queue/sharedmain/main.go` | `94b7b2815cc657b7eb4253fdd922534013deac18f0d43b45c2b837104c852443` |
| `pkg/queue/constants.go` | `71dfc038d8866ddfd5529da070a19285fc8d6fc3f018103008cd5874c0f95d1a` |
| `pkg/reconciler/route/resources/ingress.go` | `1abd8af9cf31b2f95f2d11b4c23cafe67805c9893fc312003828fe0aac98e1b4` |
| `pkg/autoscaler/config/config.go` | `efad58f1a33dd8c41e75f1d1e51db796a9d5525dbee257a3d0501c55e719f72f` |
| `config/core/configmaps/autoscaler.yaml` | `03f98b423e7267dc94b78458efe18e89cfe2d7a3c353c5f0b50094f4bffbfad8` |

## Current request-path reality

### 1. Revision assignment precedes Activator

`pkg/reconciler/route/resources/ingress.go` constructs traffic splits and appends `Knative-Serving-Revision` plus namespace headers for the selected Revision. Official Request Flow documentation independently states that routing is decided once per request at the HTTP router and recorded in an internal header.

### 2. Activator is revision-scoped

`pkg/activator/handler/context_handler.go:57-82` extracts the Revision name/namespace, loads that exact Revision, and places its `revID` into the request context. `pkg/activator/handler/handler.go:112-181` calls `throttler.Try(..., revID, ...)` and reverse-proxies to the destination returned for that `revID`. `pkg/activator/net/throttler.go:521-527` retrieves a per-Revision throttler and waits for its capacity.

There is no cross-Revision selection action in this path. Activator can buffer an already assigned request and choose a ready backend for that Revision.

### 3. Queue-Proxy admission and drain are later and pod-local

`pkg/queue/sharedmain/handlers.go:64-90` composes the user-container reverse proxy, concurrency breaker/queue, timeout handlers, hijack tracker and standard drainer. The drainer uses a 30-second quiet period. `pkg/queue/sharedmain/main.go:310-339` enters drain after TERM, waits for non-ready propagation, shuts HTTP servers gracefully, and caps hijacked-connection draining separately. `pkg/queue/constants.go:24-29` defines `/wait-for-drain` to delay user-container termination until accepted requests are processed.

This already implements the legal pod-level contract: stop accepting new work through readiness/drain propagation and continue accepted requests. It does not export an accepted request for migration to another Revision.

### 4. Configurable action surface

The frozen source/defaults expose or parse:

- target burst capacity, including `-1` to retain Activator on path;
- container-concurrency target and target percentage;
- stable and panic windows;
- scale-down delay;
- Revision request, response-start and idle timeouts;
- traffic weights/rollouts;
- readiness/startup/liveness probes;
- Queue-Proxy drain quiet period and hijacked-connection limit; and
- Activator deployment termination grace.

Current metrics document queue depth and invocation duration. These are strong same-information ingredients, not proof of a duration-credit algorithm.

## Atomic-action contradiction

The frozen candidate requires one online decision to admit/release Queue-Proxy work, withdraw Revision routability, and migrate through Activator. Source order is:

`Ingress chooses Revision -> optional Activator queues within that Revision -> Queue-Proxy queues/proxies to user container -> response`.

Therefore:

- rerouting between Revisions belongs before the first arrow;
- Activator queueing occurs after Revision identity is fixed;
- Queue-Proxy admission occurs later still; and
- after a request body or side effect is consumed, transparent replay is not safe for general HTTP.

No first-party source was found that supplies a transaction across these commit points. This is not an “implementation lacks X” novelty claim. It is evidence that the frozen action contract is internally inconsistent.

## Official documentation and release checks

- Release page/tag: https://github.com/knative/serving/releases
- Serving overview: https://knative.dev/docs/serving/
- Request Flow: https://knative.dev/v1.21-docs/serving/request-flow/
- Architecture: https://knative.dev/docs/serving/architecture/
- Load balancing: https://knative.dev/docs/serving/load-balancing/
- Activator capacity: https://knative.dev/docs/serving/load-balancing/activator-capacity/
- Probe configuration: https://knative.dev/docs/serving/services/configure-probing/
- Serving metrics: https://knative.dev/docs/serving/observability/metrics/serving-metrics/
- Long-request drain issue: https://github.com/knative/serving/issues/15649

The issue is useful natural counter-evidence: queue-proxy/app signal handling and termination timing matter. It does not demonstrate cross-Revision request migration.

## Natural carrier audit

Microsoft's official Azure public dataset describes the 2021 trace with anonymized app/function, end timestamp and duration; arrival can be derived. It does not contain:

- Knative Service/Revision identity or transition events;
- ingress traffic split or Revision header;
- Activator/direct path choice;
- pod/backend readiness and termination state;
- Queue-Proxy queue/admission state;
- HTTP method, request body, idempotency or streaming state;
- response status/body commit, retries or duplicate effects; or
- warm-pod/control-plane action ledger.

Source: https://github.com/Azure/AzurePublicDataset

Classification: `NATURAL_ARRIVAL_DURATION_INPUT_ONLY`, not a faithful Knative revision-transition carrier. A new-ID study could replay its timing/duration distribution against a real frozen Knative transition, but must not call the source trace itself evidence of Knative drain behavior.

## Literature and collision audit

### Proactive MPC

“Taming Cold Starts: Proactive Serverless Scheduling with Model Predictive Control” jointly controls OpenWhisk prewarming, dispatch and reclaim using forecasts. It is a direct algorithmic subtractor for joint resource/request control, but differs in platform, future information and drain semantics.

Source: https://arxiv.org/abs/2508.07640

### PREEMPT-FaaS

PREEMPT-FaaS implements fixed-priority preemptive orchestration with a Kubernetes controller and Knative patch, targeting critical-instance orchestration and cold-start latency. It is current and must be cited, but does not cover safe migration of already assigned HTTP requests.

Source: https://doi.org/10.4230/LIPIcs.ECRTS.2026.22

### Harvested resources

The SOSP 2021 work and its Azure trace establish that invocation duration and eviction deadlines form a real serverless scheduling problem. Its object is placement/execution on harvested resources, not Knative revision routing.

Source: https://doi.org/10.1145/3477132.3483580

### Other adjacent work

Dirigent, serverless lifecycle-aware scheduling, cold-start pools, and generic migration/offloading demonstrate broad interest but do not repair the current same-object contradiction. No exact direct paper is claimed absent beyond `SEARCH_BOUNDED_OPEN`.

## Classification summary

| Finding | Classification |
|---|---|
| Native Route/Activator/Queue-Proxy/KPA pipeline | `DIRECT_STRUCTURAL_BASELINE` |
| Current source has duration-credit policy | `NOT_FOUND_IN_BOUNDED_AUDIT` |
| Current source supports atomic cross-Revision migration after assignment | `CONTRADICTED` |
| MPC | `DIRECT_SUBTRACT_DIFFERENT_INFORMATION_AND_PLATFORM` |
| PREEMPT-FaaS | `DIRECT_SUBTRACT_DIFFERENT_ACTION_AND_OBJECTIVE` |
| Azure 2021 trace | `NATURAL_ARRIVAL_DURATION_INPUT_ONLY` |
| Same-object candidate residual | `NONE_UNDER_FROZEN_CONTRACT` |

## Reproducible audit commands

The source check used a shallow sparse checkout at the frozen tag and read-only searches:

```text
git -c http.sslBackend=openssl clone --depth 1 --filter=blob:none --sparse --branch knative-v1.23.0 <official-repository> <temporary-path>
git -C <temporary-path> -c http.sslBackend=openssl sparse-checkout set pkg/queue pkg/activator pkg/autoscaler pkg/reconciler config/core docs
git -C <temporary-path> rev-parse HEAD
rg -n <routing/drain/config symbols> <selected official paths>
Get-FileHash -Algorithm SHA256 <selected source files>
```

The temporary sparse checkout was removed after hashes and findings were recorded. No code was executed and no benchmark was run.

## Audit conclusion

`STOP_SPLIT_COMMIT_POINTS_AND_UNSAFE_REQUEST_MIGRATION` is supported independently of missing implementation or empirical results. The exact source object must be replaced, not revised, to continue.
