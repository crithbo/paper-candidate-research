# Stage A owner report

## Decision

- Topic: `LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY`
- Assignment: `STAGEA-L3-20260815-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-RESUME2-NONSECURITY-CORPUS`
- Owner recommendation: `BELOW_Q2_STOP`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `STAGEA_DIRECTIONAL_RISK_PILOT_ONLY`
- Scientific revision consumed: `false`
- Stage B authorized: `false`
- Finality: owner recommendation only; independent Stage A gate required.

## What was established

The inherited fidelity gate and 3,072-arm current-union grid were hash-verified and reused without rerun. The new claim-bearing observation used exactly the frozen 30 LLVM compiler-rt builtins call sites and allowlisted `n01..n15` bitcodes. Every failure or inapplicable site remained in the denominator.

One legal candidate action at `__do_fini` made one call-site parameter reconstructible via RBX. MachineVerifier, native writing, DWARF verification, unwind reading and an executed Linux SysV behavior replay all passed. This is a real same-object positive, not a proxy.

## Why the owner recommends STOP

The positive is too sparse for the pre-registered natural mechanism claim. Only 1/30 frozen sites improves; the executable subset is 1/18. Reconstructibility gain has p50=0 and p90=0 in both views. The candidate therefore fails the natural nontrivial-boundary killer and does not sustain the minimum Q2 paper shape under the frozen contract.

This conclusion does not come from the earlier platform interruption, a resource shortage, the 11 native round-trip failures alone, or any invalidated engineering run. It comes from the corrected, accepted run04 natural observation plus the full-cost/behavior checks. The lone positive and every limitation are preserved for independent audit.

## Fidelity and fairness audit

- Atomic action mapping: native allocation-time `%3 -> RBX -> RDI`; no postprocessor or emitter-byte patch.
- Native codec/reader parity: exact LLVM commit and native object/DWARF/unwind paths inherited from the passed gate.
- Comparator semantics: complete frozen current union reused by exact hash; 3,072 successes and zero reconstructible arms on its witness.
- Common denominator: all 30 result-blind sites, including 11 native baseline round-trip failures and one mapping mismatch.
- Small witness: upstream legality/equivalence and exact bounded-plan witness passed; it was not used as natural PASS evidence.
- Behavior: sole positive passed 3+30 executions per arm; emulator wall latency is control-only.
- Full cost: planner, writer, reader, bytes, RSS and available wall/CPU coordinates are reported; unobservable native cycles are not imputed.

## Scope and integrity

No network acquisition, install, global environment mutation, excluded-corpus inspection, Stage B work or shared-control write occurred. Runs 01–03 and the overly strict byte-identity control are explicitly invalidated and retained. All subsequent corrections stayed inside the frozen scientific contract, so the scientific revision was not consumed.

## Required next action

Route this immutable owner package to an independent Stage A gate. Only that gate may accept or reject the owner recommendation and only an independent gate PASS could count toward the mainline target. Do not start Stage B.
