# RULE_FREEZE

- assignment: `DISCOVERY-S1-20260811-V8.7-WAVE197-RISCV-VSTART-RESTART-STATE-DEPTH`
- lens: S1 boundary contradiction / RISC-V Vector restart state.
- frozen date: 2026-08-11 (Asia/Shanghai).
- authoritative revision: `v8.7+R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`.
- frozen controls: `plan.md=CFB9F43ABC534F063D30A51B9EABD407B5E1C8CC26D066A250B8D43F2D80D58B`; `registry.yaml=F753554DB84F2DB5129F8B5B3CC64612384113118BA89F40A5789511646708EF`; `rules/ROLE_DISCOVERY.md=FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- post-dispatch provenance only: mainline later reported `plan.md=17FB33BEC9564ACF995C0E6A90E30A67F11758402743A2754E09C1262BCB8BF8` and `registry.yaml=F44FFB7A20546CA853A25AC15737A2CECD6A27134D4F94FC3785C48C37328208` after mechanical S2 Wave195 absorption. It has no effect on this assignment's frozen rule, contract, or write boundary.
- scope: only `vstart`, fault-only-first (FOF), vector trap/restart, and call/context boundary state; no experiment, benchmark, download, Stage0/A/B, or shared-control write.
- same-object contract: same RVV program, ISA feature set, psABI call/return and observable exception semantics, memory effects, and destination-register semantics. Changing ISA, exception model, ABI, or using an emulator patch is outside the object.
- admission: only a full loop/interprocedural restart-state N1/N2 outside the current legal compiler/runtime union with a native-legal witness, natural carrier, full cost, and finite fidelity closure. Flags, ordinary scheduling and target selection are excluded.
