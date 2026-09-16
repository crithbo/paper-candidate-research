# Rule freeze — Wave261

- Assignment: `DISCOVERY-S1-20260811-V8.7-WAVE261-LOONGARCH-PCREL-BASEOFFSET-RA-COST-JOINT-N2-CLOSURE`.
- Frozen controls: registry `99512C8F06CDB64915C069B87E1FB895463F52D936A2F9DA5C7261BFA193CEC2`; plan `AB8F1BAC3549F40D61A478CA916EC26C1E09114EB00C411E09B163F7DF0ED4CE`; ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Authority: production v8.7+R5-P0; `DISCOVERY_QUALITY_MODE=OFF`; no shadow/R7 semantic use.
- N2 rule: existing native actions are permitted, but not a generic RA/ILP/cost-table/peephole. Admission requires a target-specific algorithm or guarantee, same-information action-divergence certificate, complete fair union, natural finite fidelity path and full cost.
- Current LLVM head recorded read-only by `git ls-remote`: `cfcdf93b66b20e92e98181de71fff33452d5b51d`; current binutils-gdb master: `a80fede20bc1330eca5e419392c6595bb3a6ac1d`. GCC git endpoint returned HTTP 429; GCC's official current option documentation was used and that pin limitation is explicit below.
