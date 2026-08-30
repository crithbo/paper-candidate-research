# Source29 current-union / collision matrix

| Locator | Exact object | Current union or contrary evidence | Residual decision |
|---|---|---|---|
| nextpnr iCE40 | stock JSON+PCF to ASC/bitstream | official flow exposes pack, place, route and write output; generic backend exists separately | `LOCATOR_ONLY`: no named iCE40-native action survives the generic-P&R test. |
| OpenROAD local repair | stock RTL-to-GDS/ODB/DEF with DRC/timing semantics | official flow enumerates placement, resize/buffer, detailed placement, timing repair, global/detailed route | `LOCATOR_ONLY`: proposed action is an existing chain or trigger, not N2. |
| RgGen CSR generation | register-map to several output backends | official tool intentionally supports formats/plugins and multiple emitters | `EXCLUDED_BEFORE_RAW`: generic multi-backend generator, no fixed stock oracle. |
| CIRCT/FIRRTL generic lowering | hardware IR to Verilog | not promoted after offline seed because it is a general compiler/formal wrapper | `GENERIC_SHELL` before evidence. |
| OpenROAD repair-cost cliff | public RTL-to-GDS corpus | no carrier/estimand and causal mechanism was precommitted | `RQ_BACKLOG`: not an N3 entry. |
| generic FPGA recourse theorem | unspecified FPGA architecture | no public exact checker/carrier frozen | `RQ_BACKLOG`: generic matching risk. |

Search boundary: official repositories/docs only, retrieved 2026-08-14. No direct-newness or implementation-absence claim is inferred from non-promotion.
