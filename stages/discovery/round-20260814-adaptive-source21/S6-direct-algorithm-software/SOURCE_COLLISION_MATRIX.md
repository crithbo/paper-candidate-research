# Current-union and collision matrix

| Candidate | First-party current evidence | Direct/strong subtractor | Result |
|---|---|---|---|
| LLVM MachineOutliner global selection | [current implementation](https://llvm.org/doxygen/MachineOutliner_8cpp.html), [legality interface](https://www.llvm.org/doxygen/MachineOutliner_8h_source.html) | Current suffix-tree/repeated outlining union; [original outlining material](https://llvm.org/devmtg/2016-11/Slides/Paquette-Outliner.pdf); current target implementations; same-object papers/tools | `SEARCH_BOUNDED_OPEN`: source provides a current partial primitive and arbitrary selection note; primary direct collision remains a finite Stage 0 closure. |
| Ginkgo bounded block-Jacobi partition | [current block parameter docs](https://ginkgo-project.github.io/ginkgo-generated-documentation/doc/master/structgko_1_1batch_1_1preconditioner_1_1Jacobi_1_1parameters__type.html), [LinOp docs](https://ginkgo-project.github.io/ginkgo-generated-documentation/doc/master/group__LinOp.html) | Existing block/preconditioner literature and automatic/user partition union | Structural: generic partition/solver residual only. |
| MIOpen Find | [official docs](https://rocm.docs.amd.com/projects/MIOpen/en/latest/) | Current Find/database union | Existing-point selector. |
| CK tile mapping | [official docs](https://rocm.docs.amd.com/projects/composable_kernel/en/latest/) | Current coordinate/thread/swizzle union | Generic layout or paper-owned construction. |
| CacheLib FDP | [official guide](https://cachelib.org/docs/Cache_Library_User_Guides/FDP_enabled_Cache/) | Device placement/configuration union | Controller/device-interface semantics. |

The source search is explicitly bounded.  No row is described as first or absence-proven.
