# Source19 — S6 discovery log

## Frozen assignment

- Assignment: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE19-CROSS-DOMAIN-PROBLEM-EVIDENCE-V3`
- Canonical method: v8.7; `DISCOVERY_CLAIM_PACK_MODE=OFF`; V9 output: OFF.
- Scope: accelerator direct algorithms, architecture data structures/placement, non-QEMU/non-Verilator simulator or runtime algorithms, and checker-backed system constructors.
- Search cutoff: 2026-08-14.  No experiment, build, benchmark, installation, or large download was run.
- Funnel: 6 locators; 3 fresh raw records; 0 pre-outcome D1; 0 deep reviews; 0 grounded briefs.

## Evidence and screening record

| ID | External problem anchor / current first-party check | Exact object considered | Pre-outcome D1 | Canonical disposition | Reason |
|---|---|---|---|---|---|
| L1 | MIOpen documents Find/solution selection and its find database; current API exposes algorithm/solution search rather than a fixed constructor. [MIOpen docs](https://rocm.docs.amd.com/projects/MIOpen/en/latest/) | Fixed convolution descriptor and solution selection | No | `STRUCTURAL_DROP__SELECTOR_CONFIGURATION` | The candidate chooses among existing kernel solutions/configurations; it is an online selector, not a same-object whole constructor with a new target-specific guarantee. |
| L2 | ROCm CK documents coordinate movement, thread mapping, and memory-swizzle facilities. [CK docs](https://rocm.docs.amd.com/projects/composable_kernel/en/latest/) | CK-tile kernel coordinate/data-movement plan | No | `STRUCTURAL_DROP__GENERIC_LAYOUT_OR_PAPER_OWNED_CONSTRUCTOR` | The apparent residual is generic tensor layout/mapping; native actions are kernel implementation choices and do not yield a frozen checker-backed same-function constructor distinct from active backend work. |
| L3 | gem5 Ruby current documentation defines modular cache hierarchies, coherence protocols, replacement policies and networks. [Ruby docs](https://www.gem5.org/documentation/general_docs/ruby/) | Ruby cache/coherence hierarchy construction | No | `STRUCTURAL_DROP__CHANGED_MODEL_OR_CONTROLLER` | Changing protocol/replacement/network changes the simulated architecture/model, rather than constructing an equivalent representation of a fixed object. Remaining work is a configuration/controller problem. |
| L4 | gem5 memory-system documentation describes packet/event and memory-system modelling interfaces. [Memory-system docs](https://www.gem5.org/documentation/general_docs/memory_system/) | Classic-memory queue/event placement | No | `EXCLUDED_CONTAINED_BY_L3` | Same opportunity family as L3; it cannot supply an additional fresh family. |
| L5 | TLC’s public documentation frames its work as state-space exploration/model checking. [TLC documentation](https://docs.tlapl.us/using%3Atlc) | Fixed TLA+ specification exploration order/frontier | No | `STRUCTURAL_DROP__GENERIC_SEARCH_CONSTRUCTOR` | Any apparent bounded-state residual is generic search/ordering; no target-specific whole constructor was located before D1. |
| L6 | Wasmtime/Cranelift code-cache construction was already isolated for Source18’s cross-phase closure. | Native-code cache artifact construction | No | `EXCLUDED_HISTORICAL_REPEAT` | Excluded at identity filtering; no re-review or inferred negative conclusion. |

## D1 decision

The contract requires a pre-outcome D1 before depth: an independent limitation/problem anchor, a same-object whole action promise, a credible non-generic target-specific guarantee, and a finite carrier/oracle path.  No fresh raw record met all four.  This is a screening outcome, not evidence that an unimplemented mechanism cannot work.

The unspent `deep_ceiling=2` expires under the contract’s no-backfill rule.  No clean brief is proposed.
