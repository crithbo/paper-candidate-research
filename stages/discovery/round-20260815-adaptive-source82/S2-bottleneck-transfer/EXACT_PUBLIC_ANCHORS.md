# Exact public anchor

| Field | Frozen value |
|---|---|
| Object | Fixed Linux i386/x86-64 position-independent executable or shared object, its logical pointer values, dynamic interfaces, and stock dynamic-loader semantics |
| Writer/reader | GNU ld emits `DT_RELR` under its documented non-default `pack-relative-relocs` action; glibc supports DT_RELR; stock ELF/GABI RELR decoder is the format oracle |
| Observable contract | Program behavior and dynamic-binding semantics remain unchanged; loader consumes standard ELF dynamic tags and relocation table |
| Source-supported shift | RELR compacts clustered relative relocations; any claim of a new dominant loader bottleneck would require later measurement and is not asserted here |
| Candidate action | Change placement/order of relative-pointer storage to increase bitmap runs |
| Verdict | This candidate action is generic address/bitmap packing, so it cannot enter raw as a target-specific N2 |

No code or corpus was acquired.
