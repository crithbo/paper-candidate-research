# SOURCE_COLLISION_MATRIX

| role | primary source | collision / current reality finding |
|---|---|---|
| current LLVM contract | [LLVM RVV backend documentation](https://llvm.org/docs/RISCV/RISCVVectorExtension.html) | Fixed register classes, `VRNoV0`, vector-first RA, and post-vector-RA `RISCVInsertVSETVLI` are documented current composition. |
| current spill lowering | [LLVM RISCVRegisterInfo source](https://www.llvm.org/docs/doxygen/RISCVRegisterInfo_8cpp_source.html) | Current spill/reload helpers enumerate LMUL-specific register classes and lower segment spill/reload. |
| direct local-spill subtractor | [LLVM partial RVV spill RFC](https://discourse.llvm.org/t/rfc-riscv-vector-register-spill-optimization-pass/80850) | Directly covers whole-to-typed spill replacement and the possible `vset*` cost, but not joint group/mask/vtype Pareto allocation. |
| ISA natural pressure carrier | [RISC-V ratified vector examples](https://docs.riscv.org/reference/isa/unpriv/vector-examples.html) and [RVV spec](https://docs.riscv.org/reference/isa/extensions/vector/_attachments/riscv-v-spec.pdf) | Official examples describe high pressure and LMUL=8 spill behavior. |
| GCC subtractor | [GCC RVV vectorization poster](https://riscv-europe.org/summit/2024/media/proceedings/posters/21_poster.pdf) | Dynamic LMUL selection based on pressure is a necessary external baseline. |
| related non-identical paper | [Zoozve](https://arxiv.org/abs/2504.15678) | Uses arbitrary register grouping and altered hardware/compiler support; it is not same standard-RVV/VLEN object. |

No future-work or absence assertion supports the proposal. Latest direct collision is treated as a baseline; no source found that supplies the identical group/mask/spill/vset state, bounded-trace guarantee, and same-object LLVM realization.
