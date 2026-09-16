# LLVM-RVV-GROUP-MASK-SPILL-PARETODP Source and Collision Audit

- Assignment: `STAGE0-P1-20260811-LLVM-RVV-GROUP-MASK-SPILL-PARETODP-PRIMARY-V8.7`
- Role: independent Stage0 PRIMARY
- Cutoff: `2026-08-11`
- Search status: `SEARCH_BOUNDED_OPEN`
- Source policy: technical conclusions use current official upstream source/docs, official specifications, original papers/author artifacts and official venue pages. Search snippets were discovery aids only.
- No candidate experiment or benchmark was run.

## Control and input integrity

| Item | SHA-256 / result |
|---|---|
| `registry.yaml` | `88B1D221E35BCAEE7A0BC46997235F747D48F87A0FB151A633F4986E836BFCE2` |
| `plan.md` | `88551293C686C9245F352CDD1BA9C2CB1B5899734F6DA052350F8C23F7891C57` |
| Discovery `TOPIC_BRIEF.md` | `A685791F469B3687CCA828568369A3675FBE4734034BC6A45909188C464C7420` |
| Discovery `SOURCE_COLLISION_MATRIX.md` | `68D3EEEB1BA3D8A64845E50DBD35A6D8546B6149C90ED3DD60EDD45A29933F53` |
| Discovery `CANDIDATE_GRADE_DEEP_REVIEWS.md` | `0584B294DFD35CB0AEB9598C85A07846B36973773C97DAB9BE94DB23532213FD` |
| Discovery `handoff.yaml` | `A5E63B1232A46F3645B4AF8F31189D2627FC2B5336E4B17AD52076B9BD9B0EEB` |
| Discovery `HASH_MANIFEST.sha256` | self `8B8267B0AE29549CA49055E985920CFB84BE9C534AFA9DE104BD019F02B399A9`; 8/8 entries reproduced |

The two shared-control hashes above matched when the assignment began. A final read-only check observed concurrent mainline versions `registry.yaml=18A88A189133258A0B07B926B4074CDBA2C2FA792C4F19E045400912518F6FB6` and `plan.md=9344C0D044110C7807EB702A90A2CEEDF61B2482CCE490FEDD1BA96FD36D1000`. This reviewer did not write either file; this package is intentionally evaluated against the frozen start state.

## Current LLVM source pin

