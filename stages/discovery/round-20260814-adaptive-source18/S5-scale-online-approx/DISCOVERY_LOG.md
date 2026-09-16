# Discovery log — S5 Source18

## Frozen assignment

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE18-FRESH-PROBLEM-EVIDENCE-V2`
- Profile: `FRESH_PROBLEM_EVIDENCE_ROTATION_V2`; canonical v8.7, V9 OFF.
- Result: `COMPLETE_ONE_PROPOSE_STAGE0__QEMU_TCG_BOUNDED_RECOURSE_CODE_CACHE_CONSTRUCTOR`.
- All network-security, vulnerability, attack/defence, exploit, protocol-security and malicious-traffic families were excluded before locating.  The active Source17 Verilator identity was also excluded.

## Locator / raw screen (6 of 8; no backfill)

| ID | Rotation origin and independent anchor | Current union / independent subtractor | Carrier and oracle | D1 / disposition |
|---|---|---|---|---|
| R1 QEMU TCG code-cache capacity | Official multi-thread TCG document specifies a shared code-generation buffer and full translation flush on capacity; page change has granular invalidation | full flush, page-scoped invalidation, direct-jump reversal, linked-list/cache updates, `tb-size`, TCG thread modes | QEMU functional/unit/QTest framework; public system/user emulation tests | D1; deep 1; brief |
| R2 GHDL delta/event simulation | Official GHDL runtime fixes VHDL time/delta stopping and assertion semantics | current runtime/event execution modes | GHDL testsuite / VHDL assertions | D1; deep 2; drop as generic event-calendar scheduling |
| R3 Yosys/ABC synthesis | source-pinned technology-map union | prior reviewed Yosys/ABC action union | equivalence tests | historical/active; pre-raw exclusion |
| R4 OpenROAD placement | legal placement route | native legalizer/DRC | LEF/DEF corpus | generic solver/layout; pre-raw exclusion |
| R5 QEMU TCG flag tuning | current `tb-size`, thread and trace controls | same current QEMU union | QEMU tests | configuration selector; drop |
| R6 Btrfs relocation | online relocation problem | stock balance/relocation union | filesystem checker/workloads | generic migration; drop |

The second D1 was deliberately retained as a negative depth review.  No third object was introduced after that outcome.

## Deep review conclusions

### R1 QEMU TCG

Exact object: current QEMU TCG system/user emulation of a fixed guest, target CPU state, exception mapping and guest-visible execution result.  The official multi-thread TCG document states that the whole system shares one code-generation buffer and a full buffer forces a flush of translations; the same document describes page-triggered granular invalidation, direct-jump reversal, lookup-cache and page-list maintenance, plus required vCPU quiescence for global-structure changes.  This makes the capacity cliff a source-supported problem anchor, not a future-work assertion.

Candidate atomic action: a code-cache-pressure admission action that migrates a bounded set of live translation blocks into a fresh, region-indexed code-cache area, repairs all recorded direct-jump, host-PC/guest-PC, page-list and lookup-cache references at a quiescent boundary, and retains all remaining blocks.  It differs from a policy because it is a complete invariant-preserving translation-block representation transition.  Its target-specific theorem obligation is exact guest/exception equivalence and bounded number of moved/invalidated TBs per admission; its conditional online/approximation comparison may use only prior TCG profiling, with the full-flush union as fair same-information baseline.

### R2 GHDL

Exact VHDL time/delta and assertion semantics plus the GHDL runtime give a stock semantic oracle, but the named action reduces to generic event-calendar ordering.  No target-specific invariant-preserving representation action and theorem/certificate was frozen without changing simulation object or becoming a scheduler wrapper.

Disposition: `DROP__GENERIC_SCHEDULER_ACTION`.

## Primary-source snapshot

- QEMU, [Multi-threaded TCG](https://www.qemu.org/docs/master/devel/multi-thread-tcg.html), [Translator internals](https://www.qemu.org/docs/master/devel/tcg.html), current source/documentation snapshot 2026-08-14.
- QEMU, [testing](https://www.qemu.org/docs/master/devel/testing/main.html) and [functional testing](https://www.qemu.org/docs/master/devel/testing/functional.html), stock checker route.
- GHDL, [runtime simulation](https://ghdl.github.io/ghdl/using/Simulation.html) and [current repository](https://github.com/ghdl/ghdl), source and oracle snapshot.

No source was run, downloaded, built or modified.  The QEMU brief is a structural-potential proposal with a finite closure plan, not evidence of a realized cost or speedup.
