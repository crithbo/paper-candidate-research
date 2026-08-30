# Source74 question cards

## S74-CARD-01 — JDK 25 AOT cache constructor

- Exact identity: same application/classpath, JDK release, OS/CPU and stock AOT-cache compatibility. Carrier would be natural public Java applications, but none was acquired or executed.
- Current locus: JDK 25 documents cache training, assembly and production, `AOTMode={auto,off,record,create,on}`, configuration/cache files, `AOTClassLinking`, and the compatibility tuple.
- Proposed endpoint/full cost: startup/warmup only under full training + assembly CPU/RSS/temp/cache-byte plus production load/footprint accounting.
- Cheapest falsifier: if the intervention only selects AOT mode, cache/config path, class-linking flag or training profile, it is current configuration/policy rather than a non-separable constructor.
- RAW_REQUIRED audit: `INCOMPLETE`; no source-supported union-external complete action or target-specific guarantee was named.
- Disposition: `EXCLUDED_BEFORE_RAW__NATIVE_TRAIN_ASSEMBLY_MODE_UNION_OR_CONFIG_SHELL`.

## S74-CARD-02 — LLVM X86 APX RA/encoding

- Exact identity: same LLVM IR, x86-64 ABI, APX target and executable semantics; implementation carrier only.
- Current locus: current upstream `X86RegisterInfo.cpp` is frozen as the register-info locus; the visible material confirms an APX register surface but does not supply a target-specific joint construction/guarantee.
- Prospective full cost: compile CPU/RSS, spills, executable bytes, dynamic instruction behavior and code-cache pressure.
- Cheapest falsifier: any method that merely reweights existing register allocation or instruction-size heuristics is a generic allocator/cost model.
- RAW_REQUIRED audit: `INCOMPLETE`; no action skeleton beyond generic RA/encoding has been identified. This is not a missing implementation/result/resource conclusion.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; no queue is opened because an unnamed generic contribution is not a missing single public field.

## S74-CARD-03 — GHC interface-fingerprint construction

- Exact identity: same versioned module graph, interface/recompilation semantics and executable output; natural carrier route would be public GHC projects.
- Current locus: the official GHC guide describes recompilation checking by comparing needed fingerprints against those recorded in a module's interface file and stopping compilation early when unchanged.
- Prospective full cost: interface/fingerprint construction plus storage/bytes/RSS and incremental compile latency.
- Cheapest falsifier: if the action is fingerprint choice, cache retention or generic hash/data-structure policy, the target-specific residual is absent.
- RAW_REQUIRED audit: `INCOMPLETE`; current source supports the generic fingerprint kernel but no non-generic algorithm/guarantee is named.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_FINGERPRINT_OR_CACHE_KERNEL`.

