# AIGER-DELTA-SCHEDULE Stage A Results

## Decision summary

- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Preclaim gate: `FAIL_CLOSED__NATIVE_BUILD_AND_COMPARATOR_TOOLCHAIN_UNAVAILABLE`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation: `no`
- Natural HWMCC objects: `0`
- Scientific revision consumed: `false`
- Stage B: `false`; approval `null`

## What completed before the resource boundary

The contract fixes a standard binary AIGER 1.9 object and only allows a whole-DAG legal topological relabeling of fixed AND vertices. The exact small-control recurrence explores every ready vertex from each partial topological prefix. Its honest complexity is proportional to the number of legal topological orders; it is a generic exact control, not an N2 contribution or scalable method.

The independent Node.js control enumerated all `48` legal schedules of the frozen six-AND witness and wrote/parsed two binary AIGER files:

| Artifact | Delta payload | Whole file | SHA-256 |
|---|---:|---:|---|
| S1 | 12 B | 36 B | `C532E0AC5A22E4733A0759B937EABB2DB9B488038FA2847FEA7E017D670C9A9D` |
| S2 | 13 B | 37 B | `18D5067D33E3D44113D322814829326503ED9D6BC9C531541FB3DD3FE19F4A6C` |

All `48/48` schedules produced the same identity-anchored output structure under the control parser. The result reproduces the frozen 12B/13B divergence and proves only that the local control implements the specified action on this witness. It is non-native and non-claim-bearing.

## Measured control cost

| Dimension | Value | Boundary |
|---|---:|---|
| wall time | 6,836,100 ns | complete enumeration + write + parse + canonical structural check |
| user CPU | 15,000 us | Node process resource usage |
| system CPU | 0 us | Node process resource usage |
| peak RSS | 40,374,272 B | Node process `maxRSS` |
| output AIG bytes | 73 B | S1 + S2 |
| network bytes | 0 B | witness control only |

This is not a candidate-vs-baseline full-cost result. Claim-bearing full cost is unmeasured because native parity failed closed first.

## Failed preclaim components

The machine has no C/C++ compiler, Make/CMake, exact pinned AIGER utilities, Yosys, or ABC. WSL is not installed and system installation is prohibited. Consequently the following mandatory components were not executed:

- AIGER reference reader/re-encoder at `039ec1a2cc37d3093ac35c4b6df65336b346f409`;
- Yosys current same-object option grid at `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552`, including `-no-sort`;
- ABC standard default and conditional `-u` boundary at `6c51a9238544bce6eb300b7b1c3e5bb4215bec84`;
- native object identity/reader acceptance;
- a scalable nontrivial whole-DAG candidate and N2 theorem/property;
- any public HWMCC acquisition or natural pilot.

## Scientific interpretation

None. A missing native toolchain is a resource failure before the first claim-bearing observation. It neither supports nor refutes natural threshold-sensitive freedom, current-union residual, scalability, full-cost advantage, or Q2/Q1 paper viability. No STOP, reserve, archive, PASS, or Stage B recommendation is made.
