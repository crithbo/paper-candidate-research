# Question cards

## QC01 — MIPS FCSR callable-state placement

| Field | Frozen status |
|---|---|
| exact identity | MIPS hard-float function/call graph with explicit FCSR built-ins |
| same-object problem / endpoint | preserve numerical values, exception behavior, ABI, and ISA legality while reducing state-transition full cost |
| contribution type | prospective N2 only; a target-specific joint algorithm/guarantee would be required |
| counterfactual consequence | if every legal action is expressible by an existing compiler state model/cost composition, there is no contribution |
| non-generic discriminator | must use MIPS FCSR-specific control/status and call observability; generic save/restore scheduling is invalid |
| current-source locus | not yet pinned to an exact upstream MIPS lowering/register-state locus |
| lowest falsifier | an explicit FCSR write/call trace for which deferred placement changes result, exception, or ABI-visible state |
| finite closure route | deterministic one-project route: inspect the current `llvm/llvm-project` default-branch commit resolved at execution, restricted to `llvm/lib/Target/Mips/**`, and record all FCSR lowering/state-related paths and flags; then compare one fixed GCC MIPS target configuration |
| full-cost initial denominator | compiler CPU/RSS, text bytes, FCSR moves, call save/restore code, and runtime cycles |

Disposition: `LOCATOR_ONLY__RQ_BACKLOG`. It lacks a pinned current compiler union, a fixed natural carrier, and a legal two-action witness. These are closure debt, not negative scientific evidence.
