# Source24 — evidence-gated diverse ideation

- Assignment: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE24-EVIDENCE-GATED-V7R1`.
- Canonical v8.7; V9 OFF.  Network-security, vulnerability, attack, exploit and protocol-security families excluded.
- Funnel: 8 locator cards; 1 fresh raw; 1 C0; 1 D1; 1 deep; 0 clean briefs.  Seven incomplete/excluded cards are not counted as raw.

## C0/D1 and local survival trace

**Current union.**  LLVM 23.0.0git's AArch64 conditional-compare pass lowers CCMP/CCMN/FCMP, explicitly reduces branches and code size, and is scheduled immediately before early if-conversion.  Its documented controls include `aarch64-ccmp`, hidden `aarch64-ccmp-limit` and stress mode. [current source](https://llvm.org/doxygen/AArch64ConditionalCompares_8cpp_source.html)  Matching support describes chains and reassociation available through the CCMP representation. [CCMP support](https://llvm.org/docs/doxygen/group__AArch64CCMP.html)

**One witness, one mode.**  In default mode, a fixed boolean diamond containing `A && (B || C)` admits two target-legal construction histories: form a CCMP chain before early if-conversion, or retain the diamond for early if-conversion.  The carrier is ripgrep 15.2.0 compiled for AArch64; oracle is `-verify-machineinstrs`, emitted object/unwind checks and program behaviour.

| Survival node | Result |
|---|---|
| action origin | A target-legal CCMP/CCMN chain over the compare subtree. |
| preselection/legality/canonicalization | LLVM matching rules canonicalize/reassociate this boolean form but retain CCMP-chain eligibility. |
| selector input | The pass has the required branch-probability, dominator, loop and trace information and reaches `shouldConvert`/`tryConvert`. |
| final survival | `SURVIVES_TO_SELECTOR_OR_ESTIMAND`: the action reaches current conversion choice in the stated mode. |

## Deep subtraction

The survival trace does not establish a residual.  The current CCMP implementation already supports the proposed target-native chain formation and is deliberately composed with early if-conversion.  A purported global choice that merely decides which eligible chains to convert is a pass selector/order/controller; a proposal that changes boolean/flags/CFG semantics violates same-object.  The result is `STRUCTURAL_DROP__CURRENT_DIRECT_ABSORPTION_OR_SELECTOR`.

No implementation, result, resource or AI-readiness fact was used as negative scientific evidence; no capacity was backfilled.
