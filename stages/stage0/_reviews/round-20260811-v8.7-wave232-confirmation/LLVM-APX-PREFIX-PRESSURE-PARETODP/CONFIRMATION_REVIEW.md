# Stage 0 Independent Confirmation Review

- Assignment: `STAGE0-C2-20260811-LLVM-APX-PREFIX-PRESSURE-PARETODP-CONFIRM-V8.7`
- Topic: `LLVM-APX-PREFIX-PRESSURE-PARETODP`
- Role: independent Stage 0 confirmation sentry
- Review date: 2026-08-11
- Decision: **CONFIRM_REVISE_ONCE**
- Conditional quality: **TIER_B_Q2_VIABLE**
- Confidence: **0.92**
- Evidence ceiling: `E0-H_STATIC_CURRENT_SOURCE_AND_FORMAL_GATE_CONFIRMATION__NO_IMPLEMENTATION_OR_RESULT`
- Search status: `SEARCH_BOUNDED_OPEN`
- Stage A started: `false`
- Stage B started: `false`
- Candidate experiment or benchmark run: `false`

## 1. Scope, independence, and frozen packet

This confirmation was performed independently of the APX PRIMARY. I read only the project control files, the Stage 0 role rule, the wave232 Discovery packet, and the frozen PRIMARY packet. I did not execute the proposed revision, implement a candidate, run an experiment, or inspect another candidate.

The PRIMARY packet passed its canonical 4/4 manifest check exactly:

| File | Frozen SHA256 | Result |
|---|---|---|
| `STAGE0_REPORT.md` | `13BF79843B4B79D90907D2CB7774642FA1FF7324718AE425CE0B860441A361CD` | PASS |
| `Q1_COMPARATOR_MATRIX.md` | `9D37863C4C7E5034FB359EAE5E517B8D6A8CC07B77C1F9D16F7B3491BA15C2BA` | PASS |
| `SOURCE_AUDIT.md` | `B269F7C0C73E14E8918418E5C686BF1657C14B347BB4EC14FEE388A258D3223F` | PASS |
| `handoff.yaml` | `D78C922DCFCB1F2CF2169A1BECD93FB564B255CA5071BA6D1793AB934F8617D8` | PASS |
| manifest self | `C40852AD9DB8809654E42BDA952EF30302953D6AB850C8B28DCE02D4EFD1246D` | PASS |

The user-frozen control hashes did not match the files visible at read time. Expected/observed were:

| Control | User-frozen | Observed at read time |
|---|---|---|
| `registry.yaml` | `A2A6CDBD3077779092ACA6CAB70DB66F0E88DBE71AC6A82B8461C652D50AAB43` | `F62E9EBD92AC36AD2B01E24B227AC9B2725867201561F7622A55C0185AC27A5A` |
| `plan.md` | `3007E27B9F26EF0F168CBAB8DEC1EB5E6CD20927BB8AA7BDE28C792E5E665908` | `349851393B93089E786C257F54DC7476BB5E2D9FA63D00DB3AA463B724ADC3C3` |

The visible semantic assignment nevertheless exactly matched this topic, role, and write boundary. I therefore used the user-frozen scientific contract and record the hash drift only as a provenance caveat; it is not scientific evidence for or against the candidate.

## 2. Editorial synthesis

The PRIMARY decision is correct: the Discovery proposition is not ready for direct Stage 0 PASS, but the failure is repairable by one finite, atomic, static revision. Current LLVM already performs substantial APX-to-legacy compression, so the publishable residual cannot be “choose NDD when it is shorter” or a generic topological/register-allocation search. The residual must instead be a target-specific, sound quotient or equivalent abstraction over APX/legacy MachineIR traces that preserves every future native-legal action and the declared cost vector.

No reviewed current-source fact proves that this refined proposition is directly absorbed or formally impossible. Conversely, the existing bank-permutation quotient and witness are not yet mechanically sufficient. The proper outcome is therefore `CONFIRM_REVISE_ONCE`, not PASS and not STOP.

## 3. Independent reviewer lenses

### 3.1 Field and contribution lens

APX creates a real whole-trace tradeoff: EVEX/NDD can avoid destructive-copy instructions and register pressure, while longer encodings can increase bytes. A paper-shaped N2 remains possible if the work supplies a target-specific exact/FPT/Pareto algorithm or a formal abstraction with a nontrivial guarantee. Merely tuning LLVM, choosing among existing flags, applying hot-first heuristics, or invoking a generic solver would be below the contribution floor.

