# Command log

All filesystem commands were read-only except additive creation inside this assignment directory. No source/archive content was downloaded, and no witness/candidate/baseline/natural run was started.

| ID | Command/action | Result |
|---|---|---|
| C01 | read and SHA-256 `MAINLINE_ASSIGNMENT.yaml` | assignment frozen; hash `4E4CAEFE…0A51` |
| C02 | complete minimum-entry read: AGENTS, plan, registry, candidate rule, ARS router/experiment/repro workflow and templates | scope and fail-closed semantics confirmed |
| C03 | targeted live-registry semantic check | lane/topic/assignment/write directory/StageB=false match; shared registry drifted mechanically during dispatch |
| C04 | read/hash revision1 and independent closing inputs | 8/8 match |
| C05 | official GitHub commit endpoint for `ba5bccf` | full commit `ba5bccfe…b4ba`, valid signature |
| C06 | official Git tree traversal `root → llvm → lib → Target → RISCV` | complete untruncated tree metadata; 13 decisive blob pins retained |
| C07 | official immutable git-commit endpoint and commit revalidation | commit/tree/date/signature and response hashes retained |
| C08 | local PATH/tool/source inventory | no PATH LLVM; only non-exact toolchains/source tree found |
| C09 | `git hash-object` on 13 local decisive source copies | 11 match; exact Zcmp grammar and TargetMachine source absent |
| C10 | additive creation of provenance, fidelity, blocker, report and handoff files | no shared/upstream file modified |

## Network attempts

- First sandboxed PowerShell request failed during TLS receive.
- First sandboxed `curl` tree request failed with `SEC_E_NO_CREDENTIALS`.
- Approved official API route then succeeded. One root-tree response was fetched again after the local PowerShell runtime lacked `SHA256.HashData`; the corrected local hashing path used `SHA256.Create`.
- Successful JSON body total: 111,029 bytes, far below 10 MiB.
- No retry changed the endpoint/object, and no source/blob/archive content endpoint was called.

## Execution controls

- Witness hard-timeout/monitoring was never armed because the PRE_CLAIM gate did not pass.
- Auto-retry of a scientific run: none.
- Process killed: none.
- Exact diagnostic CPU/RSS: unavailable and not estimated.

