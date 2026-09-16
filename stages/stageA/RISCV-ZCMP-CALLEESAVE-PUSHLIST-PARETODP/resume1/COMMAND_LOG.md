# Command Log

This is a compact audit log; raw stdout/stderr are retained under `runs/`.

1. Verified assignment and authorization hashes, parent immutable package, exact commit and two required Git blob identities.
2. Retrieved the exact official LLVM archive and portable bootstrap assets; verified bytes, SHA-256, license/provenance and 13/13 decisive source blobs.
3. Configured and built exact LLVM/LLD with `RISCV;X86`, Release assertions and two jobs. One earlier configure attempt lacking the libc subtree is retained as an engineering failure. The successful build completed 2,160/2,160 steps.
4. Ran exact Plan P and Plan S through MachineVerifier, `llvm-mc`, `ld.lld`, `llvm-readobj`, and `llvm-objdump`; checked symbol sizes and unwind rules.
5. Ran `zcmp_frontier_planner.py selftest --max-w 4`; exact DP and independent Cartesian oracle agreed.
6. Ran all five witness materializations through `llc -start-before=greedy -verify-machineinstrs` and executed the 18-arm witness union.
7. Froze official Embench-IoT `embench-1.0` at commit `0466a18e4f6b47e19598d7c6ba72916d54b68f65`; compiled the frozen 23 C translation units to shared LLVM IR.
8. Initial `make_pregreedy_modules.ps1` stopped because Windows PowerShell promoted nonfatal unknown-negative-feature stderr to an ErrorRecord. The script was mechanically corrected to use native exit codes; 24 directory entries then completed, including one retained CRC smoke duplicate.
9. Ran result-independent MIR screening. A first direct extraction of one MachineFunction retained unrelated IR definitions and caused an LLVM assertion in a control run. This control carries no conclusion. Built exact-commit `llvm-extract`, extracted each target function with dependencies as declarations, and regenerated complete single-function pre-greedy MIR.
10. The first natural-pilot attempt completed two functions then stopped when `freeecc` no longer had a cross-call virtual register after exact single-function replay. The partial directory is retained and was not overwritten.
11. Ran `run_natural_pilot.ps1` into new `runs/natural/pilot_final`: 11/11 candidate plans and 72/72 current-union arms completed the exact five-step native chain.
12. Re-screened using `MODULE_FREEZE.json` as an allowlist: 23 canonical modules, 273 functions, the same five initial eligible functions. Ran deterministic `analyze_natural_pilot.py` and produced the registered paired summaries.

No Stage B, system install, global environment modification, target/commit substitution, source patch or MachineVerifier bypass occurred.
