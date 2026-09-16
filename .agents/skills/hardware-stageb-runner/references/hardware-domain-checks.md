# Hardware-domain checks

Load only the relevant section.

## Bit-exact quantization

Lock signedness, scale, zero-point, rounding, saturation, overflow, accumulator width, and requantization. Include boundary and adversarial vectors. Compare identical operator semantics before comparing performance.

## NPU and accelerator mapping

Lock model, operator shapes, batch, precision, sparsity, capacity, bandwidth, frequency assumptions, tool version, and latency boundary. Separate mapping feasibility from measured speedup.

## PIM and NDP

Account for commands, contention, synchronization, consistency, address translation, capacity loss, metadata, and residual data movement. Include the host-side and non-offloaded path.

## RTL and formal verification

Define clock/reset behavior, interface protocol, legal input assumptions, assertions, coverage target, and a software or mathematical oracle. A proof covers only the stated properties and bounds.

## Synthesis, P&R, FPGA, and ASIC

Record tool, version, library or device, constraints, corner, clock target, utilization, and whether results are pre-layout or post-layout. Avoid cross-technology PPA comparisons unless normalized and explicitly caveated.

## Performance and energy

Define the measured interval, warm-up, repetitions, aggregation, host overhead, data movement, and power measurement method. Distinguish throughput, latency, utilization, estimated energy, and measured energy.
