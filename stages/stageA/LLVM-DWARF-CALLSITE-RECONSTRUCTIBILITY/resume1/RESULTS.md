# Results

## Disposition

`BLOCKED_USER_ACTION_REQUIRED__RESOURCE_GATE_ONLY`

- Claim-bearing observations: `0`
- Scientific revision consumed: `false`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- PRE_CLAIM: not started
- Stage B: false

## Valid resource observations

| Observation | Result |
|---|---|
| Official commit identity | API returned exact `e72ba6cf366a3180cbf5a8690d9e50665880ab76`, tree `d9b82c…e260` |
| Source archive | 280,594,592 bytes; SHA-256 `643B7011…814C`; Apache-2.0 WITH LLVM Exceptions |
| Decisive source parity | 7/7 archive-member/extracted hashes match |
| Minimal build | Release, assertions, X86 + Clang, six tools; 3137/3137; exit 0 |
| Tool target | `llc` lists x86 and x86-64 |
| Native smoke | ELF64 x86-64 System V; `opt verify`, dwarfdump verify, readobj and objdump all exit 0 |
| Linux execution | unavailable: no existing WSL/container/runner; qemu-user cannot translate Windows host syscalls into Linux syscalls |

The generic reader smoke has object SHA-256 `B4938EB…ACA9` and is a control only. It does not exercise the frozen RAX/RBX witness.

## Resource cost

- Stored asset response bytes: 280,600,777 (commit JSON + source archive).
- Final resume1 storage before report sealing: 4,761,703,433 bytes, leaving 8,123,198,455 bytes under the 12 GiB ceiling.
- Successful build wall: 2,284.686 seconds at `-j2`; extraction wall: 220.780 seconds; successful configuration wall: 90.366 seconds.
- Exact aggregate process-tree CPU/RSS was not exposed and is not estimated. A concurrency-and-wall upper bound keeps all build attempts below 2 CPU-hours, below the 8 CPU-hour ceiling.
- System installations/global PATH or registry changes: 0.
- Scientific source patches: 0.

## Unsupported claims

No evidence is available about Plan A unavailability, Plan B reconstructibility, MachineVerifier legality, same-object executable equivalence, current-union residual, the DP frontier, natural prevalence or scientific full cost. No scientific negative inference is permitted.
