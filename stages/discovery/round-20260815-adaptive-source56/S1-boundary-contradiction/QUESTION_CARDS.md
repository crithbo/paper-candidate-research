# Question card QC01

| Required field | Evidence-qualified value |
|---|---|
| exact public identity | RISC-V Zawrs Version 1.01 + current LLVM RISC-V target support surface |
| same-object contract | one RV64 LR/SC retry-loop program; unchanged atomic ordering, ISA legality, and observable synchronization semantics |
| carrier kind | implementation-carrier only; no natural carrier is frozen |
| endpoint | target-native code-generation action / fixed guarantee |
| counterfactual | a non-generic constructor would change the decision of where a legal wait is placed without changing the contract |
| current locus | LLVM current target documentation lists Zawrs as Assembly Support; GCC current options list Zawrs feature support |
| minimum falsifier | any proposed placement that changes atomic ordering, required progress, or legal reservation behavior |
| full-cost initial boundary | code bytes, compiler CPU/RSS, retry/wait instructions, cycles, and energy only where a target-native measurement route exists |
| finite closure route | not needed: an early structural fatal is already exposed by the contribution contract |

**RAW_REQUIRED audit: INCOMPLETE.** The only action left after fixing the semantics is choosing a retry/wait policy. The sources do not identify a target-specific decision state, structural constraint, or guarantee that distinguishes it from ordinary wait/backoff scheduling. It therefore fails the non-generic discriminator before raw, rather than being rejected for missing results or resources.

Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_POLICY_SHELL`.
