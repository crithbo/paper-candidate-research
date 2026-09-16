# Exact anchor — S67-A01

- Identity: RISC-V ratified CMO/Zicboz ISA 1.0.0 and GCC RISC-V `memset` zero expansion record.
- URLs: https://docs.riscv.org/reference/isa/unpriv/cmo.html ; https://gcc.gnu.org/pipermail/gcc-patches/2024-May/651024.html
- Date: accessed 2026-08-15.
- Object: one RISC-V Zicboz target and a fixed non-volatile, fully-covered zero-initialization/memset operation, including its fault and observable-store contract.
- Immutable guarantee: same C/C++/IR result, access permissions/exceptions and any required ordering/atomicity; no different ISA, object, or weakened visibility guarantee.
- Anchor question: does a target-specific action survive, or is it already current memset lowering / generic zero-store planning?
