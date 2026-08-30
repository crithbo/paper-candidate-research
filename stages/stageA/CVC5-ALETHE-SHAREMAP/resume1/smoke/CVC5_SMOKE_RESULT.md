# cvc5 1.3.4 Resource Smoke

- Assignment: `RESOURCE-UNBLOCK-L1-20260810-CVC5-R1`
- Claim-bearing: `false`
- Executable: frozen read-only upstream binary `cvc5.exe`
- Executable SHA-256: `FC71384CB2DBA76AD775CD6088DE76C3F4DB10BB1CC594FA4CFCD3110B576C3B`
- Executable size: `26,757,632 B`

## Version

- Exit code: `0`
- Identifying line: `cvc5 1.3.4 [git f3b21c4 on branch HEAD]`
- Reported compiler: `Clang 19.1.4`
- Result: `PASS`

## Fixed minimal UNSAT smoke

- Input: `minimal-unsat.smt2`
- Exit code: `0`
- Semantic output: `unsat`
- Result: `PASS`

The first PowerShell `Start-Process` wrapper invocation failed before process creation because the supplied environment map contained the case-insensitive duplicate keys `Path` and `PATH`. The same frozen executable and input were then invoked directly with no environment mutation. That invocation correction produced the successful results above. The empty `cvc5-*.stdout.txt` and `cvc5-*.stderr.txt` files are retained as evidence of the failed wrapper invocation and are not presented as the successful smoke transcript.

