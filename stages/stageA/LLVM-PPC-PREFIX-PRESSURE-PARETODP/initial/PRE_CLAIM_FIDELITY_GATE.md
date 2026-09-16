# PRE_CLAIM_CONTRACT_FIDELITY_GATE

- Assignment: `STAGEA-L2-20260811-LLVM-PPC-PREFIX-PRESSURE-PARETODP-INITIAL-V8.7`
- Required LLVM pin: `f127b4c19c63b0492fb924934e37e032c17ea35b`
- Gate result: `FAIL_CLOSED_RESOURCE_BLOCKER`
- Claim-bearing observation: `false`

| Gate | Required evidence | Status | Reason |
|---|---|---|---|
| F1 exact direct witness | Exact `dso_local`/hidden, non-GOT `R_PPC64_PCREL34` direct `PLDpc` and `PADDI+LD` reproduction | **BLOCKED** | No exact-commit LLVM executable/source build with PowerPC/MIR/MachineVerifier is present. |
| F2 native validation | assembler, typed relocation/addend, disassembly, lld, DWARF/unwind, semantic equivalence | **NOT STARTED** | Requires F1 exact artifacts and the same pinned MC/lld tools. |
| F3 complete current union | current form selection, greedy/PBQP RA, spill/frame, default-on peepholes, MC/lld relaxation and finite legal grid | **NOT STARTED** | Native same-information behavior cannot be replayed without the pin. |
| F4 PPC-TPD tiny oracle | exhaustive native-trace successor/frontier and future-action/cost-preserving merge equality | **NOT STARTED** | The native action alphabet must first be executable and audited by F1–F3. |
| F5 full cost | model/optimizer/compile/link/verification/runtime CPU/RSS, bytes, spills, relocs and static uops | **NOT STARTED** | No accepted action or comparator run exists. |

The Stage0 witness and quotient are static certificates only. They are not promoted
to a StageA compiler output. No GOT object, different LLVM version, generic solver,
register-renaming proxy, handwritten emulator or post-result parameter choice was
used. The 10–20-function natural probe is therefore prohibited.

This gate state permits only a resource blocker. It supplies no scientific PASS,
STOP or reserve evidence.

