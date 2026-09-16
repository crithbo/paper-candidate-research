# PRE_CLAIM_CONTRACT_FIDELITY_GATE

- Assignment: `RESOURCE-STAGEA-L3-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-RESUME1`
- Resource gate: `PASS`
- PRE_CLAIM status: `PASS`
- Gate closed before claim-bearing current-union/natural runs: `true`
- Claim-bearing observations at gate closure: `0`
- Scientific revision consumed at gate closure: `false`
- Stage B: `false`

## Resource predicates

| Predicate | Result | Decisive evidence |
|---|---|---|
| Exact LLVM commit / decisive blobs | `PASS` | official API resolves `e72ba6cf…`; archive SHA-256 `643B7011…814C`; 7/7 decisive extracted blobs match archive members |
| X86 target and exact native tools | `PASS` | exact-source assertions build; X86/x86-64 registered; Clang, llc, LLD, dwarfdump, objdump, readobj and opt frozen by hash |
| Native writer/readers | `PASS` | exact Clang/LLD emit ELF64 SysV; exact opt/dwarfdump/readobj/objdump verify/read it |
| Linux SysV executable behavior | `PASS` | official portable Blinkenlights APE hash equals its published SHA-256 `D8D5E09A…B9F69`; exact-source no-libc ELF executes Linux `exit_group(231)` with exit 0 |

The initial QEMU check remains a failed resource-control route. It is superseded by the authorized portable user-mode emulator route and carries no scientific inference.

## Atomic-action mapping

`bounded_call_cut_dp.py` retains the frozen state tuple `(location, alias/clobber, frame/CFI, forwarding source class, entry eligibility, full-cost vector)` and enumerates the complete tiny catalog. `generate_tiny_witness.py` maps its RAX and RBX actions into native pre-emission MIR. On the same exact pre-RA semantic call-cut, `inject_candidate_hint.py` realizes the retained RBX action by expanding only `%sum -> EDI` into `%sum -> EBX -> EDI` before greedy RA/PEI. Native PEI then discovers the CSR, inserts save/restore and emits CFI; no emitted object or DWARF is patched.

- semantic value/CFG/call regmask/debug records: unchanged;
- call remains in non-entry `bb.1`;
- target/ABI/writer/reader/format: unchanged;
- candidate action is native code and allocation-time location retention, not a metadata postprocessor.

## Native codec/reader parity and small witness

Both RAX and RBX plans pass exact-commit MachineVerifier, object emission, DWARF verification, unwind reading and linked Linux behavior. Both linked programs return success on the same arguments. The native reader reports:

| Coordinate | RAX plan | RBX plan |
|---|---:|---:|
| linked `.text` bytes | 80 | 80 |
| linked debug-section bytes | 963 | 979 |
| linked `.eh_frame` bytes | 52 | 60 |
| call-site parameters | 0 | 1 |
| exact call value | unavailable | `DW_OP_breg3 RBX+0` |
| Linux behavior exit | 0 | 0 |

The DP frontier equals exhaustive enumeration on the two-action instance. RAX and RBX are both nondominated because RBX gains one reconstructible parameter while paying CSR/CFI/debug cost.

## Comparator semantics

The complete executable current union is frozen in `CURRENT_UNION_GRID.yaml`: all four registered allocators; allocator-specific greedy/PBQP toggles; the current CSR cost controls; explicit InstrRef/VarLoc modes; entry-value and shrink-wrap modes; bounded register-pressure, split-spill and spill-copy variants. Trace-changing controls are not candidate actions. Generic exhaustive selection is a tiny ceiling only.

Every union arm starts from the same frozen optimized bitcode `inputs/current_union_smoke.bc` SHA-256 `4A6DEA79…75D4`, so allocator replacement and InstrRef/VarLoc selection are genuinely executable rather than inert post-selection flags. The candidate starts from its exact derived pre-RA form `witness/current_union_prera.mir` SHA-256 `D778A6C0…3436` and differs only by the frozen native-copy expansion recorded by hash. Both paths therefore share the identical optimized IR, target, ABI, source-level value, CFG and call regmask; all outputs use the same exact native writer/reader and behavior harness.

An eight-arm exploratory probe attempted to replay all allocators from the derived greedy pre-RA checkpoint. PBQP has no registered legacy start-pass identifier and the checkpoint already freezes debug-location mode, so that probe is classified `INVALID_COMPARATOR_CONTROL__NO_SCIENTIFIC_INFERENCE`. The common-bitcode correction was frozen before any accepted claim-bearing observation and does not consume scientific revision.

## Common denominator and full cost

The denominator is the identical eligible call-site parameter set in the frozen MachineIR. Native collectors are bound for object/link bytes, `.text`, all debug sections, `.eh_frame`, CSR/save/restore instructions, compile CPU/wall/peak RSS, verifier/fallback, and fixed warm behavior latency. Failed arms count as failures; they are not silently removed. Candidate cost cannot be excused merely because it is mathematically nondominated.

## Gate decision

`PASS` after the common-bitcode comparator correction. Only executions after this corrected frozen gate may support a Stage A PASS/STOP/REVISE disposition. The gate proves fidelity and executability, not a natural-corpus benefit or a paper conclusion.
