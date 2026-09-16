# Source22 — local action-survival screening

## Frozen contract

- Assignment: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE22-WITNESS-ACTION-SURVIVAL-V6`
- Canonical v8.7; V9 and claim-pack outputs OFF.
- Funnel reconciliation: 8 locators; 4 fresh raw; 2 C0 source closures; 2 D1 entries; 2 deep reviews; 0 clean briefs.
- Only the required single-witness/single-mode four-node survival traces were made.  No experiment, build, installation, benchmark, or Stage work was performed.

## Raw and C0 accounting

| Row | Identity | Current source / other D1 fields | C0/D1 disposition |
|---|---|---|---|
| R1 | `GINKGO_BLOCK_JACOBI_AUTODETECTION_BOUNDED_PARTITION` | Current parameter docs expose automatic block pointers, `max_block_size`, and explicitly call automatic detection a rough approximation. Stock solve residual supplies an oracle; Matrix Collection is a public natural carrier; construction+solve memory/time is a finite denominator. [source](https://ginkgo-project.github.io/ginkgo-generated-documentation/doc/master/structgko_1_1batch_1_1preconditioner_1_1Jacobi_1_1parameters__type.html) | C0 closed, entered D1. |
| R2 | `LLVM_MACHINE_BLOCK_PLACEMENT_CHAIN_COALESCING` | Current LLVM source fixes CFG/probability inputs, inner-loop-outward chain coalescing, topological order, optional tail merge, and a predecessor-limit guard. Machine verifier/object equivalence is the stock oracle; LLVM Test-Suite is the natural carrier. [current source](https://www.llvm.org/docs/doxygen/MachineBlockPlacement_8cpp_source.html) | C0 closed, entered D1. |
| R3 | `MIOPEN_FIND_CONVOLUTION_SOLUTION` | Find/database emits a solution choice, rather than a fixed-output constructor. [official docs](https://rocm.docs.amd.com/projects/MIOpen/en/latest/) | Fresh raw, excluded before C0: selector. |
| R4 | `OPENVINO_NPU_ARTIFACT_COMPILATION` | Current plugin/driver/compiler selection and tile properties retain configuration/compatibility semantics. [official docs](https://docs.openvino.ai/2026/openvino-workflow/running-inference/inference-devices-and-modes/npu-device.html) | Fresh raw, excluded before C0: configuration/driver boundary. |
| L5 | Composable Kernel tile mapping | Source20 identity | Excluded historical repeat. |
| L6 | CacheLib FDP placement | Source20 identity | Excluded historical repeat. |
| L7 | QEMU simulator runtime | Active policy-hold identity | Excluded by contract. |
| L8 | Verilator simulator runtime | Final STOP identity | Excluded by contract. |

## Required V6 survival traces

### R1 — Ginkgo automatic block-Jacobi partition (`SURVIVES_TO_SELECTOR`)

**Single mode:** current automatic block detection with the default bound, keeping the matrix and the block-Jacobi output/operator semantics fixed.

| Node | Witness state |
|---|---|
| `action_origin` | A 4-by-4 sparse matrix with two legal contiguous partitions under the documented maximum block size: `[0,2,4]` and `[0,1,4]`. |
| `preselection_legality_canonicalize_dedup_overlap_prune` | Both partitions are contiguous, begin at 0, end at matrix dimension, and obey the bound; neither is removed by duplicate or overlap normalization. |
| `selector_input` | The two retained block-pointer sequences can be supplied/represented as legal candidate block structures, while automatic detection is documented only as an approximation. |
| `final_survival` | `SURVIVES_TO_SELECTOR`: the same-object action survives to the choice point.  This does not establish a non-generic algorithm or superiority. |

### R2 — LLVM MachineBlockPlacement chain coalescing (`SURVIVES_TO_SELECTOR`)

**Single mode:** default MachineBlockPlacement with tail merging allowed, fixed MachineFunction/CFG and branch-probability input.

| Node | Witness state |
|---|---|
| `action_origin` | A diamond CFG with legal topological orders `A,B,C,D` and `A,C,B,D`, with branch probabilities allowing either successor-chain choice. |
| `preselection_legality_canonicalize_dedup_overlap_prune` | Both orders preserve CFG topological constraints; neither requires duplication, changed MachineInstr semantics, or a non-native operation. |
| `selector_input` | Both are retained block-chain alternatives under current source’s probability-guided coalescing and subsequent topological scheduling. |
| `final_survival` | `SURVIVES_TO_SELECTOR`: the candidate action is not lost merely through legality/canonicalization. |

The traces are deliberately local.  They do not claim a complete action catalogue, recurrence, target/backend map, or performance result.

## Deep result

- **R1:** `STRUCTURAL_DROP__GENERIC_PARTITION_SOLVER`.  Survival only proves that a user/automatic partition is a legal candidate.  The remaining proposed optimization is target-independent bounded matrix partitioning; it does not yield the required target-specific non-generic N2 or guarantee.
- **R2:** `STRUCTURAL_DROP__DIRECT_SAME_OBJECT_ALGORITHM_COLLISION`.  Current LLVM source is a chain-coalescing heuristic, but same-object block-layout work directly supplies stronger global objectives and algorithms: [Codestitcher](https://arxiv.org/abs/1810.00905) and [Improved Basic Block Reordering / ExtTSP](https://arxiv.org/abs/1809.04676).  A new global ordering wrapper would therefore not survive fair subtraction.

No result, implementation, resource, or AI-readiness gap was used as a scientific rejection.
