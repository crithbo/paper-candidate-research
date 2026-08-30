# Q1 Comparator Matrix

| Comparator/action | Same object and information | Executable at exact commit | Claim-bearing runs | Status |
|---|---:|---:|---:|---|
| Current `GCNSchedStrategy+greedy` | yes | small witness passed | 0 | mandatory baseline ready |
| `default_fallback` | yes | small witness passed | 0 | candidate safe fallback ready |
| occupancy bias 100 | yes | small witness passed | 0 | existing-knob subtractor ready |
| AMDGPU pressure trackers | yes | small witness passed | 0 | existing-knob subtractor ready |
| joint bias + trackers | yes | small witness passed | 0 | existing-knob combination ready |
| proxy scheduler/static estimator | no | not used | 0 | forbidden |

The matrix closes comparator identity but not the natural-input gate. No novelty or residual judgment is made.
