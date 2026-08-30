# DEX-DELTA-PARETODP Source and Current-Reality Audit

- Assignment: `STAGE0-P2-20260811-DEX-DELTA-PARETODP-PRIMARY-V8.7`
- Cutoff: `2026-08-11`
- Scope: first-party official documentation/source plus primary papers/author manuscripts; static inspection only.
- Execution status: no candidate implementation, experiment, benchmark, corpus download, or StageA/B work was performed.
- Latest-collision status: `SEARCH_BOUNDED_OPEN`; transport/search gaps never imply absence.

## Provenance and mechanical checks

The frozen Discovery handoff and manifest matched the assignment hashes. All six manifest entries recomputed successfully. Frozen controls matched at assignment start. Shared `plan.md` and `registry.yaml` later advanced under mainline ownership; this review did not reread or import the newer contents.

## Current upstream reality

| Component | Frozen/current observation | Relevant action or boundary | Audit disposition |
|---|---|---|---|
| ART Android 17 | [`android-17.0.0_r1` root](https://android.googlesource.com/platform/art/+/refs/tags/android-17.0.0_r1/) shows tree `539d87e9b7c4b00b7f1443cca44578c5b9f6e5b2`; upstream tag/commit metadata recorded as tag `fc31298bb626c4b5d53ae3b715c42a2daa802c08`, peeled commit `b753cf97923c3695338d21466fa14c57b480a59a`. | Root contains `dex2oat`, `dexdump`, `dexlist`, `dexoptanalyzer`, reader/runtime libraries, but no `dexlayout/`. | Discovery's link to a “current dexlayout tree” is contradicted. Do not use historical ART layout as a current union arm. |
| ART main | [Root tree](https://android.googlesource.com/platform/art/+/refs/heads/main/) `688a2326403cce6ce83425b218e3553f2c0ca12e`. | Also has no `dexlayout/` directory in the displayed current root. | Confirms the current-tree correction at the inspected cutoff; exact removal history was not inferred. |
| Historical ART `dexlayout` | [Historical header/source](https://android.googlesource.com/platform/art/+/93c28ed5e8/dexlayout/dexlayout.h) and [driver](https://android.googlesource.com/platform/art/+/47ad376/dexlayout/dexlayout_main.cc). | Profile-driven class-data/code/string layout, writer output, checksum update, IR-level verification; class-def reordering disabled in inspected revision. | Valuable historical direct subtractor and oracle design; version-dependent and not current-native. |
| R8/D8 current | [R8 main root](https://r8.googlesource.com/r8/+/refs/heads/main/) tree `f5105b3a1a0af3951439b2a81de9a6eb80f37e66`; README states D8 dexes class files and R8 performs shrinking/minification/optimization. | Producer transformations may change the logical object. Layout review must freeze the post-producer logical DEX IR or use a nontransforming arm. | D8/R8 “all configs” are not automatically same-object actions. Revision must pin a commit and separate producer transforms from layout. |
| R8 mixed-section writer | [`MixedSectionLayoutStrategy`](https://r8.googlesource.com/r8.git/+/9f0345d080a1bd552d6af0cf9eea0cb8ed8b4bae/src/main/java/com/android/tools/r8/dex/MixedSectionLayoutStrategy.java) and [`StartupMixedSectionLayoutStrategy`](https://r8.googlesource.com/r8/+/2346f2d6f9c170defb3802a9426935512e8acd05/src/main/java/com/android/tools/r8/dex/StartupMixedSectionLayoutStrategy.java). | Current source chooses default or startup layout and exposes orders for annotations/directories/sets/ref lists, class data, code, encoded arrays, string data and type lists. Startup items are collected first and default layout fills the remainder. | Material current same-object/direct-subtract action omitted by Discovery's treatment. Candidate must map plans to these writer collections and beat the complete startup/default union. |
| R8 startup controls | [`StartupOptions`](https://r8.googlesource.com/r8/+/6266e4b502a5a0a42d7e5176fbb7001306e46573/src/main/java/com/android/tools/r8/profile/startup/StartupOptions.java). | Startup layout optimization defaults on; mixed-section layout uses `com.android.tools.r8.startup.layout`, default true, plus startup-profile providers/API. | Finite current configuration/action catalog must be enumerated in the revision. |
| DEX format | [AOSP DEX format](https://source.android.com/docs/core/runtime/dex-format). | ID tables and annotation elements have mandated sorting; class definitions have superclass/interface precedence; mixed data items carry alignment/padding; header checksum/signature cover bytes; v041 container semantics differ. | Supports legal layout sensitivity while sharply limiting actions. Container DEX remains excluded. |
| ART compilation/deployment | [Configure ART](https://source.android.com/docs/core/runtime/configure) and [ART Service configuration](https://source.android.com/docs/core/runtime/configure/art-service). | `verify`, `speed`, `speed-profile`, dexpreopt and dex2oat govern verification/AOT/profile deployment and costs. | These are matched deployment/full-cost controls, not actions that choose bytes in an already emitted ordinary `classes.dex`. |
| ReDex | [Current repository](https://github.com/facebook/redex), [first-party FDO layout report](https://engineering.fb.com/2016/04/12/android/open-sourcing-redex-making-android-apps-smaller-and-faster/), and [2025 Interdex/R8 comparison](https://engineering.fb.com/2025/10/01/android/accelerating-our-android-apps-with-baseline-profiles/). | ReDex reads/writes DEX and InterDex ordering places startup classes first; many other passes rewrite/minify/remove content. | Include only a pinned same-object layout subset. Other passes are end-to-end producer controls, not legal layout moves. |

## Same-object audit

The exact object is viable if the revision freezes a logical current-version DEX IR before physical layout. The equality oracle must compare all indexed items, class definitions, code/debug/annotation/static-value content, aliasing/dedup identities required by the writer contract, and stock ART verification/reader behavior. Header offsets, padding, map positions, signature and checksum are intentionally allowed to differ because they are physical consequences of layout.

The following are same-object failures for this ID:

- R8 shrinking, minification, optimization, desugaring or repartitioning that changes the frozen IR;
- ReDex inlining, dead-code elimination, metadata removal, renaming or multidex movement;
- DEX v041 container sharing, compact DEX, custom loader, external decompression semantics, or an APK-signing identity claim;
- input-source reordering presented as a DEX writer algorithm without holding the emitted logical IR fixed.

## Action catalog audit

`A_emit` must be based on the pinned R8 writer's mixed-section collections. Each item family needs a legality and dependency rule. At minimum, the certificate must cover fixed indexed tables, mandatory sorted substructures, class-definition precedence, item identity/dedup, offset-reference dependencies, alignment residues, code/debug and annotation references, map construction, checksum/signature regeneration, and deterministic tie behavior.

R8's current startup strategy is already a joint mixed-section policy. Therefore a witness that merely moves startup-related code/class data/strings ahead of cold data is absorbed. A residual witness needs equal current-policy status but different predecessor-aware placement, or a richer legal interaction the complete current grid cannot express.

## Delta-state audit

[RFC 3284](https://www.rfc-editor.org/info/rfc3284/) defines target windows, source/target copy windows, ADD/RUN/COPY instructions, address caches and optional secondary compression, but deliberately leaves encoder window and match selection algorithms open. Consequently “VCDIFF” is not a unique cost function.

A short predecessor-neighborhood suffix does not by itself determine exact patch cost. For xdelta3 or another implementation, future cost may depend on source-window choice, target-window history, match/hash tables, near/same address caches, instruction merging, secondary-compressor state, checksums and deterministic tie-breaking. The revision may bound the window/context and retain the exact encoder machine state, but must prove that any state merge preserves every future action and final byte cost. Merely calling the context bounded or keeping the last `w` target bytes is insufficient.

## Primary-paper collision audit

| Work | Primary contribution | Relationship to candidate | Required response |
|---|---|---|---|
| [Courgette design/source](https://new.chromium.org/developers/design-documents/software-updates-courgette/) | Executable-aware disassembly, symbolic address adjustment and reassembly before binary differencing. | Establishes predecessor-aware executable transformation; different executable format and no DEX writer action theorem. | Methodological adjacent; do not claim the general idea. |
| [R2, IEEE TC 2013](https://citeseerx.ist.psu.edu/document?doi=448601da82b7d52d6b7a6c184fd274fe0c579e1b&repid=rep1&type=pdf) and R3/TOSN genealogy | Relocatable/similarity-preserving executable construction and optimized differencing for embedded reprogramming. | Closest conceptual antecedent for constructing binaries to reduce update cost; different runtime/format/action grammar. | Strong genealogy/boundary anchor; DEX-specific theorem and current writer integration are mandatory. |
| [Hoag et al., LCTES 2023](https://arxiv.org/abs/2211.09285) | Principled mobile function-layout objective and balanced-partitioning algorithm evaluated in LLVM. | Strong algorithm/contribution-shape comparator; focuses compressed size/startup, not adjacent-version DEX delta. | Comparator and methodological adjacent. |
| [Jin et al., INFOCOM 2024](https://suntong30.github.io/assets/pdf/INFOCOM24_MDiffPatch.pdf) | Full/partial decoded similarity spaces and tunable compression/recompression tradeoff for mobile updates. | Strong current deployment comparator; operates on patch preparation rather than DEX layout. | Include in patcher/full-cost union when artifact permits. |
| [Sun et al., IEEE TMC 2024](https://www.emnets.cn/en/publication/tmc-ota/) | Systematic comparison of xdelta3, bsdiff, archive-patcher, HDiffPatch on 200 apps and `sdiff`. | Establishes current mobile patcher set and five-metric evaluation bar. | Patch bytes under VCDIFF alone cannot support a broad mobile-update claim. |
| [Google archive-patcher](https://github.com/google/archive-patcher) and [Google Play file-by-file update description](https://android-developers.googleblog.com/2016/12/saving-data-reducing-the-size-of-app-updates-by-65-percent.html) | Decompress-before-differencing with exact recompression and deployment cost tradeoff. | Strong packaging pipeline; outside the single DEX object but essential full-cost comparator. | Report package layer separately and preserve identical information. |

Bounded queries also covered DEX layout/delta/update terms in ACM, IEEE, USENIX and arXiv indexes, plus current AOSP/R8/ReDex sources. No inspected primary paper directly completed the candidate's exact conjunction. This remains open because a bounded search cannot prove nonexistence.

## Strongest-union correction

Discovery union:

`D8/R8 + current ART dexlayout + dex2oat/dexpreopt + ReDex + VCDIFF`

Correct typed union for the revision:

- `EMIT_CURRENT`: pinned R8 default layout, startup-profile/mixed-section layout and every relevant current writer control/hook that preserves frozen IR;
- `EMIT_EXTERNAL`: pinned ReDex InterDex/FDO same-object layout subset;
- `PATCH_CURRENT`: pinned xdelta3, bsdiff, archive-patcher, HDiffPatch, plus reproducible `sdiff`/`MDiffPatch` artifacts when available;
- `DEPLOY_COST`: matched ART Service/dex2oat/dexpreopt compiler filters and device configuration;
- `HISTORICAL_ORACLE`: old ART `dexlayout`, excluded from claims about current native availability.

This union is finite once versions, public/internal hooks, and a prespecified configuration grid are frozen. It cannot be replaced by an unconstrained oracle.

## Static witness status

Discovery's two-cluster witness proves only that two abstract orders can be imagined. It does not yet prove:

- that both orders are accepted by the same pinned current writer grammar;
- that all offset/alignment/map/checksum consequences have been included;
- that stock ART observes the same logical object;
- that the complete current R8/ReDex union cannot produce both decisions; or
- that a pinned differencer emits unequal patch bytes.

Stage0 does not require a run. It does require the revision to supply a byte-mechanical, native-realizable static certificate. The witness ceiling remains `ACTION_DIVERGENCE_ONLY` even if it closes.

## Natural and full-cost route

A natural pair is not “two tags” in the abstract. It must pin product/module, build target, source revisions, toolchain/R8 commit, minimum API, DEX version, profile input, build flags, artifact hashes and extraction path. If APK/JAR packaging is rebuilt, package recompression and signing are separate measured layers and no identity claim is made.

The finite StageA route is:

1. one tiny official R8/ART test object for exhaustive writer/DP equivalence;
2. two adjacent natural ordinary-DEX module pairs with reproducible provenance;
3. current R8 default/startup grid and ReDex same-object replay;
4. pinned xdelta3 trace for the exact theorem plus the strongest available mobile patcher portfolio for killer comparisons;
5. planner/writer/patch/reconstruct/verify/open and package/deployment cost ledger.

No implementation or positive result is required by this audit. If the static certificate closes, StageA remains finite. If it fails, the candidate is structurally below Q2 rather than merely unready.

## Transport integrity note

A read-only `git ls-remote` attempt against R8, ART and ReDex failed with `SEC_E_NO_CREDENTIALS` in the local Windows transport. Official Gitiles/GitHub web records remained available. No repository absence, commit absence, or source conclusion is inferred from the transport failure.