The independent source freeze is LLVM commit [`5bb2565693f062a9e99929db1814a7a076d4dc76`](https://github.com/llvm/llvm-project/commit/5bb2565693f062a9e99929db1814a7a076d4dc76), the latest immutable commit located before the 2026-08-11 cutoff during this audit. Moving-branch state is not used as an absence proof.

| Source | Blob SHA | Symbols/behavior inspected | Consequence |
|---|---|---|---|
| [`RISCVTargetMachine.cpp`](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVTargetMachine.cpp) | `517e48faa104348f5ae22bed6001cfe8deb500a8` | `riscv-rvv-regalloc`, `createRVVRegAllocPass`, `addRegAssignAndRewriteOptimized/Fast`, `addPreRegAlloc`, hidden option defaults | Optimized pipeline uses greedy RVV RA; O0 uses fast; vector allocation precedes `RISCVInsertVSETVLI`, then the generic scalar allocator. `VMV0Elimination` runs pre-RA. |
| [`RISCVRegisterInfo.td`](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVRegisterInfo.td) | `9d43277bcdafef2ac3110f5e91424be6cad4f051` | `VR`, `VRNoV0`, `VRM2/4/8`, NoV0 variants, fractional classes, allocation priority/order | Fractional LMUL uses the ordinary one-register class. `VRM8` legal starts/order are `v8m8`, `v16m8`, `v24m8`, `v0m8`; one live group alone does not force pressure. |
| [`RISCVRegisterInfo.cpp`](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVRegisterInfo.cpp) | `f51f56cb10a46d8ac4092c910ccd4b460072ffe2` | `getSpillReloadInfo`, `lowerSegmentSpillReload` | Current lowering selects whole-register `VS8R/VS4R/VS2R/VS1R` and matching `VL*RE8` forms by alignment/remaining registers. This supports the current-whole-spill boundary. |
| [`RISCVInsertVSETVLI.cpp`](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVInsertVSETVLI.cpp) | `feceefe1b8550c2191267342ea781d78223508de` | pass phases, state propagation, `insertVSETVLI`, whole-register-move valid-vtype option | It performs three-phase dataflow/insertion and optimizes compatible AVL/VTYPE transitions. Any candidate vset cost must compare with this complete pass, not a count-only proxy. |
| [`RISCVVMV0Elimination.cpp`](https://github.com/llvm/llvm-project/blob/5bb2565693f062a9e99929db1814a7a076d4dc76/llvm/lib/Target/RISCV/RISCVVMV0Elimination.cpp) | `d72d27c983ada7c0310915be4d71820e660bff92` | copy-to-v0 construction and register-class recomputation | Mask operands are made explicit physical-v0 copies before allocation. A sound state must model these windows/copies and NoV0 overlap, not just reserve a nameless bit. |
| [LLVM RVV documentation](https://llvm.org/docs/RISCV/RISCVVectorExtension.html) | current official docs, checked 2026-08-11 | register classes, split vector/scalar RA, post-vector-RA vset insertion | Independently corroborates source-level pipeline semantics. |

### Relevant current options/configuration surface

- LLVM `-riscv-rvv-regalloc={fast,basic,greedy}`; optimized default resolves to greedy, unoptimized default to fast.
- `-riscv-v-vector-bits-min=-1` and `-riscv-v-vector-bits-max=0` defaults.
- `-riscv-disable-vector-mask-mutation=false` default.
- `-riscv-enable-pipeliner=false` default.
- `-riscv-insert-vsetvli-whole-vector-register-move-valid-vtype=true` default.
- Current GCC official options include [`-mrvv-max-lmul={m1,m2,m4,m8,dynamic}`](https://gcc.gnu.org/onlinedocs/gcc/RISC-V-Options.html) with documented default `m1`, and `-madjust-lmul-cost` disabled by default.

These controls form a finite baseline/configuration audit. Options that change the trace before the frozen MachineIR are evaluated only in the end-to-end source layer; they cannot be mixed into the identical-trace algorithm comparison.

## Native partial-spill boundary

- Primary source: LLVM open PR [`#105661`](https://github.com/llvm/llvm-project/pull/105661), “[RISCV][MI] Support partial spill/reload for vector registers,” created 2024-08-22 and still `open` when queried on 2026-08-11.
- RFC: [`RISCV vector register spill optimization pass`](https://discourse.llvm.org/t/rfc-riscv-vector-register-spill-optimization-pass/80850).
- Directly covered facet: replace a whole-register spill/reload of a fractionally used vector with typed unit-stride load/store, possibly requiring an additional vset.
- Explicit boundary: the PR documents an inline-assembly case where inserting the typed reload/vset would be semantically incompatible.
- Audit correction: typed partial spill is an upstream proposed legal action, not a landed current production action at the pinned commit. Any novelty claim for the local rewrite is absorbed; a joint optimizer must label it accurately and preserve its legality guard.

## ISA and natural-carrier sources

1. RISC-V International, [Vector Extension 1.0 specification](https://docs.riscv.org/reference/isa/extensions/vector/_attachments/riscv-v-spec.pdf): LMUL/group alignment, mask/v0 and vtype semantics.
2. RISC-V International, [Vector assembly examples](https://docs.riscv.org/reference/isa/unpriv/vector-examples.html): official LMUL=8 pressure/spill example and fractional-LMUL alternative. This supports a natural/canonical opportunity hypothesis, not candidate superiority.
3. LLVM official RVV documentation above: current register-class and pass-order semantics.

## Paper and method collision log

| Work | Primary/official source | Relevant facet | Same-object/direct-fatal decision |
|---|---|---|---|
| Lozano et al., “Combinatorial Register Allocation and Instruction Scheduling” | [arXiv author version](https://arxiv.org/abs/1804.02452), DOI `10.1145/3332373` | exact integrated RA/scheduling using combinatorial optimization; optimality/quality tradeoff | `GENERIC_METHOD_SUBTRACTOR`. It does not instantiate the frozen RVV group/v0/typed-spill/vset grammar, but it absorbs a contribution that is only generic CP/enumeration. |
| Fried and Stemmer-Grabow, “Register Allocation for Compressed ISAs in LLVM” | [official CC 2023 page](https://conf.researchr.org/details/CC-2023/CC-2023-research-papers/9/Register-Allocation-for-Compressed-ISAs-in-LLVM), DOI `10.1145/3578360.3580261` | target-aware LLVM allocation/spill objective and natural SPEC evaluation | `ADJACENT_METHOD`. Same compiler family, different compressed-register/code-size objective; no joint RVV group/mask/vset action. |
| Adit and Sampson, “Performance Left on the Table” | [author PDF](https://neiladit.com/papers/Performance_Left_on_the_Table_An_Evaluation_of_Compiler_Autovectorization_for_RISC-V.pdf), DOI `10.1109/MM.2022.3184867` | RVV auto-vectorization gaps and natural evaluation shape | `EVALUATION_SUBTRACTOR`, not same post-ISel decision object. |
| Shi et al., “Closer in the Gap” | [arXiv:2605.10860](https://arxiv.org/abs/2605.10860) | GCC 15/LLVM 21 on real RVV; default LMUL often close to optimal | `HEADROOM_SHRINKER`. Does not cover the bounded group/mask/spill/vset optimizer. |
| Xu et al., “Adaptive register grouping and allocation mechanism...” | [journal official page](https://www.arocmag.cn/abs/2026.01.0020), DOI `10.19734/j.issn.1001-3695.2026.01.0020` | fine-grained dynamic grouping beyond standard power-of-two LMUL, LLVM implementation/custom simulator | `CHANGED_ISA_OR_GROUPING_SUBTRACTOR`; not same standard-RVV object. |
| Zoozve | [arXiv:2504.15678](https://arxiv.org/abs/2504.15678) | arbitrary grouping with compiler and hardware changes | `CHANGED_OBJECT_NEGATIVE_CONTROL`. |
| RISC-V Europe 2025 LLVM RVV codegen update | [author slides](https://www.igalia.com/downloads/slides/lukelau-alexbradbury-Improvements_to_RISC-V_Vector_code_generation_in_LLVM.pdf) | post-vector-RA vset insertion and current backend evolution | current-source genealogy; no identical exact optimizer. |

## Direct-fatal facet test

A source is fatal only if it covers the same fixed MachineIR/ABI/VLEN semantics, the same group/v0/spill/vset action family, the same joint objective, a comparable exact/Pareto or stronger guarantee, and the same full-cost claim. None of the bounded sources satisfied all facets. In particular:

- current LLVM provides the component production pipeline but no joint exact frontier;
- PR #105661 provides the typed-spill/vset local action but no joint group/mask allocation;
- Unison supplies a generic integrated exact method but not the RVV-specific quotient/action theorem;
- GCC and the 2025–2026 grouping works change compiler IR stage or ISA/grouping object.

Therefore no `DIRECT_FATAL` is asserted. Conversely, no absence theorem is claimed: `SEARCH_BOUNDED_OPEN` remains in force until Stage B-quality novelty closure.

## Independent static witness audit

The Discovery witness is not a comparator-separating certificate:

1. `VRM8` legal starts are `v0`, `v8`, `v16`, `v24` (allocation order prefers non-v0 starts).
2. One live LMUL8 group consumes only eight of 32 vector registers.
3. A fractional-LMUL temporary is allocated from the one-register `VR` class, not a fractional physical subregister class.
4. A mask window requires a v0 copy and NoV0-compatible operands. Choosing `v0m8` is then illegal for an overlapping live group; choosing any of the other three groups leaves many single registers.

Thus the stated trio alone neither forces spill nor establishes that whole versus typed spill is selected differently. A repaired witness may add naturally legal live groups/tuple/alignment/NoV0 constraints, but cannot inject arbitrary weights or change the object.

## State/complexity audit

- `O`: a bitmap records occupied units but not which live value owns them, its class/alignment, next use/kill, rematerialization or legal future moves.
- `M`: must distinguish physical-v0 copy placement, mask source liveness, NoV0 operand windows and inline-asm barriers.
- `V`: must capture all suffix-relevant AVL/VTYPE facts used by current `RISCVInsertVSETVLI`, not merely a coarse class.
- `S`: must define spilled-value identities, whole/typed representation, stack-slot/frame contribution, outstanding reload semantics and legality guards.
- `q`: Pareto costs require an explicit additive/ordered algebra and a bound on frontier retention.
- Complexity: `2^32` is constant for standard RVV and does not by itself prove FPT in live groups. Either state a fixed-ISA exact algorithm honestly, or give an explicit parameterized state count and proof. A generic CP/exhaustive solver remains a ceiling/subtractor, not the paper kernel.

## Bounded search record

Query families covered current official LLVM source symbols/options, RVV register allocation and spill/vset terms, exact/dynamic programming and integrated RA, GCC RVV LMUL controls, partial vector spill, and 2025–2026 RVV compiler/grouping work. Repositories and sources were opened at immutable commits or original publication pages where possible.

Known limitations:

- no exhaustive bibliographic database search is claimed;
- the newest 2026 item “Closer in the Gap” is a preprint, not a venue anchor;
- the bounded search found no identical paper, but this is not evidence of global absence;
- no failure to fetch a page was used as a collision conclusion.

## Source-verification disposition

- Current LLVM component coverage: `VERIFIED_CURRENT_SOURCE`
- Partial typed spill status: `VERIFIED_OPEN_PROPOSED_ACTION_NOT_LANDED`
- Exact same-object direct paper collision: `NOT_FOUND_IN_BOUNDED_SEARCH`
- Generic method collision: `VERIFIED_MATERIAL_SUBTRACTOR`
- Natural opportunity: `SUPPORTED_BY_OFFICIAL_EXAMPLE`, frequency/benefit unmeasured
- Scientific disposition: one atomic revision, not STOP and not Stage A authorization.
