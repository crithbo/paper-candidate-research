# Source49 typed actionable-residual seed pool

Pre-evidence role: `CURRENT_SOURCE_OR_SPEC_SEMANTIC_BOUNDARY`; required residual: exact target-state legality or semantic transition.

| Seed | Frozen target state / endpoint | Label-stripped first falsifier | Result |
|---|---|---|---|
| S01 | AArch64 FPCR across a fixed strict-FP call graph and bit/exception endpoint | generic dynamic-FP-state placement | selected RQ01 |
| S02 | PowerPC FPSCR across fixed strict-FP calls and bit/exception endpoint | generic dynamic-FP-state placement | selected RQ02 |
| S03 | LoongArch FCSR across fixed strict-FP calls and bit/exception endpoint | generic dynamic-FP-state placement | selected RQ03 |
| S04 | RVV VXRM | exact terminal Stage0 STOP | excluded |
| S05 | AArch64 FPMR | historical terminal identity | excluded |
| S06 | MLPerf v5.1 result source | fixed locator-only identity | excluded |

The label-stripping test is a scheduling falsifier only and does not itself determine disposition.
