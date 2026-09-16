# LLVM PPC r1 resource-gate command ledger

| Phase | Action | Outcome | Attempt effect |
|---|---|---|---|
| Bootstrap | Verify accepted ACK and MAINLINE START | PASS | no resource attempt |
| Directories | Create eight standard resource directories | PASS; initially 0 files/reparse | gate started |
| Long-path preflight | Nonpersisting 473-character extended-path write/read | PASS | before network |
| Asset 1 | Official GitHub exact commit metadata GET | PASS, 6,641 bytes | 1/1 |
| Asset 2 | Official codeload exact source archive GET | PASS, 280,166,423 bytes | 1/1 |
| Asset 3 | Official GitHub LLVM-MinGW release GET with redirects disabled | HTTP 302; redirect observed but not followed | FAIL 1/1; first blocker |
| Asset 4/5 | CMake and Ninja official PyPI | NOT ATTEMPTED after blocker | 0 attempts |
| Archive/extraction | Safe member validation and source/tool extraction | NOT STARTED | 0/1 each |
| Configure/build | PowerPC+lld configure and `-j2` build | NOT STARTED | 0/1 each |
| Package/smoke | Seven tools and permitted nonclaim smokes | NOT STARTED | 0 observations |
| Closeout | Inventory, blocker, retention, capsule, handoff and manifest | completed; no deletion | MAINLINE cleanup only |

No automatic retry, PPC F1–F5, direct witness, natural/performance/full-cost/claim run or state transition occurred.

