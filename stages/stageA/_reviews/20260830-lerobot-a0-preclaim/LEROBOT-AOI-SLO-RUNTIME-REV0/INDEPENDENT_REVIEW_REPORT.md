# LEROBOT-AOI-SLO-RUNTIME-REV0 — Independent A0 Preclaim Fidelity Gate

## 中文摘要

- Decision: `BOUNDED_A0_ENGINEERING_CORRECTION_REQUIRED__A1_START_REJECTED`。
- no-wire action/provenance semantics 基本完整：origin key、monotonic capture、action contributor sidecar、aggregation provenance 和 fail-closed 条件均已冻结，且不改 wire/policy action values。
- 但 formal universe 只是枚举域定义，缺 exact generator/checker path、hash、producer argv/cwd/env 与 concrete output schema；不能称为 executable formal universe/checker。
- 冻结计划只声明 `valid_claim_rows_planned: 2`，没有绑定两行的稳定 row IDs、input identities 和 per-row argv/schema。
- natural carrier 仅为类型字符串 `actual_same_host_client_server_inference_timing_joined_to_public_canonical_task_outcome`，没有 exact path、hash、producer argv、schema 或可重获来源；它是类型占位，不是 frozen natural evidence carrier。
- strongest joint grid、equal-occupancy key 与 full-cost 维度已列出，但未绑定到两行的 executable producer/consumer DAG 和 output receipts；`validation_only_then_frozen_on_test` 尚未给出 test 前冻结的具体选择 receipt。
- 这是 A0 engineering fidelity 缺口，不是科学负证据，不消费 scientific revision。累计 correction budget 当前为 0/2，可使用一批有界修正。

## Action and no-wire semantics

The provenance sidecar preserves the frozen LeRobot async-inference object and adds no wire identifier. It distinguishes duplicate observation timesteps with the echoed exact wall timestamp, records client monotonic capture time, maps each action timestep to its nonzero origin contributors, and computes conservative execution age from those contributors. Ambiguity, duplicate origin keys, rollback, impossible timesteps, empty contributor sets, and any required wire change fail closed.

This is a semantically complete action/provenance contract, but it is not yet an executable claim packet.

## Formal universe and checker

`SHORT_TRACE_UNIVERSE.yaml` specifies a finite domain over queue length, chunk lengths/start timesteps, duplicate observations, return order, aggregators, empty queue, must-go state, wall-clock jumps, and nondecreasing monotonic order. That is a useful complete domain description.

However, the frozen owner packet does not bind:

- the exact universe generator/checker file path and SHA-256;
- literal producer/checker argv, cwd, environment, timeout and exit contract;
- a concrete input/output schema and manifest for every enumerated case;
- the exact oracle-versus-candidate comparison receipt.

Therefore the universe is specification-complete but not execution-fidelity complete.

## Two-row denominator

The readiness ledger declares two planned rows but does not identify them. A valid Stage A A1 denominator must pre-register exactly two stable rows, recommended as:

1. `FORMAL_SHORT_TRACE_UNIVERSE`: the bounded exhaustive formal family, with exact generator/checker bindings and one family-level receipt;
2. `NATURAL_SAME_HOST_CANONICAL_CARRIER`: one concrete same-host client/server trace joined to one public canonical task outcome, with exact identity and provenance.

Neither row may be substituted, backfilled, filtered, or selected after seeing effects.

## Natural carrier

The current `natural_carrier` field is a semantic type, not an artifact. It lacks an assignment-local or immutable shared-asset path, content hash, source/version, producer command, schema, row count, task/outcome identity, license/provenance, and re-acquisition rule. Consequently the natural row cannot be independently reproduced or audited.

## Baseline fairness and full cost

The static grid and equal-occupancy match key are directionally appropriate and cover queue size, action/chunk parameters, FPS, aggregation mode, offered observation identity, and request budget. The full-cost list includes timing, call/compute/serialization, occupancy, contributor age, aggregation/discard/trim behavior, safety states, task success, precompute/validation/fallback.

Still missing are per-row literal baseline/candidate argv, grid-selection receipt frozen before test, shared-input hashes, producer-consumer paths, output schemas, and fail-closed full-cost receipts. Thus baseline fairness is specified but not executable.

## Sole bounded A0 correction

MAINLINE may freeze one same-object engineering correction batch that:

1. materializes and hashes the formal universe generator, oracle, checker, schema and exact argv/cwd/env;
2. freezes the exact two row IDs and their input/output manifests;
3. installs one concrete natural carrier with exact path/hash/source/schema and producer argv, without running its effect comparison;
4. binds candidate and strongest grid baseline to identical row inputs and equal-occupancy keys;
5. freezes full-cost producer/consumer receipts and a pre-test grid-selection receipt;
6. runs only a nonclaim schema/wiring control under separate MAINLINE authorization, then returns to an independent preclaim gate.

This correction may not change the object, wire protocol, action semantics, claim endpoint, two-row denominator, strong baseline requirement, or full-cost dimensions. It is not a method redesign or scientific revision.

## Final disposition

- A1 start: `REJECTED_PENDING_BOUNDED_A0_CORRECTION`
- Scientific inference: none
- Topic state: remains `STAGEA_ACTIVE`
- Engineering correction batches: `0/2` used before this recommended batch
- Scientific revision: not consumed
- Stage B: not authorized
- User action: none
- Current reset cycle: false

