# SOURCE_COLLISION_MATRIX

| evidence role | primary first-party source | frozen fact / collision handling |
|---|---|---|
| ABI contract | [Arm ABI-AA AAPCS64 current source](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst) | SVE/PST argument or return triggers full `z8–z23` and `p4–p15` callee-save requirement. This directly constrains the purported preservation constructor. |
| official workload/PCS explanation | [Arm SVE Programming Examples](https://documentation-service.arm.com/static/6659c722876c8d213b7870d3) | Confirms the SVE calling convention and supplies public SVE intrinsic-style natural carrier material. |
| LLVM current action source | [LLVM AArch64 calling convention source](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AArch64/AArch64CallingConvention.td) | Current source contains `CSR_AArch64_SVE_AAPCS`, modelling full `Z8–Z23`/`P4–P15` preservation. |
| LLVM interface | [Clang SVE PCS attribute review/source record](https://reviews.llvm.org/D124998) | The `aarch64_sve_pcs`/IR SVE vector PCS interface is an explicit current compiler action, not a missing primitive. |
| GCC current configuration | [GCC AArch64 options](https://gcc.gnu.org/onlinedocs/gcc/AArch64-Options.html) | `-march` SVE enablement and `-msve-vector-bits` VLA/VL-specific modes were included in the union; they do not authorize a public ABI change. |

## Current-upstream reality check

The action relevant to the hypothesized gap is positively present in the official ABI and LLVM source, and the current compiler interfaces/options are documented. The decision does not rely on an assertion that a source feature is absent. No later paper was used to infer absence; latest-collision judgment is the direct current same-object absorption above.
