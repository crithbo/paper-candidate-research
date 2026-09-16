# Source24 Discovery Question Cards

These front-end cards are not Stage 0 briefs.  Only cards with every required field are counted as fresh raw.

## QC-01 — AArch64 CCMP / early-if-conversion joint formation

- **Identity:** `AARCH64_CCMP_EARLYIFCVT_JOINT_FORMATION__RIPGREP_15_2_0__LLVM_23_GIT`; lenses `PROBLEM_FIRST`, `COMPOSE_DECOMPOSE_SIMPLIFY`, `NATURAL_OR_CANONICAL_EVIDENCE`.
- **Carrier:** ripgrep release `15.2.0`, published 2026-07-15, public source and release identity. [release](https://github.com/BurntSushi/ripgrep/releases/); `NATURAL`.
- **Problem / insight:** Fixed AArch64 compilation of the release has chains of boolean comparisons and CFG branches.  A possible N2 is joint target-specific formation of CCMP/CCMN/FCCMP chains with adjacent early if-conversion, distinguishable only if their combined flag/CFG legality frontier is outside the current sequential union.
- **Contract:** fixed source, LLVM version, AArch64 ISA/ABI/unwind and observable `rg` behaviour; endpoint is target-native action.  Decision affects compiler code size/branch behaviour.  Full cost includes compile CPU/RSS/temp, bytes, unwind/relocations and program runtime.
- **Evidence / opposition:** current LLVM CCMP source explicitly forms CCMP/CCMN/FCMP to reduce branching/code size and must run immediately before early if-conversion. [source](https://llvm.org/doxygen/AArch64ConditionalCompares_8cpp_source.html)  The current union includes `aarch64-ccmp`, `aarch64-ccmp-limit`, stress path and early-if-conversion composition.  Skeptic: this union may already absorb every legal chain.
- **Falsifier / closure:** a small boolean-diamond MachineIR witness, `-verify-machineinstrs`, object/unwind and behavioural equality; close the current pass interface and enumerate two legal joint choices.  Stop if the choices are already expressible by current pass composition or differ only by pass ordering.
- **Audit:** `COMPLETE`; relation `FRESH`; `FRESH_RAW_OPPORTUNITY`; eligible for C0 `YES`.

## QC-02 — MLPerf GPT-J decode-state placement

- **Identity:** `MLPERF_V5_GPTJ_DECODE_STATE_PLACEMENT`; carrier MLPerf Inference v5.0 (2025), GPT-J/CNN-Daily-Mail scenario. [suite](https://docs.mlcommons.org/inference/index_gh/); `NATURAL`.
- **Problem / contract:** fixed model, quality target and response semantics; potential hardware/software data movement endpoint.
- **Audit:** `INCOMPLETE`; `LOCATOR_ONLY`.  It lacks a non-generic discriminator: the visible action is request batching/KV/cache placement, which is generic scheduling/layout.  No C0.

## QC-03 — SuiteSparse bounded preconditioner construction

- **Identity:** `SUITESPARSE_COLLECTION_BOUNDED_PRECONDITIONER_CONSTRUCTION`; carrier SuiteSparse Matrix Collection, public matrix identity accessed 2026-08-14. [collection](https://suitesparse-collection-website.herokuapp.com/); `NATURAL`.
- **Problem / contract:** fixed matrix/right-hand side/tolerance, residual oracle, analysis+solve+memory full-cost.
- **Audit:** `INCOMPLETE`; `LOCATOR_ONLY`.  No target-specific non-generic construction skeleton remains beyond sparse partition/preconditioner selection.  No C0.

## QC-04 — MLPerf R-GAT feature transfer

- **Identity:** `MLPERF_V5_RGAT_FEATURE_TRANSFER`; carrier MLPerf v5.0, IGBH validation dataset. [suite](https://docs.mlcommons.org/inference/index_gh/); `NATURAL`.
- **Problem / contract:** fixed graph/model/quality labels, transfer bytes and latency.
- **Audit:** `INCOMPLETE`; `LOCATOR_ONLY`.  The candidate is generic graph feature placement/layout, not a target-specific cross-layer action.  No C0.

## QC-05 — MIOpen Find

- **Identity:** `MIOPEN_FIND_CONVOLUTION`; current official Find/database path. [docs](https://rocm.docs.amd.com/projects/MIOpen/en/latest/); `IMPLEMENTATION_CARRIER_ONLY`.
- **Audit:** `INCOMPLETE`; `LOCATOR_ONLY`. Tool feature is not a primary problem origin and output is solution selection.

## QC-06 — Composable Kernel mapping

- **Identity:** `CK_TILE_COORDINATE_MAPPING`; [official docs](https://rocm.docs.amd.com/projects/composable_kernel/en/latest/); `IMPLEMENTATION_CARRIER_ONLY`.
- **Audit:** `INCOMPLETE`; `LOCATOR_ONLY`. Mature backend surface / generic layout; Source20 relation also blocks re-entry.

## QC-07 — OpenVINO NPU compiler selection

- **Identity:** `OPENVINO_NPU_COMPILER_SELECTION`; [official docs](https://docs.openvino.ai/2026/openvino-workflow/running-inference/inference-devices-and-modes/npu-device.html); `IMPLEMENTATION_CARRIER_ONLY`.
- **Audit:** `INCOMPLETE`; `LOCATOR_ONLY`. Driver/plugin and tile configuration are not a primary same-object problem.

## QC-08 — QEMU/Verilator simulation runtime

- **Identity:** active QEMU / stopped Verilator identities.
- **Audit:** `INCOMPLETE`; `EXCLUDED_BEFORE_RAW` due to active/policy-hold and final-STOP filters.
