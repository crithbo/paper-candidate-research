# Independent Stage 0 confirmation — x86 StackClash frame/probe/register Pareto FPT

- Assignment: `STAGE0-C2-20260814-X86-STACKCLASH-FRAME-PROBE-REGISTER-PARETO-FPT-CONFIRM-V8.7`
- Role: independent confirmation sentry
- Decision: `CONFIRM_STOP`
- Quality tier: `BELOW_Q2_STOP`
- Stage A/B authorization: `false` / `false`
- Revision permitted or executed: `false` / `false`

## Ruling

The terminal STOP is independently confirmed for the frozen object: a static
`x86_64-unknown-linux-gnu` SysV frame with fixed stack-clash guard/probe
settings, fixed ABI/unwind and page-by-page protection.  The candidate has no
same-object non-product native decision remaining.  This is a structural
source-level conclusion, not an inference from missing implementation,
benchmark, or performance result.

## Current-union recheck

`RegAllocGreedy::tryAssignCSRFirstTime` explicitly compares the first use of a
callee-saved register (whose save/restore cost is paid in prologue/epilogue)
against spill or split cost.  PEI first spills callee-saved registers, lets the
target make final pre-frame changes, calculates actual frame-object offsets,
and only then inserts prologue/epilogue code.  Static stack probing therefore
does not share a simultaneous allocator decision with body live intervals.

After that finalization, the x86 generic inline-probe expander takes the
already-fixed offset, target probe size and alignment offset and deterministically
chooses block versus loop expansion.  The block form updates `RSP` and probes
at its current address; its sole slot-tail push reads an `undef` `RAX`.  It is
not a body-value allocation alternative.  CFI updates are emitted with the
frame-setup sequence where required.

## Scratch-action correction, and why it does not rescue the claim

The PRIMARY's categorical phrase “no native scratch action” is too broad.  In
the **loop** expansion LLVM materializes the final probed stack address in a
fixed prologue temporary: `R11` on 64-bit LP64 (`R11D`/`EAX` in the other
listed modes).  The same code asserts that live `EFLAGS` is not clobbered.
This is a real native implementation detail.

It does not create the alleged scratch-or-spill frontier:

- it is selected by the static loop expansion after frame finalization, not by
  register allocation over a body live range;
- its identity and lifetime are prescribed by the prologue expansion, whose
  loop/block choice is a numeric function of final offset, alignment and probe
  size; and
- replacing it with a body-live allocation decision would require inserting a
  pre-body preservation/restore transition or changing the prologue/CFI/ABI
  contract.  That is not a second plan in the frozen static SysV object.

Thus the correction reinforces the necessary distinction: a fixed prologue
temporary exists, but no *choice* between that temporary and a body live
interval exists under the same contract.

## Failed two-plan attack

No native same-ABI/same-unwind/same-guard two-plan witness was identified.
Every lawful component is either:

1. the existing CSR-versus-spill/split decision already modeled by Greedy;
2. frame-object placement, which reduces here to ordinary frame packing and a
   scalar final-size threshold; or
3. the deterministic, post-frame static probe expansion.

Adding page-crossing weight to (1) or optimizing (2) with a generic solver is
generic scalar cost tuning/frame packing, not a target-specific N2 frontier.
Dynamic allocation, new probe transitions, or altered ABI/unwind/security
semantics would change the research object and require a new ID.

## Evidence used

- [LLVM RegAllocGreedy](https://llvm.org/doxygen/RegAllocGreedy_8cpp_source.html): first-use CSR cost versus spill/split logic.
- [LLVM PrologEpilogInserter](https://llvm.org/docs/doxygen/PrologEpilogInserter_8cpp_source.html): CSR spilling, final target changes, frame offsets, then prologue/epilogue insertion.
- [LLVM X86FrameLowering](https://llvm.org/doxygen/X86FrameLowering_8cpp_source.html): `STACKALLOC_W_PROBING`, offset/probe/alignment block-or-loop expansion, frame-setup CFI, and the fixed `R11` loop temporary.
- [LLVM Stack Clash design note](https://blog.llvm.org/posts/2021-01-05-stack-clash-protection/): page-by-page allocation/probe invariant and alignment accounting.

## Disposition

Confirm `BELOW_Q2_STOP__STATIC_X86_PROBE_DETERMINISM__CSR_SPILL_COMPOSITION__NO_NATIVE_SCRATCH_ACTION`, with the term “no native scratch action” interpreted narrowly as “no native **allocator-selectable body-live scratch action**.”  No revision is proposed or authorized.

