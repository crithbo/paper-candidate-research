# RULE_FREEZE

- assignment: `DISCOVERY-S1-20260811-V8.7-WAVE205-PRECISE-ARCH-STATE-COMPILER-SEAM-BREADTH`
- frozen date: 2026-08-11; rules: `v8.7+R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`.
- controls: `plan=08A2A5855112635FD009EACA933266F39CF9F47107C1516B0FDCEF1FE4A9F7D9`; `registry=AE95989897A02C9213E9FC72C414D6AD660E458AD50F33E1BDB14DDB9B1F6F40`; `ROLE_DISCOVERY=FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- scope: six new precise architectural-state/compiler-runtime seams; same program, ISA, ABI, observable result, trap/unwind/context-switch semantics must remain fixed. No experiment, benchmark, download, Stage0/A/B or shared write.
- exclusion: flag/attribute/lowering/scheduling-only changes, emulator patches, ABI/ISA changes, and weakened trap/security guarantees are not N1/N2.

