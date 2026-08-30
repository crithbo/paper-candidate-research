# PRE_CLAIM_CONTRACT_FIDELITY_GATE

- Assignment: `RESOURCE-STAGEA-L3-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-RESUME1`
- Decision: `PASS`
- Closed at: `2026-08-14T16:10:00+08:00`
- Claim-bearing natural observation started before PASS: `false`
- Scientific revision consumed at PASS: `false`
- Evidence represented here: fidelity and small-witness evidence only

## Atomic-action mapping

`scripts/zcmp_frontier_planner.py` operates on the frozen one-call scalar pre-RA MIR class. Its state retains each cross-call virtual-register identity, native location, the ordered fixed Zcmp CSR prefix, list-dependent stack adjustment, residual native spill slots, CFA/CFI restore obligations, future call clobber and the cost vector. A CSR action is materialized as a physical pre-RA assignment; a spill action is inserted as a native pre-RA stack object with store/reload. The unmodified exact LLVM continuation performs remaining allocation, FrameLowering, fixed rlist/adjust selection, CFI, late POPRET, pseudo expansion and native encoding. It is neither emitted-object rewriting nor an alternative codec/reader.

The planner enumerated all five legal identity-preserving actions for the two-value witness. All five materializations passed the exact `llc -start-before=greedy -verify-machineinstrs` continuation. The independent Cartesian oracle and the DP agree exactly for every width `w=0..4`: legal-plan counts `1,2,5,16,65`; retained identity-preserving Pareto counts `1,1,2,6,24`.

## Native codec, writer and reader parity

Both frozen complete plans use LLVM commit `ba5bccfe...b4ba`, `riscv32-unknown-elf`, RV32IMAC+Zcmp, ILP32 and O2. Plan P and Plan S both pass MachineVerifier. The stock assembly path emits respectively:

- P: `cm.push {ra,s0-s1},-16`, no spill, `cm.popret`, symbol text 18 bytes;
- S: `cm.push {ra,s0},-32`, `sw a1,0(sp)` / `lw t0,0(sp)`, `cm.popret`, symbol text 22 bytes.

Both assemble with exact `llvm-mc`, link with exact `ld.lld`, disassemble with exact `llvm-objdump`, and parse with exact `llvm-readobj`. Linked `.eh_frame` gives P: CFA `sp+16`, `ra@-12`, `s0@-8`, `s1@-4`; S: CFA `sp+32`, `ra@-8`, `s0@-4`, with no fictitious `s1`. The same IR declaration, call-clobber model, return `x+y`, ABI and unwind object are preserved.

## Comparator semantics and complete frozen union

The executable current union has 18 same-information arms: default, explicit greedy, basic, fast, target hints on/off, target cost-per-use on/off, CSR cost scales 0/80/160, first-use costs 0/1/8/32, representative joint costs and shrink-wrap on/off. All feed the same exact downstream FrameLowering/PushPop/assembler/linker/readers. Frame-pointer, dynamic-frame, shadow-stack and save/restore-libcall paths remain excluded for the frozen witness because enabling them changes its declared object, while those source paths are recorded in the catalog.

All 18 arms executed successfully on the gate witness. Seventeen emitted Plan P at 18 text bytes; fast emitted a legal `{ra},32` spill realization at 22 bytes. Thus the current union already contains the witness's best candidate coordinate; the witness supports legality and fidelity only and is not treated as residual evidence.

## Common denominator and full cost

Candidate and union share the same input IR/MIR, call clobber, target/features/ABI/O2, native writer, assembler, linker and readers. The registered denominator includes complete function symbol bytes, complete native frame, every spill/reload byte and dynamic action, `.eh_frame` bytes/rules, planner plus continuation CPU/wall/RSS, comparator CPU/wall/RSS, per-arm temporary bytes, verification and fallback/rejection. The union gate run collected end-to-end CPU/wall/peak working-set/artifact bytes for each arm. Runtime is only admissible when the identical observable function can be executed; otherwise it is explicitly unavailable, not estimated.

## Small witness and gate disposition

The frozen `0(sp)` Plan S and the P plan pass verifier, assembly, linking and unwind checks. The tiny DP/oracle match, five candidate actions' native continuations, full current-union grid and full-cost collection path close every preclaim obligation. The gate is therefore `PASS`. Natural/corpus measurements after this timestamp may carry Stage A evidence; earlier resource, source-audit and witness artifacts cannot by themselves support PASS or STOP.

