# Exact public anchor

## A01 — WebGPU GPUBuffer mapping state

- Exact identity: W3C WebGPU `GPUBuffer.mapAsync`, `getMappedRange`, `unmap`, and one fixed buffer/queue result trace.
- Immutable endpoint: same mapped bytes, GPU command availability, mapped-view lifetime, validation, and queue-visible result.
- Official contract: <https://www.w3.org/TR/webgpu/> (GPUBuffer buffers/mapping state section).
- Current implementation locus: Chromium Blink `gpu_buffer.cc` at <https://chromium.googlesource.com/chromium/src/+/532d576619f0f87688b3b274b8d4156082dd4b77/third_party/blink/renderer/modules/webgpu/gpu_buffer.cc>.
- Natural carriers: WebGPU compute/render readback/upload workloads using mapped staging buffers.

This is an anchor, not evidence of current absence or novelty.
