# Discovery log — adaptive source 03

## 结论

对 Wasm async ABI near-miss 完成了单一 Wasmtime 43+ / WASI 0.3 ABI 的 current-source 闭合：async feature/config、CLI entry、component linker async API、Future 与独立 native stack 的运行时机制已形成当前 union。拟议的 continuation layout/ownership 动作要么已被该 union 表达，要么变为泛化表示压缩、controller 或改变取消/资源保证，因此结构淘汰。

随后筛查五个 fresh compiler/runtime/ABI/ISA 语义 family，均在固定可观察合同后分别退化为 ABI/config mapping、sanitizer 模式、通用 prologue/RA 或 cleanup transformation。没有 clean brief。

## 计数与边界

- raw=6；rescreen=1；fresh=5；accepted unique=5；deep=1；clean brief=0。
- V9 OFF；无实验、E2、build、安装、大下载或共享写入。
- 零提案是结构筛选结果，不从未实现、未测得正结果、资源或 AI readiness 推导。

## 下一步

不要重筛本轮已关闭 family；主线若继续派发，应换到与上述 ABI/runtime primitive 不同的语义对象。
