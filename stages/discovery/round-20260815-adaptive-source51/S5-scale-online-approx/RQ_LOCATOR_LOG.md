# Source51 canonical RQ and locator log

Registry identity surface consulted: `registry.yaml`, SHA256 `D61094A4CF7CE4189B11B8066976246ADF91CABF02D3C088C5A488161706C1B7`, read 2026-08-15. A `NO_MATCH` below means only no five-field hit in that surface; it is not a novelty or absence claim. Related compiler/EDA/tool families did not trigger exclusion.

## RQ51-01 — OpenROAD ECO detailed placement

- Same-object RQ variants pre-evidence: (A) exact bounded-recourse legalizer after resizing/buffer insertion; (B) exact local/global constructor with a displacement guarantee; (C) characterize whether the stock incremental path has an unbounded rewrite cliff. The merged RQ was: *for fixed OpenDB/DEF, placement legality rules, and post-ECO instances, is there a target-native online constructor with a new bounded-recourse guarantee outside the current detailed-placement action union?*
- Exact public identity: OpenROAD `dpl` detailed placement documentation and current `OpenROAD-flow-scripts` `global_route.tcl`, retrieved 2026-08-15; carrier would be a versioned public OpenROAD-flow-scripts design/DEF ECO trace.
- Five-field preflight: object `NONE`; action `RELATED_ONLY`; endpoint `RELATED_ONLY`; semantic guarantee `RELATED_ONLY`; full-cost `RELATED_ONLY`; frozen direct collision `NO`; mechanical result `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Current-source reality: the official DPL documentation says `detailed_placement` re-legalizes designs after incremental resizing/buffer insertion and exposes the default negotiation legalizer plus legacy diamond mode. The official flow script surrounds incremental global routing with `detailed_placement` after repair. Thus the seed's atomic action, incremental re-legalization after ECO-type edits, is already expressed by the current native union.
- Disposition: `STRUCTURAL_DROP__CURRENT_NATIVE_ACTION_UNION_ABSORBS_INCREMENTAL_RELEGALIZATION`. Adding an ungrounded recourse theorem without a distinct target-native action would be a generic algorithm wrapper. No raw, queue item, or brief.
- Decisive sources: OpenROAD DPL documentation, `https://openroad.readthedocs.io/en/latest/main/src/dpl/README.html`; current `global_route.tcl`, `https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/master/flow/scripts/global_route.tcl`.

## RQ51-02 — OpenSTA exact incremental propagation

- Same-object RQ variants pre-evidence: (A) exact affected-cone update after a gate-strength edit; (B) bounded-recourse graph-state update; (C) a Pareto characterization of exact versus tolerant propagation. The merged RQ was: *for a fixed OpenSTA network/SDC/delay model and a fixed edit sequence, can a new target-specific action retain exact arrival/required/slack semantics with an explicit recourse guarantee outside the stock update union?*
- Exact public identity: OpenSTA `master` README and `doc/StaApi.txt`, retrieved 2026-08-15; carrier would need a versioned public Verilog/Liberty/SDC edit trace and stock timing oracle.
- Five-field preflight: object `NONE`; action `RELATED_ONLY`; endpoint `RELATED_ONLY`; semantic guarantee `RELATED_ONLY`; full-cost `RELATED_ONLY`; frozen direct collision `NO`; mechanical result `RELATED_ONLY_DO_NOT_EXCLUDE`.
- Current-source reality and contrary evidence: the project explicitly documents query-based incremental updates of delays, arrivals and required times. `StaApi.txt` further states that incremental netlist edits update delay calculations, arrival/required times and slacks; its default tolerance is `0.0` for maximum accuracy. This directly covers the seed's proposed exact incremental propagation; the tolerance is a current native configuration, not a missing action.
- Disposition: `STRUCTURAL_DROP__CURRENT_NATIVE_EXACT_INCREMENTAL_UPDATE_UNION`. A new tolerance-selection rule would be an excluded controller; no raw, queue item, or brief.
- Decisive sources: `https://github.com/The-OpenROAD-Project/OpenSTA`; `https://github.com/The-OpenROAD-Project/OpenSTA/blob/master/doc/StaApi.txt`.

## RQ51-03 — lld-link retained-state linking

- Same-object RQ variants pre-evidence: (A) retained COFF-symbol/relocation state across object edits; (B) a reproducible state-transfer construction; (C) characterize a memory/latency cliff while keeping `lld-link` output semantics. The merged RQ was: *for a fixed PE/COFF link command and versioned project edit trace, is there a non-generic retained-state constructor that preserves the `lld-link` output/diagnostic contract under bounded memory?*
- Exact public identity: LLVM LLD documentation, current `llvm-project` source pages, retrieved 2026-08-15. Candidate carrier/oracle did **not** freeze: the available material identifies LLD as a fast drop-in linker, while the observed `/incremental` reference concerns MSVC `link.exe` behavior and is not an `lld-link` same-object action.
- Five-field preflight: ThinLTO and BOLT are `RELATED_ONLY` (different action/object boundary) and do not exclude this RQ; no exact five-field hit was established. `NO_MATCH` gives no novelty inference.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG__NO_FIXED_VERSIONED_PROJECT_TRACE_OR_NON_GENERIC_ACTION_SKELETON`. No absence claim is made; no source-closure item is created because the missing route was not narrowed to a unique public project/object/version or deterministic one-project rule.
- Sources used only to bound the locator: `https://lld.llvm.org/`; `https://llvm.org/docs/GettingStarted.html`; `https://clang.llvm.org/docs/ThinLTO.html` (contrary/historical boundary).

## Funnel accounting

`SEED=6; selected_RQ=3; excluded_before_locator=2; RQ_BACKLOG=2; evidence_qualified_raw=0; C0=0; D1=0; DEEP=0; CLEAN_BRIEF=0.`

No candidate was replaced after contrary evidence. No Source49/50 exact, terminal, or directly absorbed identity was reopened.
