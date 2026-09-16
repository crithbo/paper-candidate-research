# QNN-VTCM-HANDOFF — frozen Stage 0 contract

- Status: Stage 0 analysis only; this file does not authorize a device run.
- Object version lock: `onnxruntime-qnn` 2.4.0 / ONNX Runtime >= 1.24.1, validated by the current QNN EP documentation on 2026-08-02; QAIRT 2.48.40 is the documented tested SDK pairing. The exact backend, SoC model, HTP architecture, firmware, and device serial must be recorded before any result is compared.

## Exact object

The object is admission and configuration selection for **two or more concurrently arriving ONNX Runtime QNN-EP HTP sessions executing the same fixed-shape, fully HTP-supported QDQ ONNX model** on one Qualcomm device. A session is a separately created ORT/QNN context, not a layer-wise remapping across heterogeneous accelerators.

The policy observes only a causally available arrival/profile state and, at session creation/admission, selects a documented configuration bundle:

1. native/default HTP context;
2. QNN HTP shared-memory allocator on/off;
3. VTCM reservation `vtcm_mb` (including the documented default/unspecified setting);
4. the current cross-session VTCM backup-buffer-sharing enable bit (`htp_share_resource_optimization=1`, with legacy `enable_vtcm_backup_buffer_sharing` documentation), QAIRT API >= 2.26 and incompatible with `ep.context_embed_mode` in the legacy documentation;
5. spill/fill context-cache buffer on/off; and
6. whether the fixed graph uses the QNN CPU reference backend as a **separate functional/reference run**, or a predeclared ORT CPU EP partition for unsupported graph I/O/operators.

`qnn.perf_mode` and `qnn.rpc_control_latency` may vary per inference only where the current EP documents them as run options. `qnn_context_priority` and `ep.dynamic.workload_type` are documented priority/resource controls, not evidence of a VTCM ownership transfer.

No public API located in this audit exposes an individual, online VTCM lease/release, a per-request spill/fill command, an allocator-residency query, or an arbitrary mid-session HTP-to-CPU migration. The paper object therefore does **not** claim those controls exist. “Handoff” means admission/dispatch to a pre-built, actually compatible configuration/context portfolio, with re-creation/cache and synchronization costs charged, rather than a fabricated in-place transfer primitive. Static spill/fill belongs to portfolio generation, not to a per-arrival action.

## Frozen input and semantic contract

Before Stage A, the researcher must freeze:

- model file, QDQ model hash, context-binary hash if used, fixed input shapes, QNN/ORT/QAIRT commit or package hashes;
- QDQ semantics: input/weight/output signedness, scale and zero point granularity, rounding, saturation/clipping, accumulator and requantization behavior; and
- a natural multi-session arrival trace with immutable `arrival_id`, monotonic arrival time, session ID, request/deadline class, model/context hash, input shape/bytes, and seed.

For the main HTP comparison, all operators must be HTP-supported and `session.disable_cpu_ep_fallback` must be enabled. The CPU backend/reference path is a correctness and separately reported fallback-cost control; it must never silently substitute for a fully HTP result.

## Complete cost ledger and required profile fields

Each run must log configuration bundle and the following timestamps/counters per session and per request where obtainable: host enqueue/start/end; ORT session/context creation; graph compose/finalize; context-cache load/save; input/output setup; HTP execution; CPU partition/reference work; RPC submission/control latency; host-device/shared-buffer copies; synchronization/waits; first-run warmup versus steady state; retry/SSR/recreation; and bytes/latency of every fallback. The QNN CSV/optrace artifact, ORT log, host timing file, configuration file, device/firmware identity, and a hash manifest are required.

The primary metric is arrival-to-result p50/p95/p99 latency under a stated warm/cold convention; secondary metrics are throughput, session-creation delay, bytes copied, CPU time, and failure/recreation rate. Isolation debt is the measured slowdown/deadline harm imposed on other sessions versus the same session set run in the declared default; it is not an unobserved hardware counter.

## Research question and bounded claim

For same-model HTP sessions with a frozen natural arrival trace, can profile-conditioned admission to one of the documented configuration bundles improve tail latency or isolation debt over the strongest same-cost joint baseline, after all preparation, copying, synchronization, warmup, CPU, fallback, and recovery costs are included?

If it succeeds, the claim is limited to the locked model/device/software/trace family and configuration-bundle selection. It is not a claim about Qualcomm’s internal VTCM allocator, a generic NPU scheduler, device energy, or unmeasured hardware speedup.

## Fair baselines

- `DEFAULT`: documented native HTP defaults, one session configuration, no policy.
- `INDIVIDUAL-*`: each available control alone—shared allocator, VTCM backup sharing, spill/fill, each VTCM reservation, and the predeclared CPU reference/fallback condition.
- `JOINT-STATIC`: the strongest feasible fixed bundle, selected by exhaustive sweep on a training/calibration split and held unchanged on the test trace. It must include all mutually compatible controls and obey the backup-sharing/context-embed conflict; a “full union” must never be assumed legal before it is created and tested.
- `MYOPIC-JOINT`: a non-clairvoyant minimum-completion dispatch rule over the same legal portfolio, with the same observable queue/profile state and full ledger but no proposed history/debt term.
- `JOINT-ORACLE`: a trace-clairvoyant finite-bundle oracle with the **same action set, availability times, session-recreation rule, and complete ledger** as the policy. It is an upper bound, not a deployable baseline.
- `PRIORITY-ONLY`: any policy using only documented dynamic `qnn.perf_mode`, RPC latency, and workload/priority controls, without configuration-bundle selection.

The candidate must outperform `JOINT-STATIC` on a held-out trace and demonstrate a configuration reversal attributable to measured preparation/transfer/isolation cost. If `JOINT-STATIC` matches every selected bundle, the residual fails.
