# QREFINE-TRITON-W4A16 Stage A Report

## 中文摘要

- 结果：`BLOCKED_USER_ACTION_REQUIRED`。预声明合同门没有通过，因此没有启动任何 12-mutant 科学运行。
- 原因：冻结 Triton 3.7.1 没有 Windows wheel；源码所需的精确官方 LLVM 包为 356,721,745 B，超过单文件 128 MiB 事前门槛，也超过 256 MiB 总网络预算。已在下载前停止。
- 证据上限：`RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`。这既不支持 PASS，也不支持 STOP。
- 下一步：主线需在新 resume 目录冻结可执行的精确 Triton/LLVM 双后端环境，或明确扩大 Linux/WSL 资源授权；之后仍须从 PRE_CLAIM gate 继续。

- Lane id: `CANDIDATE-EXECUTION-LANE-1`
- Assignment id: `STAGEA-L1-20260821-QREFINE-TRITON-W4A16-INITIAL`
- Input assignment SHA-256: `561935821E5885261889EE4C59C31ED419AE7EB8DBCA8A35E21FBC002ACB80CB`
- Cross-assignment contamination: `false`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Frozen quality floor: `TIER_B_Q2_VIABLE`; not scientifically reassessed
- Stage semantics: Stage A preclaim resource/fidelity closure only

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED_RESOURCE_BLOCKED`.
- Frozen object: `w4a16_decode_gemv_m1_g128_uint4b8_fp16`, Triton v3.7.1, LLVM `1f126a6d...`, targets sm89/gfx1100, post-`make_llir` and pre-`llvm.to_module`.
- Static boundary audit: the NVIDIA and AMD compiler sources both expose the frozen boundary in the expected order.
- Observer parity: not executed; no structural pre/post hashes, round trip, or identity witness exist.
- Solver identity/replay: not frozen because upstream executable capture is absent.
- Native operation inventory: not materialized; semantic-critical unsupported count is unknown, not zero.
- Strongest baselines: registered, not executed.
- Full-cost units: preregistered for capture, normalization, obligation construction, solver, compiler, proof/counterexample bytes, temp/output bytes, RSS, CPU and wall.
- Claim-bearing run started only after PASS: `false`; no claim-bearing run started at all.

## Resource finding

The official PyPI record contains only manylinux wheels. The source archive was safely acquired and independently showed the exact LLVM pin. The exact official Ubuntu x64 LLVM blob returned `Content-Length: 356721745`. The assignment required escalation before any single download over 134,217,728 B and capped all network response bytes at 268,435,456 B. The file was therefore not downloaded. No system installation, global environment change, build, solver execution, or GPU execution occurred.

Existing hardware includes one sm89 RTX 4070 Laptop GPU, but no executable Triton environment. gfx1100 was not observed. The AMD performance witness remains a later resource issue and cannot reject semantic validation.

## Highest-risk probe result

- Risk-bearing premise: observer fidelity and exact target-local module capture.
- Probe scope completed: frozen-source, tool availability, official package availability, exact LLVM pin and package-size audit.
- Scientific probe: not reached.
- Negative-result meaning: none; resource failure only.
- Positive-result ceiling: not applicable.

## Full-cost and budget audit

- Network response bodies retained: 7,709,169 B.
- Resource files before report packaging: 1,477 files / 29,811,793 logical B.
- Official route attempts: 6, including two sandbox credential failures followed by identical authorized retries.
- Builds, solver calls, mutant runs and GPU kernels: zero.
- Exact CPU/RSS for short metadata and filesystem probes was not provided by the environment and was not estimated.
- Envelope disposition: within limits; stopped before the first escalation boundary.

## Collision and Q1/Q2 review

No existing system was run against the frozen modules, so direct absorption and residual contribution remain undecided. The current union retains Triton verifier/tests, FpSan, pointer-safety verification, Wang-style MLIR translation validation, and verified Triton-operator lifting as mandatory comparators/subtractors. See `CURRENT_COLLISION_AUDIT.md` and `q1_calibration.md`.

## Supported and unsupported claims

Supported only:

- frozen inputs and exact source anchors were localized and hashed;
- the requested boundary exists statically in both Triton target backends;
- the current authorized Windows environment cannot close executable capture within the frozen resource envelope.

Unsupported:

- validator correctness, coverage, composition, mutant rejection, localization, baseline residual, novelty, full-cost advantage, non-scalar performance, Q1/Q2 result strength, PASS, or scientific STOP.

## User-action blocker

- Claim-bearing observation before failure: no.
- Scientific revision consumed: no.
- Immutable failure directory: `stages/stageA/QREFINE-TRITON-W4A16/initial`.
- Resume: new immutable directory only, under a new mainline assignment.
- Detailed action: `USER_BLOCKER_PACKET.md`.
- Stage B authorized: false.
