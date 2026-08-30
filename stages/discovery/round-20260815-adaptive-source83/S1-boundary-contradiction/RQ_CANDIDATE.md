# Research-question candidate

## RQ01 — GPUBuffer map-window placement under fixed queue visibility

For a fixed WebGPU buffer, byte result, command sequence, validation, mapped-view lifetime, and queue visibility endpoint, can a target-specific non-generic N2 constructor place/split `mapAsync` and `unmap` windows to improve full cost without changing the endpoint?

- In scope: the same buffer mapping protocol and its CPU/GPU ownership transition.
- Out of scope: new staging objects, API/usage-mode changes, driver/controller policy, external wrappers, and altered queue availability.
- Counterfactual: a different legal mapping timeline retains views/bytes and GPU command eligibility while reducing map latency, copies, or retention.
- Primary route: W3C current specification; Chromium current source as implementation locus.
- FINER-lite: bounded semantic feasibility is clear; novelty threat is high because map-window placement is a prescribed ownership lifetime.
- Pre-RQ closure: `ORDINARY_CLOSURE`; selective depth OFF.
