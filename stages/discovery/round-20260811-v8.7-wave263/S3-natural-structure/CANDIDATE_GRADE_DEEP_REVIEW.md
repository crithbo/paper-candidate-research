# Candidate-grade deep review — Android DEX version-aware layout and delta

## Exact object, semantics and oracle

The object is one ordinary (non-compact, non-container) `classes.dex` per adjacent official AOSP build/version, with fixed logical classes, fields, methods, prototypes, instruction streams, try/catch tables, annotations, debug-info meanings, and permitted reference regeneration. The same ART/DexFile reader, verifier, runtime and reflection behavior are required. The oracle is: stock `DexFile` open with checksum verification; stock verifier/runtime execution/reflection where applicable; and ART’s existing output IR comparison, which compares data content while deliberately ignoring layout offsets. APK signing is outside the object: the candidate consumes/emits the extracted DEX and must be re-integrated/re-signed only as deployment packaging, never compared as an unchanged APK byte object.

## Legal-action boundary

| Component | Fixed / observable constraint | Candidate action? | Reason |
|---|---|---:|---|
| string/type/proto/field/method identity tables | Their index values are consumed by DEX references and format ordering constraints; all referenced indices must preserve the original logical identity. | No | Reindexing changes encoded references throughout code/metadata and is not treated as an independent free layout atom. |
| class-def table | Class identity and prescribed class-index relation are fixed. | No | The proposal does not alter class definition identity/order constraints. |
| string-data, type-lists, annotations, encoded arrays | Alignment and offset references must be regenerated; contents and iteration semantics fixed. | Yes, within verified legal placement | Offset-addressed data atoms may move only if all references and alignment are regenerated and stock semantics match. |
| class-data and code-items | Methods, debug/try metadata and instruction meaning fixed; code/data offsets and alignment regenerated. | Yes, within verified legal placement | ART’s dexlayout already rewrites this area. Candidate retains all existing legality actions. |
| checksum/signature/header offsets | Recomputed from emitted DEX. | Derived only | They are integrity fields, not optimization variables. |
| compact DEX / container DEX | Excluded from first contract. | No | ART source notes the verifier path cannot handle compact DEX, while DEX 041 container semantics add sharing. Mixing them would change the oracle. |

## Current-upstream reality and strongest union

Pinned current references must use the commit immediately before Stage A; the Discovery record is source-pinned to `platform/art` current `dexlayout` tree and `platform/external/r8` current main tree as retrieved by 2026-08-11. ART source shows the concrete writer paths and `DexWriter::Output`; D8 converts Java bytecode to DEX, and R8 produces optimized DEX. Required union:

1. current D8/R8 per-version production actions and all applicable minification/shrinking/keep/profile inputs;
2. ART `dexlayout` profile layout, writer, verification and output settings, including output-directory, profile input, checksum behavior, verification and compact-DEX modes;
3. ART `dex2oat`/dexpreopt filters and product/module flags: `verify`, `speed`, `speed-profile`, `WITH_DEXPREOPT`, `PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER`, `PRODUCT_DEX_PREOPT_DEFAULT_FLAGS`, `PRODUCT_DEX_PREOPT_MODULE_CONFIGS`, and `LOCAL_DEX_PREOPT`/`nostripping`;
4. same-information standard VCDIFF/binary patch generation between current and predecessor DEX; and
5. ReDex feedback-directed class layout as a direct same-object subtractor, where its profile and allowed transformation settings can be pinned.

Counterevidence is preserved: dexlayout performs profile-derived category sorting for strings, class-data and code; ART has profile-driven startup optimization; ReDex already offers feedback-directed layout. None of these facts proves the absence of a predecessor-aware tradeoff constructor, but no claim that current tools lack ordinary layout action is made.

## Complete N2/N3 mechanism and static two-version witness

### Constructor

