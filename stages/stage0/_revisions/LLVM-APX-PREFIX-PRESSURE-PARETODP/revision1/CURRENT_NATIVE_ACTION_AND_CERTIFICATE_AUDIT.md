# Current Native Action and Certificate Audit

- Topic: `LLVM-APX-PREFIX-PRESSURE-PARETODP`
- Cutoff: `2026-08-11`
- LLVM pin: `a1194be1baefa99d20a09bd04b16056be0ab7225`
- Search disposition: `SEARCH_BOUNDED_OPEN`
- Evidence mode: pinned first-party source and original papers; no transport failure supports absence.

## Pinned first-party source boundary

| Source | Blob/source identity | Decision-bearing boundary |
|---|---|---|
| [X86CompressEVEX.cpp](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86CompressEVEX.cpp) | blob `be02c6375c0b50e872b2a96fbff4a0d380ab6a58` | redundant NDD tying/commutation; nonredundant ADD NDD becomes LEA only when no EGPR and EFLAGS dead; partial-write and relocation conditions matter |
| [X86TargetMachine.cpp](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86TargetMachine.cpp) | blob `932669b5cbac687d98dd46e812507e79501fb741` | suppression, allocator, PEI/post-RA/compression/pass ordering belong to the native comparator |
| [X86.td](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86.td) | blob `ab27fb0b6aa10cd4638d44248743af6c3bb1f24c` | EGPR/NDD and related APX features are separable, not one binary action |
| [X86InstrArithmetic.td](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86InstrArithmetic.td) | blob `c91600525d1eb7204f4469c9edecb5dec16fa0e5` | native destructive/NDD arithmetic grammar |
| [X86InstrInfo.cpp](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86InstrInfo.cpp) | blob `f41a68d7d17e0360560c4a428cd84443c8059320` | target commutation and instruction constraints |
| [X86Subtarget.cpp](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86Subtarget.cpp) | blob `ed2da3128b44af9a4c04144f05b81c947868f633` | 64-bit APX component parsing |
| [X86RegisterInfo.td](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86RegisterInfo.td) | blob `bafea74f3440364c6077b16bc87f489d34b1ae03` | `GR32_NOREX` is EAX/ECX/EDX/ESI/EDI/EBX/EBP/ESP; aliases, allocation order, and save classes prevent arbitrary bank symmetry |
| [APX add MC test](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/test/MC/X86/apx/add-att.s) | blob `97c0b036c4338b41ad7fb165e853af7797c5844a` | official NDD bytes and operand-field basis for the corrected derived tuple |
| [APX add CodeGen test](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/test/CodeGen/X86/apx/add.ll) | blob `8b1e1ceb832a3d5bf1654ddb990d8eefac621f53` | current no-flags ADD route can become LEA |

