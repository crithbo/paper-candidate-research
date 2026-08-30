# Source / collision matrix — Source33 S2

| family | current upstream reality | strongest same-object union | collision / subtractor | outcome |
|---|---|---|---|---|
| DPC++ Level Zero multi-tile USM + queues | Current official guidance exposes root/subdevice partitioning, allocation types, queues, implicit scaling and explicit copies. | Caller composition of partition choice, allocation API, queue binding and copies under the fixed program semantics. | The documented union itself is the direct subtractor; a placement/queue policy cannot establish a union-external N2. | `LOCATOR_ONLY__CURRENT_UNION_COMPOSITION`. |
| CUTLASS tcgen05 descriptor/TMEM sketch | Current official documentation presents descriptors and allocation as library/kernel programming facilities. | Library-owned descriptor, memory and instruction construction. | Would require a new exact object and collision audit; not opened under identity/capacity constraints. | `LOCATOR_ONLY`. |
| SYCL command graph | Cooled Source29 identity. | N/A | Repeated exact identity. | `EXCLUDED_REPEATED`. |
| RVV lowering | Cooled Source32 identity; its unresolved status remains non-negative. | N/A | Repeated exact identity. | `EXCLUDED_REPEATED__UNRESOLVED_NOT_NEGATIVE`. |

No paper-owned constructor, future-work statement, issue, or implementation absence was used as an absence claim.
