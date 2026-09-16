# Q1 Comparator Matrix

Assignment: `RESOURCE-STAGEA-L3-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-RESUME1`

| Arm | Same object / information | Native executable path | Action family | Role | Natural result |
|---|---|---|---|---|---|
| B0 default LLVM | yes | exact pre-greedy MIR → default allocator → FrameLowering/PushPop → `llvm-mc` → `ld.lld -r` → readers | current default GPR RA, spill, fixed Zcmp prefix/list/adjust | deployable baseline | 4/4 functions produced the best registered text/frame coordinate |
| B0 allocator family | yes | same | greedy, basic, fast | deployable current alternatives | 72/72 total current-union arms passed |
| B1 complete finite current union | yes | same | allocator family plus target hints/cost-per-use, CSR cost scale 0/80/160, first-use 1/8/32, representative joint settings, shrink-wrap on/off | strongest executable comparator | matched candidate best code bytes and frame bytes on 4/4 retained functions |
| WL-ZCMP-PARETO-DP | yes | pre-RA physical assignment or native stack object, then the identical unmodified continuation | joint bounded location/rlist-adjust/residual-spill frontier | candidate | 11/11 native plans passed; no strict primary benefit |
| Cartesian exact enumeration | yes for the declared bounded abstract interface | candidate materializer only on the small witness | all `3^w` identity-preserving assignments for `w≤4` | ceiling/checker only | DP/oracle exact for `w=0..4`; not used as a deployable baseline |

The 18-arm union is individually executable and same-information; it is not an impossible universal configuration. Eight of 11 candidate assemblies were byte-distinct from the finite union, but distinct encoding is not a useful residual. None improved complete function text bytes or frame bytes, and every selected candidate best point added planner cost.

Direct absorption is therefore established for the registered bounded natural pilot, not for arbitrary CFGs or unbounded register allocation.