Additional first-party boundary sources are the [LLVM APX RFC](https://discourse.llvm.org/t/rfc-design-for-apx-feature-egpr-and-ndd-support/73031), [LLVM APX relocation-suppression source](https://llvm.org/docs/doxygen/X86SuppressAPXForReloc_8cpp_source.html), [GCC 16.1 x86 options](https://gcc.gnu.org/onlinedocs/gcc-16.1.0/gcc/x86-Options.html), [GNU binutils APX EGPR RFC](https://sourceware.org/pipermail/binutils/2023-September/129536.html), and Intel's [APX software-enabling document](https://cdrdv2-public.intel.com/784265/356112-intel-apx-sw-enabling.pdf).

Revision-time raw-source refetches failed with cache/transport errors. The pinned hashes above were already verified in the accepted PRIMARY source audit. The failure neither expands nor closes novelty.

## Current native action and finite-control completeness

| Family | Required catalog content | Comparator treatment |
|---|---|---|
| Instruction form | destructive legacy/REX, REX2/EGPR, EVEX NDD/NF, compatible LEA, partial writes | complete current actions; no candidate novelty claim |
| Local exposure | tying, commutation, coalescing, copy insertion/removal, current compression | complete current actions |
| Allocation | complete Greedy and PBQP arms, register classes/hints, split/spill/reload/rematerialization | same-input production baselines |
| Encoding | subregister aliases, byte/high-byte, `NOREX`/`NOREX2`, prefix/MC bytes, addressing | target legality and exact bytes |
| Whole-function obligations | fixed/reserved registers, EFLAGS, ABI, saves, PEI, frame, CFI/unwind, inline asm, relocation | same-object hard constraints and full cost |
| Finite controls | APX component features, relevant NDD-memory preference, relocation mode, allocator arm, declared target tuning | preregistered finite grid; target-changing arms are negative controls |

The candidate action space is not “what LLVM lacks.” It is the same complete finite native action set reorganized by a new exact algorithm/guarantee.

## Corrected witness audit

| Obligation | Status | Reason |
|---|---|---|
| EFLAGS produced by ADD live after the operation | `STATIC_CLOSED` | blocks LEA and NF substitution |
| both original sources live | `STATIC_CLOSED` | prevents allocation from tying destination to a dead source, even after commutation |
| destination distinct/interfering with both sources | `STATIC_CLOSED` | blocks redundant NDD compression |
| traditional no-REX 32-bit registers | `STATIC_CLOSED` | EAX/ECX/EDX are in pinned `GR32_NOREX`; two-byte legacy sizes are coherent |
| no memory/relocation/fixed-register side condition | `STATIC_CLOSED` | preserves the stated byte and legality boundary |
| same semantics/live-outs/ABI | `STATIC_CLOSED_AS_PROPOSITION` | NDD and MOV+destructive ADD compute the same sum/flags and preserve both sources |
| NDD bytes | `DERIVED__REPLAY_REQUIRED` | official `%r10d` MC row is transformed only in the NDD destination field; Stage A must assemble it |
| natural baseline miss or benefit | `UNKNOWN_STAGEA` | not claimed by the static witness |

## Certificate soundness audit

The accepted equivalence is not a bank partition. It is the orbit relation of only those whole-register-family transpositions that preserve the full suffix relation tensor. The audit must include all tuples, successor obligations, and declared costs. Singleton fallback is mandatory. Hence:

- different byte encodability, ABI role, alias graph, implicit operand, relocation legality, or future cost necessarily separates registers;
- any action from one representative is mirrored at the same cost from every equivalent representative and conversely;
- dominance pruning is performed only after canonicalization under a proven bisimulation; and
- no generic graph-automorphism, CP, ILP, or brute-force oracle is required as the candidate method. Exact enumeration remains an independent tiny-instance validator.

The nontrivial algorithmic claim is the target-table-to-certified-action-bisimulation compiler plus exact orbit-canonical Pareto DP. Standard symmetry reduction remains a methodological subtractor; claim ceiling is Q2 unless Stage A demonstrates meaningful natural APX-specific state/frontier behavior.

## Strongest comparator/action/guarantee map

| Comparator | Same information | Same semantics | Full cost | Guarantee/action ceiling |
|---|---:|---:|---:|---|
| complete pinned LLVM X86 chain | yes | yes | production + declared ledger | current scalar output; all native actions reachable through its composition |
| finite LLVM control/tuning grid | yes | yes | yes | multiple scalar outputs; subtracts routine tuning |
| same-trace Unison/generic exact solver | yes after fidelity closure | yes | solver CPU/RSS charged | absorbs generic integrated solving, not the target-specific state certificate by itself |
| labeled Pareto DP | yes | yes | yes | exact frontier, no quotient; degeneration comparator |
| exhaustive micro oracle | yes on tiny cases | yes | oracle-only | correctness/ceiling, never deployment baseline |
| candidate certified-orbit DP | yes | yes | yes | exact frontier with conservative target-specific state reduction |

The [Unison original paper](https://doi.org/10.1145/3332373) is a direct method-kernel subtractor. LLVM Greedy/PBQP and the [PBQP register-allocation paper](https://doi.org/10.1007/978-3-642-19861-8_4) subtract mature allocator optimization. Neither source, in the bounded reviewed set, provides the exact APX suffix-action certificate stated here. This remains `SEARCH_BOUNDED_OPEN`, not a claim of absence.

## Finite preclaim and scientific killers

1. Freeze source/build/action-catalog hashes and prove catalog coverage of current LLVM output.
2. Assemble/disassemble the witness and independently validate arithmetic flags and live-outs.
3. Exhaustively compare labeled and quotient transition/action-cost multisets on tiny traces; first mismatch kills soundness.
4. Require exact frontier equality with the tiny oracle.
5. On frozen public traces, stop if classes are effectively singleton, the preregistered state-reduction threshold fails, current LLVM/tuning exposes the same frontier, or full candidate cost destroys every residual.

No APX hardware is required for these first claim-critical observations. Hardware could raise a runtime-evidence ceiling later but is not a Stage 0 or Stage A fidelity dependency.

## Source/collision conclusion

- Current-source reality check: `MATERIALLY_CLOSED_AND_IN_CATALOG`.
- Old EFLAGS-dead witness: `REJECTED`.
- Corrected EFLAGS/source/destination/no-REX witness: `STATICALLY_LEGAL_PROPOSITION__ENCODING_REPLAY_PENDING_STAGEA`.
- Direct fatal collision: `NOT_ESTABLISHED`.
- Algorithmic residual: `CONDITIONAL_TARGET_SPECIFIC_EXACT_PARETO_STATE_REDUCTION`.
- Scientific recommendation: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`.

