# Source and collision audit — S1-O6-MOBILE-TRAFFIC-CRITICALITY

## 本轮固定输入（已重算 SHA-256）

| 输入 | SHA-256 | 审计用途 |
|---|---|---|
| Discovery brief | `B960656D906AE912EFEEEC36C94195A7E18D277F6A9BA7E9E5142552DCFBFBDF` | 原始 exact object、基线和 claim ceiling |
| Previous PRIMARY | `180B17E009C45C4F49766FE736365E905F9205086514D85FC72BE1BCD72FC7CE` | 仅作为旧审计，不继承分数/结论 |
| Confirmation | `9D0FC0EF47C11993C997F8DBD469906035BE50BD0295A7C00DD07A54FF506B85` | 事务 QoS subtractor 与旧 gate 问题 |
| Scope correction | `E11E3F963B189B4D6A1E0AC175AC7B7D87D9950154F671DAB4258099BBA0D602` | 控制性纠偏：非原子 gate 不能推出学术 STOP |
| Decisive handoff | `C0A4F5620F6C4D9C41EC3804C77735E5A3E40139735C5C913691D5726F4E05A0` | 已支持/未支持事实边界 |

## 一手/权威来源核验（2026-08-09）

| 来源 | 核验结果 | 对裁定的含义 |
|---|---|---|
| [Sereno, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xin) | 证实 mobile LLM 与前台 QoS 干扰、software yield、商业手机评测 | 自然问题锚点；不是 first-arbiter candidate 的 performance evidence |
| [XSched, OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/shen-weihang) | 证实 XQueue command-level preemption/policies | 强但不同层级基线；不等于 request-level NoC/DRAM contract |
| [Arm AXI/ACE specification](https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/IHI0022H_amba_axi_protocol_spec.pdf) | `ARQOS/AWQOS` 是每个读/写事务的 4-bit QoS 标识 | 直接 subtractor；否定“新 tag”叙事，要求同信息预算 native-QoS baseline |
| [AMD Versal QoS TRM](https://docs.amd.com/r/en-US/am011-versal-acap-trm/Quality-of-Service) | AXI QoS 随 transaction 经过 NoC；列出 traffic types | 说明 transaction QoS 在硬件中可实现；不证明 mobile vendor 都暴露同一接口 |

## Collision conclusion

`SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACTOR`。目前没有发现六项全覆盖的 direct fatal。最接近的吸收风险是“候选实际上只设定现有 `AxQOS`”；这是一条未来 same-object killer，而不是当前已证实的结构性失败。未将这些不同层级工作合成万能 union。

## 证据诚实性

未运行实验、未下载数据、未构造 trace、未使用 GPU/专有栈。没有把 source availability 或硬件可得性当成科学结论。
