# Stage A results

## Outcome

Owner recommendation: `BELOW_Q2_STOP`, pending independent Stage A gate.

The candidate produced one genuine native positive, but it failed the pre-registered natural-prevalence killer. Across the immutable 30-site denominator, the reconstructibility gain is 1/30 (3.33%) and both p50 and nearest-rank p90 are zero. On the 18 executable paired sites it is 1/18 (5.56%), again with p50=p90=0. This is scientific evidence from the frozen natural corpus; it is not inferred from the earlier platform interruption or from resource availability.

## Gate and comparator continuity

- Resume1 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`: hash-verified `PASS`.
- Resume1 current-union result: 3,072/3,072 arms succeeded, 14 unique objects, 0 reconstructible arms. Resume2 reused this result read-only and did not rerun it.
- Natural freeze: 30 result-blind call sites, 15 allowlisted bitcodes, all under `compiler-rt/lib/builtins/`; hash `373D25F5238185F82B51225B00BA8058483CC44C9AD9AC27828D8AA23F7477EA`.
- No excluded corpus was read or enumerated.

## Paired natural results

| Disposition | Count | Denominator treatment |
|---|---:|---|
| Accepted native reconstructibility gain | 1 | Counted |
| Executable native pair with no accepted gain | 17 | Counted |
| Native baseline MIR round-trip/writer failure | 11 | Counted as required; not silently dropped |
| Frozen mapper/fidelity inapplicable | 1 | Counted as required |
| Total | 30 | Immutable |

The 11 native failures arise before candidate comparison because the exact current writer rejects the frozen call-site offsets during MIR round-trip. Site 28 is a frozen source-to-call mapping mismatch: the named source COPY belongs to the preceding call. These outcomes limit candidate fidelity coverage but are retained in the primary denominator.

## Sole accepted positive

- Site: `n02_crtbegin.bc`, `__do_fini`, basic block 2, call offset 3, argument register RDI, source `%3`.
- Atomic mapping: `%3 -> RBX -> RDI`, with unchanged CFG, call regmask and debug records; no post-emission patch.
- Native checks: MachineVerifier PASS; object writer PASS; `llvm-dwarfdump --verify`, DWARF reader, unwind reader and disassembly reader PASS.
- Reconstructibility: baseline 0 parameters; candidate 1 parameter with `DW_OP_breg3 (RBX)`.
- Paired size: object +16 B, text +0 B, debug payload +16 B, debug relocation +0 B, `.eh_frame` +0 B.
- Canonical objects: baseline `D6C1B72A8710E17150AEFA528821778F2B5B9E6EA3E88741CA74923AA6787ACC`; candidate `D22F56036792FBCC1089A22A674BD37E1CB92917135CEE8F494F63CC9AFE4672`.

## Executed behavior check

The sole positive was relinked in both arms with the same linkage-only harness control and replayed through the frozen Linux SysV runner. Each arm completed 3 warmups and 30 measured runs; all executions exited zero with empty stdout and stderr. Behavior equivalence is `PASS`.

Blinkenlights wall latency was baseline p50 1.2125 s / p90 1.2696 s and candidate p50 1.3479 s / p90 1.5063 s. These values are a control for deterministic execution only, not native-cycle evidence, and do not establish a performance claim.

## Full cost

- Reconstructibility gain, all 30: p50=0, p90=0, min=0, max=1.
- Reconstructibility gain, executable 18: p50=0, p90=0, min=0, max=1.
- Object delta, executable 18: p50=0 B, p90=+16 B.
- Text delta: p50=0 B, p90=+8 B.
- Debug payload delta: p50=0 B, p90=+16 B.
- Debug relocation and `.eh_frame` deltas: p50=p90=0 B.
- Writer wall delta: p50 +0.000139 s, p90 +0.004506 s.
- Reader wall delta: p50 -0.002395 s, p90 +0.011629 s.
- Planner wall: p50 0.000802 s, p90 0.003799 s.
- Canonical natural experiment process totals: 8.328125 CPU-s and 10.919263 s summed non-overlap child/planner wall. OS/app overhead not exposed by this environment was not estimated.

## Invalidated controls and corrections

Runs 01–03 are retained as invalidated non-evidence and were corrected without changing the object, mechanism, comparator, denominator or claim. The alloc-section byte-identity check is also invalidated because it forbids the legal instruction/relocation differences induced by the atomic action. None supports PASS or STOP. Scientific revision remains unconsumed.

## Killer decision and ceiling

`NATURAL_CORPUS_HAS_NO_NONTRIVIAL_BOUNDARY_AFTER_THE_GATE` is met: only one of 30 frozen sites improves and p50/p90 remain zero. The owner therefore recommends `BELOW_Q2_STOP`. Evidence ceiling is `STAGEA_DIRECTIONAL_RISK_PILOT_ONLY`; owner judgment is not final and must be reviewed by the independent Stage A gate. Stage B is not authorized.