### 3.2 Domain and current-source lens

At the pinned LLVM commit `a1194be1baefa99d20a09bd04b16056be0ab7225`, `X86CompressEVEX` does more than eliminate trivially redundant NDD forms:

- it recognizes tied destructive forms when destination/source equality already holds or can be exposed by commuting operands;
- for nonredundant `ADD32ri_ND`, `ADD64ri32_ND`, `ADD32rr_ND`, and `ADD64rr_ND`, it can select LEA when no extended APX register is used and the EFLAGS definition is dead;
- LLVM's APX design intentionally selects NDD early and compresses it after register allocation when legal;
- relocation-related suppression and the rest of the ordinary X86 pipeline are part of the current native comparator, not optional external baselines.

Thus any revision must compare against the complete pinned LLVM pipeline and its finite relevant APX/compression controls, not against an isolated NDD emitter.

Primary sources checked include the official LLVM `X86CompressEVEX.cpp` source, `X86TargetMachine.cpp` pass placement, the LLVM APX design RFC, LLVM's relocation-suppression documentation, and Intel's APX architecture/software-enabling materials:

- https://www.llvm.org/doxygen/X86CompressEVEX_8cpp_source.html
- https://llvm.org/doxygen/X86TargetMachine_8cpp_source.html
- https://discourse.llvm.org/t/rfc-design-for-apx-feature-egpr-and-ndd-support/73031
- https://www.llvm.org/docs/doxygen/X86SuppressAPXForReloc_8cpp.html
- https://www.intel.com/content/www/us/en/developer/articles/technical/advanced-performance-extensions-apx.html
- https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html

Some source transports failed or returned cached/search-only views. They are recorded as transport limits and do not support an absence inference. Latest direct collision remains `SEARCH_BOUNDED_OPEN`.

### 3.3 Methodology and formal lens

The Discovery complexity expression based on permutations inside “low” and “EGPR” banks is not presently a sound state reduction. Physical registers are not freely symmetric once aliases/subregisters, byte-register encodability, REX/REX2 requirements, fixed and reserved registers, caller/callee-save classes, inline-assembly constraints, relocation state, CFI/ABI effects, and future operand constraints are admitted.

A valid certificate must define a finite labeled transition system for the pinned same-object trace and a relation on partial realizations satisfying both:

1. **future-action preservation:** related states admit corresponding complete sets of future native-legal actions, not merely the same next opcode choices; and
2. **declared-cost preservation:** corresponding continuations preserve the full declared byte/pressure/copy/save-restore cost vector, including all prefix and boundary effects.

This may be expressed as a cost-preserving bisimulation, a target automorphism quotient, or an equivalent formulation-neutral abstraction. Identity enumeration is sound but does not itself provide the required nontrivial N2. An arbitrary bank symmetry is compact but unsound. The revision must occupy the nonempty middle: a target-specific abstraction with a proved complexity or optimality guarantee and an explicit exact small-instance oracle.

### 3.4 Devil's-advocate lens

The strongest attacks are:

- LLVM may already remove the apparent NDD advantage through commutation, tied-form compression, LEA, register allocation, or another normal pass;
- a purported quotient may silently merge states with different later encodings, spills, fixed-register legality, or save/restore cost;
- a solver formulation may merely restate integrated register allocation and instruction selection without a new target-specific algorithmic result;
- an isolated instruction-byte win may disappear under whole-function/full-cost accounting;
- a synthetic witness may demonstrate action divergence but not natural utility.

These attacks define the revision obligations and later fidelity gates. None is presently a formal impossibility or demonstrated direct absorption of the refined proposition.

## 4. Mechanical audit of the ADD_NDD witness

The PRIMARY correctly identifies `EFLAGS-live` as necessary to block the current ADD_NDD-to-LEA conversion. Its proposed witness direction, however, needs two additional restrictions before it is mechanically valid.

| Condition | Why it is necessary |
|---|---|
| EFLAGS produced by the addition are live | Blocks replacement by LEA, which does not reproduce arithmetic flags. |
| **Both** original sources remain live after the addition | If only one source is live, register allocation can place the destination on the other dead source; `X86CompressEVEX` can commute operands and recover a tied destructive ADD. |
| Destination is distinct/interfering with both sources at the operation | Prevents ordinary redundant-NDD compression. |
| Operands/destination use the no-REX legacy 32-bit register subset | “No EGPR” alone excludes only APX R16-R31; R8D-R15D are still non-EGPR but require a REX prefix, invalidating an assumed two-byte legacy encoding. |
| Register-register ADD, no relocation/memory/fixed-register side condition | Keeps the byte arithmetic and legality certificate explicit. |
| Same fixed MachineIR/ABI boundary and same live-outs | Prevents the witness from changing the object or deleting required values. |

