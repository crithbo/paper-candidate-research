# Exact public anchor

## A01 — MIPS FCSR callable state

- Proposed exact object: a hard-float MIPS function/call graph that explicitly reads or writes FCSR, with unchanged C/C++ numerical values, exceptions, ABI, and target ISA.
- Public anchor: GCC's current MIPS built-in documentation exposes `__builtin_mips_get_fcsr` and `__builtin_mips_set_fcsr`; it says the latter can change FCSR bits except condition codes that GCC assumes preserved. The document is an anchor to a callable state, not evidence of a residual.  
  URL: https://gcc.gnu.org/onlinedocs/gcc/Other-MIPS-Built-in-Functions.html (observed 2026-08-15).
- Candidate carrier if later admitted: publicly available MIPS C/C++ compiler tests containing those built-ins; no carrier has been frozen in this cycle.
- Boundary: direct control-register writes make any purported cross-call placement construction observable unless its preservation and exception contract is explicitly fixed.

Anchor result: exact enough to form an RQ, but insufficient for evidence-qualified raw admission.
