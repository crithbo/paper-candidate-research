# R52 审计输入快照

- 合同 SHA-256：`28B27FBE91594FEE775B489B1E8C2811509DAA4DCA335EE6CEB048AE07DE4DE0`
- 只读：Source67/68 control、canonical handoff、queue telemetry 与当前规则。
- 排除：Source69；无 queue、检索、下载、实验、Stage 或共享写。

| 周期 | control SHA-256 | raw | clean brief | 主要结果 |
|---|---|---:|---:|---|
| Source67 | `D57104D0223C924B5068FD1ED9B17E6A840A1799CF768D79ED2106FBCFC26698` | 0 | 0 | no-anchor、current-lowering/union、generic kernel |
| Source68 | `4970BCBC49501EC8C1C03D18CE2132E4B8E7572E4BFD4D0A6A4F586A83A01C94` | 0 | 0 | no-anchor、endpoint/current union、format-policy、generic analysis kernel |

Source68 的 futex vector 改序会改变 returned-index endpoint；Go escape analysis 有 current weighted graph 与一手 connection-graph kernel 双重反方。