Under those frozen conditions, a same-semantics comparison between one EVEX NDD addition and `mov32` plus destructive `add32` is a plausible native action-divergence witness: the move preserves flags; the destructive ADD produces the required arithmetic flags; and both original source values survive. The revision must state exact bytes from the pinned encoder/MC tables and include whole-trace boundary costs. At Stage 0 it need not have been assembled or measured.

This correction is inside the PRIMARY's single `SOUND_APX_TRACE_QUOTIENT_CERTIFICATE` gate. It is not a second revision and does not consume the authorized scientific revision merely by being identified in confirmation.

## 5. Frozen single revision proposition

The only admissible scientific revision for this candidate is frozen as:

`SOUND_APX_TRACE_QUOTIENT_CERTIFICATE`

The revision must deliver one coherent static proposition containing all of the following:

1. **Same object.** A pinned reachable X86/APX MachineIR trace, fixed target/ABI/subtarget, fixed semantic live-ins/live-outs and EFLAGS behavior, with no rewriting that changes the computation.
2. **Complete native action catalog.** All relevant legal APX/legacy encodings and current LLVM transformations, including destructive tying/commutation, ADD_NDD-to-LEA, relocation suppression, register allocation and save/restore consequences, plus finite relevant controls.
3. **Sound abstraction.** A cost-preserving future-action equivalence/bisimulation or equivalent target-specific quotient. The relation must preserve complete continuations, not merely current liveness counts or bank membership.
4. **Nontrivial N2.** A target-specific exact/FPT/Pareto algorithm, complexity increment, approximation, or other formal guarantee that is not generic CP/ILP, exhaustive enumeration under constant architectural size, or emitter engineering.
5. **Corrected action-divergence certificate.** At least one legal witness with live EFLAGS, both sources live, distinct destination, explicit no-REX register choices, exact encoding arithmetic, and whole-trace equality.
6. **Finite fidelity route.** Tiny exhaustive labeled oracle agreement; current LLVM action-catalog coverage; reference execution/semantic equality; full native parity; whole-function/full-cost accounting; and natural traces such as SPEC/LLVM test-suite or another justified corpus.

The certificate need not use the word “quotient” if another formalism proves exactly the same future-action and cost preservation. It cannot evade the gate by reverting to a fully labeled generic solver with no target-specific structural result.

## 6. Comparator, evidence, and claim ceiling

The minimum fair comparator union is:

- complete pinned LLVM X86 code generation with current APX selection and late compression;
- a finite, preregistered grid of relevant existing LLVM/APX controls;
- the current destructive/commuted/LEA/relocation-suppression transformations;
- a same-trace integrated code-generation subtractor such as Unison or a clearly equivalent generic exact solver, with semantic and cost parity;
- an exact exhaustive oracle on small bounded traces.

The eventual cost must include emitted code bytes plus declared register-pressure, copy, spill, save/restore, planning, and any materially different compile-time costs. A local prefix count or isolated basic-block byte count is not sufficient for the main claim.

Stage 0 does not require an implementation, native output, natural positive result, or completed theorem. The present evidence supports only conditional paper potential and a finite closure route. A witness would establish action divergence, not natural prevalence or end-to-end benefit.

## 7. Decision and mechanical routing

**Decision: `CONFIRM_REVISE_ONCE`.**

Rationale:

- direct PASS is unavailable because the current quotient is underdefined and the witness omits conditions needed to defeat current commutation/tied-form compression and to justify legacy byte length;
- scientific STOP is unavailable because no current-union absorption or formal impossibility of the refined same-object target-specific abstraction was established;
- one finite static revision can close the exact residual without requiring Stage A evidence.

If the revision cannot prove a nontrivial target-specific future-action/cost-preserving abstraction, or if its corrected witness is absorbed by the complete current LLVM union on the same object, the mechanical terminal outcome is `BELOW_Q2_STOP__UNSOUND_REGISTER_SYMMETRY_OR_CURRENT_UNION_ABSORPTION`. Failure to obtain implementation results is not that sentinel.

Scientific revision consumed by this confirmation: `false`. Mainline may authorize the candidate's single revision; this sentry does not execute it. Lane state after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
