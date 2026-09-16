# Exact public anchor

| Field | Frozen value |
|---|---|
| Family signature | `APACHE_TVM_RELAX__FIXED_IRMODULE_VMEXECUTABLE__FUSION_BOUNDARY_STATIC_LIFETIME_JOINT_CONSTRUCTOR__MEMORY_DISPATCH_FULL_COST` |
| Official anchor | Apache TVM Relax VM architecture: https://tvm.apache.org/docs/arch/relax_vm.html |
| Current union loci | `apache/tvm` current source for Relax default pipeline, `FuseOps`, `StaticPlanBlockMemory`, allocation lowering and VM codegen; immutable commit remains a bounded closure debt |
| Exact object | Fixed Relax/TensorIR `IRModule`, target/device configuration, constants, output tensors and stock `VMExecutable` observable semantics |
| Stock oracle | Stock VM loading/invocation and equal output tensors; no custom runtime, reader, kernel ABI or changed model |
| Carrier route | One version-pinned upstream Relax test module, deterministically chosen after resolving one `apache/tvm` commit; canonical route only, no claimed performance result |
| Full-cost denominator | Compile CPU/RSS/temp/cache bytes, peak allocation, executable/constant-pool bytes, VM bytecode/dispatch CPU and end-to-end runtime/device bytes |

The anchor proves that stock fusion and memory planning exist in one pipeline; it does not establish that their existing composition has, or lacks, the proposed joint objective.
