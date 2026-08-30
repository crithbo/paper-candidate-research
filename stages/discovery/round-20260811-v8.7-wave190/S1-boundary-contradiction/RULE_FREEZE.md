# RULE_FREEZE

- assignment: `DISCOVERY-S1-20260811-V8.7-WAVE190-ARM-SME-ZA-CALL-STATE-DEPTH-REDTEAM`
- lens: S1 boundary contradiction / hardware-software ABI state contract
- frozen date: 2026-08-11 (Asia/Shanghai)
- authoritative revision: `v8.7+R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; R7 is dormant and not used.
- control hashes: `plan.md=513D9C3587B50DF6527ABE7FC40C00E0CA54D3526B2A51E2D4803F0B5DC38EAB`; `registry.yaml=4DD0993FCA66D517E3A758476362AD40629D732279E77DE7CBEC5CAFEAB890E5`; `rules/ROLE_DISCOVERY.md=FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- post-dispatch provenance only: mainline later reported `plan.md=B48C3588165ECC340F8577C2239A12B5E1D704D79DED6EC81059AD05F96382D3` and `registry.yaml=7976AF7F69528A13B317A7563637A584312E571272C7AD26AAACCFA1BC81EB83` after mechanically absorbing other-lane handoffs. No rule, contract, or write-boundary change applies to this package.
- scope: one existing Wave187 Arm SME seam only. No benchmark, execution, download, Stage0/A/B, or shared-control write occurred.
- admission rule: a brief requires a source-supported, same-program and same-PCS-guarantee whole-function/interprocedural N1/N2 outside the current compiler/runtime union, a natural carrier, full-cost denominator, and finite fidelity closure. Attribute choice, inlining/flag tuning, emulator patch, and ABI/ISA change are excluded.
- current-source rule: an implementation-absence claim requires a current source commit plus official docs, flags/configs, and counterevidence. A branch URL, release note, issue, or future-work text alone cannot establish absence.