For a fixed predecessor DEX `P`, current logical DEX `C`, current profile-category constraints and a finite set of verified movable data atoms, construct a **DEX-Delta Pareto DP**. Its state is `(current category frontier, alignment residue, live offset-reference class, predecessor-neighborhood suffix, bounded patch-block context)`; transitions select a legal next atom and regenerate all DEX offsets. It preserves native layout actions but jointly chooses (a) profile-compatible placement and (b) predecessor locality. It returns the nondominated frontier on `(current DEX bytes, VCDIFF/binary-delta bytes, declared profile locality penalty)`. For a fixed bounded patch-block context and the declared ART category partial order, the DP is exact over the enumerated legal placements; it makes no optimality claim for unrestricted VCDIFF.

This is target-specific rather than generic packing: legality depends on DEX alignment, offset regeneration, data/reference types, profile-category ordering and the stock ART oracle. `N3` is conditional: across hash-pinned held-out transitions, measure whether predecessor-neighborhood ties recur after controlling for changed logical atoms, profile category, DEX version and module/product. No stable law or performance gain is claimed yet.

### Minimal controlled action-divergence witness

Take two adjacent DEX logical graphs with two unchanged, equal-profile-category code/data clusters `a,b`, each legal after either other and with regenerated references. Current per-version profile sorting has no predecessor coordinate and may choose its deterministic local/tie order. The proposed constructor can choose `a,b` when `P` stores `a,b` contiguously, and `b,a` when it stores `b,a`; both output DEXes are stock-reader-equivalent and profile-category-equivalent, but their predecessor delta streams differ. This witness is controlled: no ID reindexing, class/method semantic change, custom reader, APK identity claim or external cache is used.

## Collision, quality and admission

The direct literature/source collision set is profile-guided DEX/class layout (ART dexlayout and Meta ReDex), plus general mobile function layout work. They cover per-version feedback/profile ordering, not the frozen predecessor-aware final-layout-plus-delta Pareto objective. Stage 0 must independently verify this as the relevant same-object distinction and pin all R8/dexlayout flags. Conditional structural potential is `TIER_B_Q2_VIABLE`: a finite target-specific exact bounded-context algorithm, a natural repeated-transition claim if it survives holdout, and full-cost comparison form a credible Q2 shape; no Q1 claim is made.

Current evidence readiness is **medium-low**: source-level legal output, reader re-open and layout-insensitive IR oracle are present; the natural carrier hash list, complete command/config union, direct-paper audit and any measured law are not yet closed. This is not a scientific negative.

## Full cost, fidelity closure and 72-hour killer

- **Natural carrier.** Freeze 20–50 adjacent official AOSP release tags/build fingerprints, product/module configuration, DEX version, artifact URL and SHA-256. Stratify by module/product and do not compare incompatible DEX versions.
- **Full cost.** D8/R8/layout generator CPU, wall time, peak RSS, temp/disk; final DEX bytes; patch bytes; install/APK integration bytes; stock verify/open/read CPU/RSS; and cold/startup cost under the same ART compiler-filter/product configuration. Re-signing/package compression is reported separately and is never treated as a DEX-layout win.
- **Fidelity closure plan.** First implement only the atom catalog and offset regeneration through ART’s writer path; verify with the stock reopen/checksum path plus IR semantic comparison and one minimal reflective/bytecode witness. Then reproduce every native union arm using the same `P,C` and profile inputs.
- **72h killer.** On two tiny official ART test DEX inputs and then two hash-pinned adjacent natural artifacts: (1) prove or refute the two legal placements using stock reader/verifier and IR oracle; (2) enumerate source-exposed dexlayout/D8/R8/dex2oat flags; (3) show whether a native union arm can replay the chosen predecessor-dependent decision. **Stop/withdraw this narrow proposal** if legality requires an index/observable-semantic change, compact/container representation, custom reader, or any complete native union arm exactly reproduces the constructor; **hold N3** if the controlled recurrence fails. No task is authorized or run here.
