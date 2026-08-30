# RUST-HISTORY-AWARE-CGU-PARTITION — revision1 resume1

## 结论

- 原子门：`RUSTC_NATIVE_ITEM_TO_CGU_ACTION__NON_GENERIC_PREDECESSOR_COHORT_PARTITION_CERTIFICATE`
- 资源包：已闭合；科学修订：**已消耗（1/1）**。
- 终裁建议：`BELOW_Q2_STOP__GENERIC_PARTITION_CACHE_OR_CURRENT_RUSTC_UNION_ABSORPTION`。
- Stage A / Stage B：均不授权。

这不是因实现、硬件、链接器或没有性能结果而停止。公开 carrier 已得到：`smallvec 1.15.2` 在隔离的官方 nightly rustc 上产生 2,246 条 mono-item 记录，且实际归入两个 native CGU。由此足以执行原静态门；其结果是否定该机制的非通用 N2 内核。

## 原子命题、反证与结果

命题本应是：在一个固定当前 mono-item 图上，前代仅提供 cohort 标签，仍可定义一个保留所有 future-native legality/full-cost action 的 **Rust 特异** 有界 frontier，并获得 current union 之外的完整 item-to-named-CGU 计划与非平凡保证。

反证条件是：若 cohort 只改变同一合法 placement 空间的权重、优先级或缓存标签，且 state 可投影为带标签的容量/重叠图划分，则它只是 generic partition/cache scheduling；或 current rustc 的 placement/merge/config union 已包含全部原子动作。

结果：反证成立。前代的 source identity 只能给当前 item 增加外部 cohort 标签；它不生成新的 `MonoItem`、linkage、visibility、inlining-copy、CGU name、merge、internalization 或 distinct-symbol 动作。任何候选计划仍仅是 current `MonoItem -> named CodegenUnit` membership 的另一目标函数。把 `H` 加入 `(item, linkage, overlap, capacity)` 后，得到的是历史加权的 constrained graph/bin partition，不是 Rust-specific future-action-preserving state 或保证。

## 当前事实与科学推断分离

**事实。** 官方 `partitioning.rs`（commit `ba28ff76…411b`）已经定义 `partition`、`place_mono_items`、`merge_codegen_units`、`internalize_symbols` 和 distinct-symbol 检查。固定 current carrier 的 rustc 输出给出 CGU `0/1` 的 internal/external mono-item 分配。`smallvec 1.15.1` 仅作为前代资料，和 current 版本有 6 个变动文件路径。

**推断。** 在不引入 future information、不改变 source/current graph、不改 ABI/linkage/symbol 合同的前提下，cohort 标签不改变 native legal action grammar。所谓 frontier 若保留全部 Rust predicates，只是 generic labelled partition 的完整状态；若丢弃 linkage、inlined multiplicity、names 或 symbols，则不再保 future native actions。两条分支都不能满足 gate 的 Rust-specific N2 条件。

## 完整 current union 与公平性

完整同对象 union 是：current collection/target checks；stable/non-generic 与 volatile/generic placement；root-to-inlined-copy placement；linkage/visibility；codegen-unit merge、name、internalization、symbol uniqueness；以及同信息 `-C codegen-units`、incremental、LTO、Cargo profile/config 分支。generic graph partition/ILP 只可为 oracle，不是部署基线。

候选没有命名 union 外的 legal action，而是把同一 item membership 重新按 predecessor label 加权。即使未来实现正确，其可主张的只是普通 cache/partition objective tuning；不能形成可信 Q2 所需的 N2 算法/保证形状。

## 非结论与资源说明

没有执行候选实现、性能实验、benchmark、Stage A 或 Stage B。`link.exe` 缺失仅阻止最终 test binary 链接；它没有被用作科学推断，且不是本终裁原因。当前 static carrier、native source pin 与 mono-item action record 已足以攻击该原子机制。

## Claim ceiling

本包只支持“固定 carrier 上该原子机制退化为 generic partition/cache scheduling”的 Stage0 终裁建议。不主张任何 runtime、incremental-build、artifact-size、自然规律或实现性能结果。
