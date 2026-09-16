# TOPIC_BRIEF — DEX-DELTA-PARETODP

## Proposal

`PROPOSE_STAGE0` — **Predecessor-aware, profile-compatible DEX data-layout Pareto construction across adjacent official Android versions.**

| Field | Frozen statement |
|---|---|
| Quality | `TIER_B_Q2_VIABLE` conditional structural paper potential; current evidence readiness medium-low. |
| Exact object/function | Non-compact single `classes.dex`, fixed logical class/field/method/proto/code/debug/annotation semantics, accepted by the same stock ART reader/verifier/runtime/reflection contract. |
| N2/N3 | N2: bounded-context exact Pareto DP over ART-legal data-atom ordering, offset regeneration, profile category and predecessor locality. N3: only if an independently held-out official AOSP adjacent-version recurrence law survives specified controls. |
| Atomic action | Choose the next legal movable DEX data atom under fixed index tables and category constraints; regenerate offsets/alignment/checksum. IDs, semantics, reader, APK signing and packaging are not actions. |
| Strongest union | D8/R8 per-version complete action/config union + ART dexlayout/dex writer/verifier + dex2oat/dexpreopt profile/filter/product/module options + ReDex feedback-directed layout + same-information VCDIFF/binary delta. |
| Direct subtractors | ART current profile layout; ReDex feedback-directed layout; standard VCDIFF. Their known action is retained, not misrepresented as absent. |
| Action divergence | Two unchanged equal-category data/code clusters can occupy either legal order; current profile-only ordering lacks predecessor locality, whereas the proposed action depends on the preceding DEX neighborhood while holding all semantic and profile inputs fixed. |
| Algorithm/guarantee | Exact Pareto frontier over the declared bounded patch-block context and ART category partial order; no claim of global unrestricted VCDIFF optimality. |
| Natural carrier | 20–50 hash-pinned adjacent official AOSP tags/build artifacts, stratified by product/module/DEX version. |
| Full cost | Generation CPU/wall/RSS/temp; final DEX and patch bytes; install/package bytes separately; stock verification/open/read/startup CPU/RSS under matched ART configuration. |
| Fidelity plan | Use ART writer, stock reopen/checksum, IR content comparator and a minimal reflective/bytecode oracle before any claim-bearing run. |
| 72h killer | Enumerate source options; prove/refute two legal stock-reader-equivalent placements on tiny official test inputs and two natural pairs; then see whether any union arm replays the predecessor decision. Stop this mechanism on semantic/format drift, custom reader need, or exact union absorption. |

No performance result, natural recurrence, implementation or resource claim is made. Stage 0 must independently validate source pins, observable semantics, action-union completeness, direct collision and the restricted guarantee before any downstream work.
