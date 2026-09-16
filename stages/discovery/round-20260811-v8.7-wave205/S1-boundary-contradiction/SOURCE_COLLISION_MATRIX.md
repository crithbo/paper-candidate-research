# SOURCE_COLLISION_MATRIX

| Family | First-party basis observed 2026-08-11 | Current-union conclusion |
|---|---|---|
| AMX | [Intel LLVM/AMX note](https://www.intel.com/content/www/us/en/developer/articles/technical/whats-new-in-llvm-for-4th-gen-intel-xeon-processor.html) | compiler `tilerelease`, OS permission and signal context already form direct subtractors |
| CET | [Intel CET technical look](https://www.intel.com/content/www/us/en/developer/articles/technical/technical-look-control-flow-enforcement-technology.html), [Intel compiler CET option](https://www.intel.com/content/www/us/en/docs/fortran-compiler/developer-guide-reference/2025-0/fcf-protection-qcf-protection.html) | protected stack action is architectural; option-only route excluded |
| MTE | [Arm MTE guide](https://developer.arm.com/community/arm-community-blogs/b/operating-systems-blog/posts/new-mte-user-guide), [Arm MTE white paper](https://developer.arm.com/-/media/%20Arm%20Developer%20Community/PDF/Arm_Memory_Tagging_Extension_Whitepaper.pdf) | sync/async modes carry different observable guarantees; complete source union unpinned |
| Zicfiss | [RISC-V CFI specification](https://docs.riscv.org/reference/isa/unpriv/unpriv-cfi.html), [current ISA source](https://github.com/riscv/riscv-isa-manual) | primitive is ISA-fixed; compiler/runtime union unpinned |
| PAC | [Arm PAC/BTI Linux guide](https://developer.arm.com/community/arm-community-blogs/b/architectures-and-processors-blog/posts/enabling-pac-and-bti-on-aarch64), [Arm PAC mechanism](https://developer.arm.com/community/arm-community-blogs/b/architectures-and-processors-blog/posts/armv8-1-m-pointer-authentication-and-branch-target-identification-extension) | matching modifier/authentication is required; lowering or changed protection only |
| Morello | [CheriBSD official source](https://github.com/CTSRD-CHERI/cheribsd), [Arm Morello report](https://developer.arm.com/community/arm-community-blogs/b/architectures-and-processors-blog/posts/creating-the-morello-technology-demonstrator) | no current complete target ABI/compiler/runtime action union pinned |

No issue, future-work statement, old documentation, or lack of implementation is used to prove a gap.

