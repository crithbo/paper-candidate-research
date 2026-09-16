# Discovery Research Question Candidate

- RQ candidate ID: `S4-104-RQ03`
- Seed / lane: `S4-104-04` / `DISCOVERY_S4`
- Exact public anchor: MLPerf Power paper (arXiv:2410.12032) plus a public serving timestamp carrier.
- Stable object/guarantee: an explicit power-window/throughput measurement protocol; no inference above its observable hardware boundary.
- Primary RQ: 在同一公开 GPU serving carrier 中，是否有 MLPerf-style 已公开规则未表达、但可在公开观测面闭合的 power-window alignment correction，且它能改变一个同对象配置选择？
- Scope: public measurement protocol and declared device/system boundary; excludes GPU-only counter包装为总系统能耗。
- Contribution hypothesis: `MEASUREMENT_CHARACTERIZATION`.
- Earliest falsifier: MLPerf Power rules already express the same alignment/denominator and no distinct carrier-specific confound remains.
- Strong null: a public power protocol already supplies the full measurement action.
- Primary route: MLPerf Power primary paper/rules + public timestamp semantics; fallback: MLCommons official artifacts.
- Frozen outcome-aware rule: unavailable full-system observation only lowers evidence ceiling; it does not create a negative scientific claim.
- Pre-RQ packet: MLPerf Power is a strong primary measurement-method subtractor, but no carrier-specific non-generic action was frozen; result `UNRESOLVED_BACKLOG`.
- Disposition: `RQ_BACKLOG__SCOPE_OR_ANSWERABILITY_UNCLEAR`.
