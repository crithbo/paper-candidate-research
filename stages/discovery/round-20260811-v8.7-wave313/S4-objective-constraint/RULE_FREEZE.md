# Rule freeze

- Assignment: `DISCOVERY-S4-20260811-V8.7-WAVE313-JSC-CACHED-BYTECODE-REPRESENTATION-CLIFF-DEPTH`.
- Exact object: one pinned WebKit/JSC revision; cached bytecode; matching stock interpreter/cache reader; identical observable JavaScript semantics.
- Frozen production rules: `v8.7 + R5-P0`, `DISCOVERY_QUALITY_MODE=OFF`; R7 dormant.
- Frozen controls: `AGENTS.md=66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; `plan.md=88981B9854BB82B3E605AA848C3F6A9F221B7B1A2EF6DDDFC45E42EAFE82672B`; `registry.yaml=7D3C1E8AF900BD68C2705992A9A3E79CAFC89F7BF9A9024373A0E330BCD2BF1F`; `ROLE_DISCOVERY=FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Current-source pin checked 2026-08-11: WebKit main `d8e1779cc82b74f6663e2014b4e499238c553694`.
- This is a desk-only discovery review: no build, cache generation, trace download, benchmark, Stage0/A/B creation, or shared-file edit.

Missing current-source closure is `NOT_ADMITTED_UNFROZEN`, never a resource/readiness inference. A measured cliff is required before any N3 claim.
