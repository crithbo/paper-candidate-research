# Discovery log — S2 verification-dominant bottleneck transfer breadth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE206-VERIFICATION-DOMINANT-BOTTLENECK-TRANSFER-BREADTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. The dispatch hashes matched disk: plan `08A2A5855112635FD009EACA933266F39CF9F47107C1516B0FDCEF1FE4A9F7D9`, registry `AE95989897A02C9213E9FC72C414D6AD660E458AD50F33E1BDB14DDB9B1F6F40`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Six unique families and falsifiable transfer plans

| Family / exact object | Producer + stock verifier union | Natural corpus and acquisition plan for claimed transfer | Same-object witness / 72h killer | Decision |
|---|---|---|---|---|
| Core WebAssembly module with fixed imports/exports/features and observable execution | current toolchain emits sections; spec validation, WABT `wasm-validate`, feature flags and Binaryen repair/emit paths | Pin a WebAssembly/spec or WABT version and a versioned module corpus; separately charge compile/emit, parse/validate, load/readback, bytes, CPU/RSS/temp. No before/after profile was acquired. | Need two valid binaries with identical semantics/features and a new globally coupled section/index constructor outside emit/feature union; fail if it is stripping, feature flag, repair pass or changes validation. | `NOT_ADMITTED_UNFROZEN` |
| JVM classfile with fixed bytecode/class-loading semantics | `javac`/classfile writer, `StackMapTable`, format checking and JVM type verification; all classfile/attribute choices | Pin OpenJDK and a versioned JDK or Maven class corpus; compare compile/frame generation, class load/verify/read, bytes, CPU/RSS/temp. | Need a new whole frame/constant-pool constructor preserving JVM loading/type-verification, not a compiler option. Fail on existing writer expression or altered class semantics. | `NOT_ADMITTED_UNFROZEN` |
| LLVM IR bitcode module with fixed IR semantics | IR parser automatically verifies; optimizer verifies before bitcode output; bitstream/abbreviation/wrapper writer paths | Pin llvm-project source/release and LLVM test-suite revision; charge optimize/write, parse/verify/read, bytes, CPU/RSS/temp. | Candidate must jointly choose a bitcode representation/verification structure outside writer/abbreviation/pass union. Current evidence does not freeze such an action. | `NOT_ADMITTED_UNFROZEN` |
| SPIR-V binary module with fixed execution environment and validation result | SPIR-V Tools binary parser/validator/optimizer and official environment rules | Pin SPIR-V Tools and a Khronos test/corpus revision; charge producer/optimizer, `spirv-val`, load/readback and all byte/RSS/temp terms. | Two stock-validator-equivalent modules must differ through a complete constructor, not validator parallelism, optimization flag or changed target environment. | `NOT_ADMITTED_UNFROZEN` |
| WebAssembly component binary with fixed component interface and instantiated behavior | component encoder/decoder plus core/component up-front validation/type equality rules | Pin component-model source and versioned component test artifacts; split encode, decode/type validation, instantiate/readback, bytes/CPU/RSS/temp. | Need an interface-preserving cross-section constructor outside current encoding union; generic repack or a changed component interface fails. | `NOT_ADMITTED_UNFROZEN` |
| Protobuf generated message wire object with fixed schema/value semantics | `protoc` generated producer, `Message` serialize/parse union, wire parser and schema compatibility choices | Pin protobuf release plus a versioned public API/message corpus; split serialization, parse/required semantic check, readback, bytes/CPU/RSS/temp. | Need a stock-parser-equivalent whole constructor beyond field ordering/known serialization choices; a cache, sampling verifier or postprocessor fails. | `NOT_ADMITTED_UNFROZEN` |

All six are distinct from prior proof/certificate, JAR and checksum families. The required “validation becomes dominant after generation acceleration” is a hypothesis with a concrete acquisition plan, not an observed fact. It was not asserted without a versioned profile/trace.

## Candidate-grade deep reviews

### D1 — Core WebAssembly

The [WebAssembly specification repository](https://github.com/WebAssembly/spec) is the official reference interpreter/test-suite source; [WABT](https://github.com/WebAssembly/wabt) exposes native assemble, parse and `wasm-validate` operations with proposal flags, and [Binaryen](https://github.com/WebAssembly/binaryen) performs validation repair during its pass pipeline. Thus the current union includes producer emission, section representation, validation and feature-selection surfaces. A residual cannot be inferred merely because one producer writes an inefficient module.

Exact contract: fixed core-module behavior, imports/exports, enabled proposals, validation acceptance and stock interpreter observations. A legal N2 must construct two stock-valid, behaviorally equal modules where a new coupled section/layout action is neither feature selection, stripping, repair, cache nor external postprocess. Neither a source-pinned whole producer union nor that minimal action witness closes; no brief is admitted.

### D2 — JVM classfile verification metadata

The current [JVMS class-file specification](https://docs.oracle.com/en/java/javase/26/docs/specs/jvms/jvms-4.html) distinguishes format checking from bytecode verification and defines `StackMapTable` as an input to verification by type checking. Current JDK APIs also document automatic stack-map generation and an advanced user-supplied stack-map option. This is contrary evidence against an absence claim.

Exact contract: bytecode, class linkage/loading behavior, verification outcome, and observable execution are fixed. The likely “joint StackMapTable constructor” is not yet an action gap: compiler/classfile writer generation and the explicit stack-map facility may already express it, while alternate frames can alter semantics or verification behavior. A finite killer is source pin + small multi-basic-block natural classes + stock JVM load/type oracle + all compile/load/verify/bytes/RSS/temp terms; stop if the action is current-writer expressible or contract-changing. `NOT_ADMITTED_UNFROZEN`.

### D3 — LLVM bitcode validation

The [LLVM language reference](https://llvm.org/docs/LangRef.html) states that its verifier is run by the parser and before optimizer bitcode output; the [bitcode format](https://llvm.org/docs/BitCodeFormat.html) documents bitstream encodings and abbreviations. Hence “make verification dominant” does not identify an action gap. Exact contract is an LLVM module with fixed IR semantics and stock parser/verifier result. A different encoding that leverages current abbreviation/wrapper choices is already in the writer union; a pass that changes IR is a changed object. No source-level union-external complete constructor is frozen.

### D4 — SPIR-V module validation

The [SPIR-V Tools upstream](https://github.com/KhronosGroup/SPIRV-Tools) publishes parse and optimizer APIs; target-environment selection and optimizer passes are current action surfaces. Exact contract is a fixed module behavior, declared execution environment and stock validation result. Any actionable candidate must jointly construct a different binary representation while preserving the environment and validation, not merely select an optimizer/validator option or add a parallel checker. That witness, a source pin and a versioned natural mutation corpus did not close.

## Full-cost and fidelity closure rule

For each rescreen, first pin producer/verifier commits, defaults and non-default flags, then obtain a public versioned corpus whose adjacent revisions document the putative generation-to-validation transfer. The finite two-output witness must pass the native verifier and same-observable readback. The complete denominator is producer/construct + validation + readback, CPU, wall time, RSS, output bytes, temporary storage and any required materialization. Within 72 hours, fail closed on a missing trace, current-union expression, wrapper/controller dependence, changed guarantee, validation mismatch, or no full-cost residual. No run, benchmark, download or automation occurred here.

## Outcome

`PROPOSE_STAGE0: []`; all six are `NOT_ADMITTED_UNFROZEN`. This conclusion does not rely on implementation absence, missing results, resource availability, hardware, or AI readiness. No Stage0/A/B, shared-control edit or experiment occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
