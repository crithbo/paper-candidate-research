# Source34 RQs

- RQ34-A: fixed AMDGPU kernel/object code — does dynamic VGPR allocation admit a non-config target-native constructor with stock semantics? Falsifier: current intrinsics/flags already express allocation and remaining idea is tuning.
- RQ34-B: fixed AMDGPU register allocation — does RA+scheduling have a frozen mechanism beyond current allocators/flags? Falsifier: generic compiler configuration.
- RQ34-C: fixed Intel GPU OpenCL compilation — can a target action/oracle be frozen outside the complete IGC compiler? Falsifier: project-owned compiler pipeline.
