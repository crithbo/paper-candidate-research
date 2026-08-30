# Deep reviews

## GCC SystemZ joint selection/scheduling

Fixed object: GIMPLE/RTL program, SystemZ target features/ABI and executable behavior; stock compiler and differential program semantics are the oracle. A possible N2 would jointly choose legal instruction forms and schedule under a finite resource state with a target-specific Pareto guarantee. Strong comparator must include current GCC SystemZ selection, scheduling, reload/IRA and all relevant default/nondefault flags. Natural carrier: GCC testsuite and public CPU programs. Full cost: compile CPU/RSS/temp, code bytes and CPU execution. Killer: one target-fixed RTL witness must admit two legal complete histories and prove that neither current union nor target-specific literature expresses the guarantee. Status `NOT_ADMITTED_UNFROZEN` pending source/collision closure.

## Translation-rule repair

Fixed object would require the same ISA semantics and generated translator behaviour. The current source promise is not closed and rule synthesis modifies producer knowledge; no brief.

## OpenVADL cross-layer toolchain generation

Fixed VADL ISA must retain assembler/compiler/simulator semantics. A joint generator may be interesting, but this bounded pass cannot freeze an action union, native oracle and non-generic guarantee without changing the architecture-description contract. `NOT_ADMITTED_UNFROZEN`.
