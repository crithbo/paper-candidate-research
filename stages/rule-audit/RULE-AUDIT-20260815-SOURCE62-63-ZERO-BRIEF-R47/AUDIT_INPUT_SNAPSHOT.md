# R47 审计输入快照

- 合同：`RULE_AUDIT_SOURCE62_63_ZERO_BRIEF_R47.yaml`
- 合同 SHA-256：`03912FF0A1BFC4E396D87668EC6B0E414051BF8520501424445133EAD029B397`
- 只读：Source62/63 control、六路 canonical handoff 与 queue telemetry、当前共享规则。
- 禁止且未读：Source64 的所有文件、结果与状态；未执行 queue、检索、下载、实验、Stage 或共享写。

| 周期 | control SHA-256 | raw | clean brief | 首个主要失败 |
|---|---|---:|---:|---|
| Source62 | `23F35D8B657295DCD20B87D713F22651400A5AE7E353E111A9A2C87CA6A5D83B` | 0 | 0 | S3/S4 no-anchor；其余 current/generic 或 locator |
| Source63 | `829E1CCFD98A3F32C4473AA65146B2580624FF4DA966B97DF540F37AC806268B` | 0 | 0 | S3/S4 no-anchor；S1/S2/S5/S6 current/generic；S6 一个 mechanical-unavailable closure |

OCaml queue 仅表示固定 `ocaml/ocaml` Flambda2 对象的 current-union/direct-collision 尚未闭合；不代表新颖性、科学负面、raw 或 brief。
