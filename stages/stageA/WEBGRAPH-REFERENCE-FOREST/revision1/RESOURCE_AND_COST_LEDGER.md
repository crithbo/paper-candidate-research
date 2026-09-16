# WEBGRAPH-REFERENCE-FOREST Revision1 Resource and Cost Ledger

| Resource | Frozen ceiling | Observed/accounted | Status |
|---|---:|---:|---|
| Network | 0 B | 0 B | PASS |
| Added disk | 2,147,483,648 B | 1,388,302,922 B before final reports/manifest | PASS |
| CPU | 7,200 CPU-s | measured experiment subprocesses 160.234 CPU-s; conservative all-build/controller upper bound <2,550 CPU-s (<0.71 CPU-h) | PASS |
| Peak claim build RSS | budgeted within host scope | 66,523,136 B | PASS |
| Peak reader RSS | budgeted within host scope | 9,740,288 B | PASS |
| GPU/exclusive device | forbidden | none | PASS |
| System/global mutation | forbidden | none; process-local PATH/CARGO_HOME only | PASS |
| Stage B/projects | forbidden | none | PASS |

The CPU upper bound charges both Cargo build wall intervals at all 32 logical processors, adds exact measured candidate/baseline/reader subprocess CPU, and conservatively charges the single-threaded PowerShell/Node controllers. It is intentionally above observed CPU and still below the 2-hour ceiling.

## Measured scientific execution CPU

| Phase | CPU |
|---|---:|
| 2,048-case preclaim structural replay | 102.188 s |
| Four-track preclaim natural replay | 6.500 s |
| 44 claim build/validate runs | 48.859 s |
| 44 claim reader runs | 2.688 s |
| Total directly measured | 160.234 s |

Claim build/validate elapsed summed to 51.348 s and reader-process elapsed to 4.542 s. All acquisition cost is zero because no network call or download occurred. Frozen parent assets were read in place; all new outputs, caches and builds are inside `revision1`.

