# Candidate-grade deep reviews

## D01 — LLVM freeze placement across a control boundary

The official LLVM semantics are decisive: a branch consuming poison/undef has immediate UB, whereas `freeze` chooses an arbitrary but fixed value, making the subsequent branch defined but nondeterministic ([LangRef](https://www.llvm.org/docs/LangRef.html); [UB manual](https://llvm.org/docs/UndefinedBehavior.html)). Therefore, the two syntactically native plans do **not** preserve the fixed source/IR observable contract. A placement algorithm cannot claim same-object optimization unless it restricts the program to a pre-existing well-defined subdomain, in which case `freeze` is a no-op and no residual remains. Current GlobalISel also represents `G_FREEZE` as an IR-level semantic operation, not a target cost action ([docs](https://llvm.org/docs/GlobalISel/GenericOpcode.html)).

**Disposition:** `DROP` — the apparent witness changes definedness/nondeterministic behavior, so same-object fails. This is a semantic conclusion, not an implementation or result inference.

## D02 — Clang zero-call-used-registers return boundary

Clang explicitly exposes `-fzero-call-used-regs=` and matching function attributes; valid settings range from `skip` through `all`, and the stated purpose is mitigating ROP or register information leakage ([option documentation](https://clang.llvm.org/docs/ClangCommandLineReference.html), [attribute documentation](https://clang.llvm.org/docs/AttributeReference.html)). The native plans do have the same functional language return values, but they deliberately choose different architectural register-residue security guarantees. Treating that residue as fixed makes only one configuration legal; treating it as variable makes the proposed task a compiler flag/attribute choice or ordinary cost tuning. No target-specific whole-program action or guarantee outside that current union was named.

**Disposition:** `DROP` — configuration/guarantee-change residual only.

## Allocation note

R04 robust futex has a genuine crash-publication seam but was not promoted: the official protocol fixes `list_op_pending` precisely to close the death window, leaving no independently parameterized same-contract action at raw resolution. The two deep slots were already consumed by D01/D02; no later outcome-aware backfill occurred.

