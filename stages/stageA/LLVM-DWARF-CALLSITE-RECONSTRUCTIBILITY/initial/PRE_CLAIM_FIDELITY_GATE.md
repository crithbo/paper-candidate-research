# PRE_CLAIM_CONTRACT_FIDELITY_GATE

- Assignment: `STAGEA-L3-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-INITIAL-V8.7`
- Status: `FAIL_CLOSED__BLOCKED_USER_ACTION_REQUIRED`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation started: `false`
- Scientific revision consumed: `false`

The gate did not fail scientifically. It could not be executed with the exact pinned native construction and reader path because the required local toolchain/source/runtime assets are absent. Non-exact local LLVM assets were inventoried but were not used on the witness.

## Obligation-by-obligation result

| Frozen obligation | Atomic/native mapping to be verified | Result | Evidence boundary |
|---|---|---|---|
| Materialize and MachineVerify the declared MIR witness | identical pre-RA `%sum`; non-entry `bb.1`; fixed RDI argument/regmask; native X86 allocation and `-verify-machineinstrs` | `NOT_RUN__EXACT_X86_LLC_MISSING` | no MIR/object output exists |
| Verify executable behavior and call ABI | native X86 code, same call argument/value, target object/link/run route | `NOT_RUN__TARGET_EXECUTION_ROUTE_MISSING` | no behavior or ABI conclusion |
| Verify unwind/CFI and DWARF | native CSR save/restore, PEI/frame lowering, target CFI emission, exact-commit `llvm-dwarfdump`/object reader | `NOT_RUN__EXACT_WRITER_AND_READERS_MISSING` | no Plan-B legality conclusion |
| Enumerate tiny native action catalog | caller-saved, first CSR use, copy/coalesce, legal spill/reload, recognized rematerialization, entry-value eligibility, unavailable | `DECLARED_ONLY__NOT_EXECUTABLY_ENUMERATED` | Stage 0 static catalog retained as input, not upgraded |
| Map complete current union at the pin | X86 RA/coalescing/copy/split/spill/reload/CSR; InstrRef lifecycle; LDV; DwarfDebug; legal config grid | `NOT_CLOSED__EXACT_SOURCE_AND_BUILD_MISSING` | no absence or absorption inference |
| Bind full-cost/common denominator | frozen in `EXPERIMENT_CONTRACT.yaml`: reconstructibility, text/DWARF bytes, CSR/CFI/spill, compile CPU/wall/RSS, runtime, verification/fallback | `SPECIFIED_BUT_COLLECTOR_UNTESTED` | no cost measurement |
| Small legality/equivalence/object-identity witness | Plan A RAX-unavailable vs Plan B saved-RBX/breg under same MIR/ABI/behavior | `NOT_REPLAYED` | cannot support PASS or STOP |

## Atomic-action mapping status

The intended mapping is allocation-time selection in the pinned X86 allocator and target hooks; CSR save/restore/frame/CFI completion in the native prologue/epilogue path; location propagation through the compatible instruction-reference/`LiveDebugValues` lifecycle; and call-site observation through the pinned `DwarfDebug::collectCallSiteParameters` path. This is the correct frozen mapping, but every mapping remains `UNVERIFIED_AT_EXACT_COMMIT` because the only local source copy and custom build bind to another commit.

## Native writer/reader parity

No non-native codec or proxy was used. Native parity is unresolved rather than approximated. The LLVM 22.1.8 writer/readers and the LLVM 24 AMDGPU-only build are explicitly classified as `VERSION_OR_TARGET_MISMATCH_CONTROL_NOT_RUN`.

## Comparator semantics

The comparator remains the complete compatible current union in `EXPERIMENT_CONTRACT.yaml`. No arm was omitted or weakened; instead, all comparator and candidate execution was withheld because its exact implementation was unavailable.

## Common denominator and full cost

Units and process boundaries are frozen before any run. They were not measured because the gate failed before witness execution. No static byte model, hand-written DWARF, or different-version output is substituted for actual allocator, writer, reader, CPU, RSS, executable, or fallback measurements.

## Small witness

The declarative witness from Stage 0 is preserved, but there is no materialized valid MIR, MachineVerifier result, ELF/object, unwind dump, `llvm-dwarfdump` output, or behavior replay at the exact commit. Therefore the required small-witness predicate is false.

## Gate disposition

`FAIL_CLOSED__RESOURCE_BLOCKED`, not `SCIENTIFIC_FAIL`. Under the frozen rules this requires a blocker package, forbids the natural corpus pilot, and leaves the scientific revision unused.

