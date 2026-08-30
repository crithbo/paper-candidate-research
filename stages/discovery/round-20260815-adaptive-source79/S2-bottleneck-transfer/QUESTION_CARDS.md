# Source79 Question Card outcomes

**QC-S79-01.** Full cost would include cache construction/bytes/host memory, pipeline creation and reuse. Current Vulkan semantics state that cache contents are implementation-managed and expose create, retrieve and merge operations. A user-side “joint constructor” necessarily becomes cache management or changes the driver/object; no target-specific same-object N2 skeleton survives. `EXCLUDED_BEFORE_RAW`.

**QC-S79-02.** Full cost would include writer/read CPU/RSS/temp/bytes and downstream compile/link. Current LLVM format makes abbreviations self-described and expressly forbids reader built-in knowledge; wrappers and encoding are already native writer/read semantics. Remaining statement is generic serialization/packing. `EXCLUDED_BEFORE_RAW`.

`raw/C0/D1/deep/clean brief=0/0/0/0/0`.
