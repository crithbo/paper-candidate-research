# R50 审计输入快照

- 合同 SHA-256：`F4FEA5FDC96B80BAFA1036946EAA9E3CFB86CAF8E001132528D5D01B30A2CC0D`
- 只读：Source65/66 control、canonical handoff、queue telemetry 与当前共享规则。
- 排除：Source67 的所有文件和结果；无 queue、检索、下载、实验、Stage 或共享写。

| 周期 | control SHA-256 | raw | clean brief | 主要结果 |
|---|---|---:|---:|---|
| Source65 | `4F65308AF1D90A3333E928460C776BB4EC9C6C0578D4146F4138693DA9B61E6C` | 0 | 0 | no-anchor、same-object/current/generic/formal-kernel |
| Source66 | `0A82E73D7802991A1EDDE2E36EE0AC46F4BC65FB1CDF68D709CFD9DB11D20D83` | 0 | 0 | no-anchor、current-union/controller/generic-kernel |

Source66 的 related MLIR 条目没有被误作排除；HotSpot C2 的关闭来自当前 C2 与 goSLP 的具体反方，而不是身份冷却。
