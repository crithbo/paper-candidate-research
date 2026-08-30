# CANDIDATE_GRADE_DEEP_REVIEWS

Only R01 and R02 were selected, as allowed by the `depth_slots_max: 2` contract. This is a bounded source review, not an experiment.

## D01 — Linux rseq pre-commit / post-commit boundary

**Exact object.** A fixed Linux rseq ABI registration, a fixed per-CPU update trace and a fixed preemption/signal cut; equivalent executions must preserve the update’s visible success result, abort target and post-commit state.

**Current-union closure.** The current kernel algorithm says the user publishes an `rseq_cs` descriptor, checks the CPU, executes the final commit instruction, and on an interrupt between `start_ip` and `post_commit_ip` the kernel clears the descriptor and redirects to `abort_ip` ([kernel source](https://github.com/torvalds/linux/blob/master/kernel/rseq.c)). The official ABI documents a per-thread area and critical-section descriptor ([docs](https://docs.kernel.org/userspace-api/rseq.html)); current selftests provide architecture-specific user-space sequences ([source](https://github.com/torvalds/linux/tree/master/tools/testing/selftests/rseq)). Registration, rseq-area size/features and CPU/MM-CID modes are the relevant native paths; no missing-interface claim is used.

**Action promise tested.** A compiler/runtime could choose complete boundaries and abort descriptors for several fixed per-CPU updates, trading the number/length of abortable regions against retry work while preserving each trace’s post-commit observation.

**Why it fails the clean-brief gate now.** The purported decision necessarily chooses or rewrites the user-level update algorithm and assembly sequence. The native rseq contract intentionally leaves that sequence to the application; a global placement policy is therefore either a compiler/controller over a changed program representation or a generic code-region scheduling problem. No target-specific N1/N2 guarantee over the same fixed rseq action was frozen. A two-action witness would also require a natural program corpus with a fixed semantic mapping from source updates to legal rseq assembly regions; that mapping is absent from the current ABI and selftests.

**Disposition.** `DROP` (structural: only controller/program-rewrite/generic scheduling remains). This is not a resource or implementation inference.

**Strongest contrary.** The ABI’s explicit user-code critical-section design is the direct subtractor; it defeats the claimed universal runtime constructor, not rseq research generally.

## D02 — ELF TLSDESC compiler/linker/loader seam

**Exact object.** A fixed ELF program’s TLS symbol references, relocation semantics, dynamic-loader result, linkability and ABI behavior.

**Current-union closure.** GNU ld documents output behavior for `R_X86_64_TLSDESC_CALL` and the default `--gnu2-tls-tag` compatibility tag ([ld options](https://sourceware.org/binutils/docs/ld/Options.html)). LLVM’s target back ends select legal TLS materialization/relocation forms and binutils is the current linker implementation. These are a compiler—MC—linker composition; the loader’s descriptor resolution is part of the ELF deployment contract. The search did not establish a source-pinned, single current version mapping covering every LLVM target back end plus glibc’s resolver; absence is therefore not asserted.

**Action promise tested.** For fixed TLS references, choose descriptor/conventional forms and legal relocation groups jointly to optimize text/relocation/link/load costs while preserving the same symbols and ABI.

**Finite killer.** Pin one target and LLVM/binutils/glibc revisions; enumerate emitted relocation patterns and linker transforms for a small multi-DSO TLS corpus. If the alternative reduces to existing TLS-model selection, relocation relaxation, or an ABI compatibility flag, reject it. This is a finite Stage0/StageA closure route, but it has not been executed here.

**Disposition.** `NOT_ADMITTED_UNFROZEN`, not a proposal: the proposed joint algorithm remains indistinguishable from target cost-model/form selection until the cross-toolchain action table and direct-paper collision are frozen. It is neither a STOP nor evidence that a future same-object N2 is impossible.

**Potential/readiness.** Conditional `TIER_B_Q2_VIABLE` shape only if a target-specific exact/FPT/Pareto constructor survives the finite killer; current readiness is `FINITE_FIDELITY_GAP`.

