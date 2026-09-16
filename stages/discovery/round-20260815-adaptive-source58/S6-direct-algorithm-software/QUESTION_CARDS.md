# Source58 S6 — evidence-qualified question card

## QC-01: LLVM TableGen assembler matcher construction

- **Exact public anchor:** a fixed LLVM target `.td` instruction-description set processed by `llvm-tblgen -gen-asm-matcher`; fixed assembly syntax, target features and stock MC assembler/parser acceptance and resulting `MCInst` semantics.
- **Same-object endpoint:** identical parsed instruction/diagnostic semantics for the same tokenized assembly input. Full cost would include matcher generation CPU/RSS/temp, emitted matcher bytes, parsing CPU/RSS/latency and any custom-operand path.
- **Contribution type:** `COMPILER_TOOL / N2` only if a target-specific whole matcher constructor yields exact/FPT/approximation/certified-Pareto behavior beyond the current matcher.
- **Counterfactual:** it must exploit a named target-specific invariant in operand-class tests, instruction alternatives and continuation sharing—not generic parser/decision-table synthesis or changed syntax/target MD.
- **Current loci:** LLVM official TableGen backend documentation and current `AsmMatcherEmitter.cpp` source locus.
- **Minimum falsifier:** source already performs the candidate action class, or only generic matching-table construction remains.
- **Finite closure:** a versioned target MD and LLVM MC assembler test route can compare accepted/rejected assembly and `MCInst` output; no build or run is performed here.
- **Raw-gate result:** `STRUCTURAL_DROP__CURRENT_MATCHER_ACTION_AND_GENERIC_KERNEL`. Current emitter documentation says its core algorithm uses instruction-set regularity to find potentially matching instructions and simplify generated code; it classifies operands and builds an operand match table. No distinct target-specific action or guarantee was identified after subtracting this action space.

No alternate RQ was opened.
