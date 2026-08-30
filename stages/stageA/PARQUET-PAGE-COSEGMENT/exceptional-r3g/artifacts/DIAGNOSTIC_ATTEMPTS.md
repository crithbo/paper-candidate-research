# Fail-closed diagnostic attempts

Three pre-result natural attempts were retained rather than rewritten. Each stopped before `result.json` creation and left only the already selected strongest-union output for the first frozen file.

| Directory | Disposition | Retained output SHA-256 | Bytes |
|---|---|---|---:|
| `replay1` | serial complete-family enumeration crossed the 120-second boundary; interrupted | `FCADC8B15D2F5FDDE2D561E61BAA924F8903B01228D51119D484AC15B3F4D068` | 1,371,918 |
| `replay1_corrected` | two-worker equivalent materialization crossed the boundary; interrupted | `FCADC8B15D2F5FDDE2D561E61BAA924F8903B01228D51119D484AC15B3F4D068` | 1,371,918 |
| `replay1_final` | four-worker family passed; unchanged candidate exceeded 120 seconds; process failed closed before result | `FCADC8B15D2F5FDDE2D561E61BAA924F8903B01228D51119D484AC15B3F4D068` | 1,371,918 |

These artifacts are diagnostic continuity evidence only. All decision metrics use `replay1_complete` and `replay2`.

