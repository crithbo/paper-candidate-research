# Discovery log — S2 eBPF verifier-state-path joint-codegen depth red-team

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE219-EBPF-VERIFIER-STATEPATH-JOINTCODEGEN-DEPTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

Frozen method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; `DISCOVERY_QUALITY_MODE=OFF`. Supplied hash checks matched disk: plan `D15E36AD28C2F45F96E34E36E81320BBF83300712BDB8C32AD6E011AE2063F5F`, registry `FCEF877A8B15A7E5B332709371367C46F665F74361F27AADD3D6774A4BA21631`, ROLE `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.

## Frozen contract and current reality

**Exact same object.** One high-level eBPF program with fixed hook/program type, input-event and map behavior, helper calls, map definitions, license, target-kernel BTF, CO-RE relocation result, load attributes, kernel verifier acceptance, and run-time observable output. A different helper/map contract, changed hook, changed target-BTF semantic result, manual source rewrite, or weakened acceptance guarantee is a different object.

**Current sources observed 2026-08-11.** The [Linux verifier documentation](https://www.kernel.org/doc/html/latest/bpf/verifier.html) says verifier pruning checks whether a previously visited state contains the current state, and that pruning includes register/stack state and liveness. The [current kernel selftest source](https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf/test_verifier.c) supplies test harnesses, expected instruction sequences, verifier result/log expectations and scalability cases. [libbpf overview](https://docs.kernel.org/bpf/libbpf/libbpf_overview.html) specifies open/load phases and resolves CO-RE relocations before kernel verify/load. [CO-RE relocation documentation](https://docs.kernel.org/next/bpf/llvm_reloc.html) states relocations patch BPF instruction immediate/offset fields at load time; [BTF documentation](https://docs.kernel.org/bpf/btf.html) places CO-RE records in `.BTF.ext`.

The relevant current union is therefore not just LLVM instruction selection: it contains source/Clang BPF code generation and optimization choices; branch/CFG, value-range/narrowing and stack/register initialization realized in the instruction stream; subprogram/call/loop lowering; BTF and `.BTF.ext` CO-RE records; libbpf open/map creation/relocation/load surfaces; `BPF_PROG_LOAD` attributes; and the kernel’s verifier pruning/state/liveness behavior. No issue, old documentation or absent convenience API was used to infer an absence.

## Proposed N2 and action-divergence attack

The only admissible proposition would be a **compiler-side joint code generator**: from the same high-level semantics it constructs branch/CFG shape, range facts, initialization placement, subprogram/loop form and BTF/relocation records jointly, so that (i) both output objects load and are accepted on two frozen kernel versions after native CO-RE, (ii) hook/map/helper/license/BTF-observable behavior remains equal, and (iii) it provides a nontrivial bound or reproducible reduction in verifier states/time without losing runtime/code-size/full-cost quality.

The required minimal witness is two compiled objects from the same source-level BPF program and fixed compilation/load contract. They must have identical native hook outputs and map effects on a public trace, both pass `BPF_PROG_LOAD` on each pinned kernel after CO-RE, while their instruction/CFG/range/initialization/relocation construction differs in a way that the frozen compiler+loader union cannot express. This witness is not available. A manual rewrite changes the producer contract; a verifier heuristic/configuration is controller/tuning; a generic superoptimizer/ILP is not an executable native action; and a source form that changes helper/map/BTF guarantees changes the object.

## Natural carrier, full cost and finite falsifier

Candidate carrier: version-pinned Linux BPF selftests together with a public, versioned BPF application corpus that contains the same program across two supported kernel/BTF versions. The selftests are a native acceptance oracle, but their supplied sources alone do not establish the required natural two-kernel high-level-program trace. It may not be replaced by a synthetic stress generator.

If a rescreen obtains that carrier, the ≤72-hour falsifier is finite: pin Linux verifier source and configuration, LLVM/Clang BPF backend, libbpf and both kernel/BTF versions; reproduce two same-source compiled outputs; load and execute both through the stock libbpf/kernel path; require equivalent map/output traces and acceptance; measure compiler time, relocation/load/verifier time and processed-state/log proxy where exposed, runtime, instruction/code size, object bytes, CPU/RSS and temporary storage. Stop on any changed object/guarantee, current-union expression, manual rewrite, lack of a two-kernel natural trace, stock rejection, or no residual under that complete denominator.

## Outcome

`NOT_ADMITTED_UNFROZEN`; `PROPOSE_STAGE0: []`. The decisive gap is not “unimplemented compiler code”: it is failure to freeze, at a current Linux+Clang+libbpf source tuple, an actual union-external complete compiler action and its natural two-kernel witness. No experiment, benchmark, download, automation, Stage0/A/B or shared-control write occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
