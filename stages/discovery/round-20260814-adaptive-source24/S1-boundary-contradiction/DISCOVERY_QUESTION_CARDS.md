# Discovery question cards

## Q01 — RISC-V ACT / Zama16b

- Exact public identity: `riscv/riscv-arch-test`, current supported snapshot checked 2026-08-14; carrier `NATURAL` self-checking ELF suite.
- Problem/insight: misaligned atomic conformance could expose a compiler–ISA seam; a contribution would require a distinct cross-layer action, not merely an atomic mapping.
- Contract: fixed ACT result under a declared UDB/ISA configuration; proposed `SYSTEM_ARCHITECTURE` N2; formal Sail/checking route and compile/bytes/runtime full cost are identifiable.
- Opposition/current union: Source23 already closed the same ACT/Zama16b carrier and found only ordinary atomic lowering.
- Required-field audit: `COMPLETE`; relation `CONTAINED`; disposition `EXCLUDED_BEFORE_RAW`; C0 eligible `NO`.

## Q02 — Embench / Zilsd

- Exact public identity: `embench/embench-iot` tag `embench-1.0`, carrier `NATURAL` embedded-C workload.
- Problem/insight: load/store-pair selection may affect fixed embedded program code size/performance; a contribution would need a target-specific joint action beyond normal ISel/RA.
- Contract: same C result, assembly oracle, bounded bytes/compile/runtime cost and finite witness exist.
- Opposition/current union: Source23 already screened the identical Embench/Zilsd family as generic form selection.
- Required-field audit: `COMPLETE`; relation `CONTAINED`; disposition `EXCLUDED_BEFORE_RAW`; C0 eligible `NO`.

## Q03 — ONNX Model Zoo artifact

- Exact public identity: `onnx/models` repository snapshot checked 2026-08-14; carrier `NATURAL` serialized ONNX model plus test tensors.
- Problem/insight: cross-runtime artifact semantics could matter; any contribution must preserve exact model results and avoid runtime-plan selection.
- Opposition/current union: Source23 recorded the same repository’s LFS retirement and unresolved exact carrier continuation.
- Required-field audit: `COMPLETE`; relation `CONTAINED`; disposition `EXCLUDED_BEFORE_RAW`; C0 eligible `NO`.

## Q04 — OpenCL device enqueue conformance

- Exact public identity: Khronos OpenCL C device-enqueue feature clauses, snapshot checked 2026-08-14; candidate carrier intended as OpenCL CTS but no exact public CTS version/date was frozen in the bounded source set.
- Problem/insight: parent/child command completion is a same-object semantic boundary; it would require a non-generic action/estimand beyond queue scheduling.
- Current union/subtractor: OpenCL C defines prerequisite feature macros and device-enqueue semantics; current runtime/source union and exact CTS release are not yet frozen.
- Required-field audit: `INCOMPLETE` (exact carrier version, full union, non-generic discriminator and finite closure missing); relation `FRESH`; disposition `LOCATOR_ONLY`; C0 eligible `NO`.

All cards pass the network-security exclusion. No scoring changes a card disposition.
