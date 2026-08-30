# Rule freeze — WAVE315

- assignment: `DISCOVERY-S6-20260811-V8.7-WAVE315-ARROW-RS-LEXSORT-INTERLEAVE-MATERIALIZATION-DEPTH`
- method: `v8.7+R5-P0`; quality mode OFF.
- verified controls: AGENTS `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; plan `DE7DD078D965A3596DAFE48E7652456DA29D570240A595D37BF71EAB2C63991F`; registry `8CDECB78DEEBA43BCD67CD3E5D0948B81DD17DA1EFDA4BFFEBE3F21D6BA56AEA`; ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- exact object: same Arrow arrays, null/order semantics and lexsort/interleave equality under the stock Arrow-RS oracle.
- isolation: this is array-compute only and does not reuse the earlier Arrow IPC stream/dictionary object or any conclusion from it.

