# CANDIDATE_GRADE_DEEP_REVIEWS

## R01 — seccomp BPF: `DROP__CURRENT_UNION_OR_TUNING`

Minimal legal witness: two BPF instruction layouts can return the same action for a given `seccomp_data` syscall/argument/architecture input. But the fixed object already requires loading a valid BPF program and kernel evaluation; policy compilation, verifier/JIT, filter layering and action precedence are the strongest same-object union. A layout/ordering choice is compiler tuning unless it creates a new complete algorithm with the same decision semantics and charged verifier/load/runtime cost. Natural carrier and oracle: kernel sample policy and actual return action; 72h falsifier (not run): enumerate action-equivalent filters, load/check them with the stock kernel verifier, and reject any claim that changes architecture checking, action precedence, return behavior or merely selects layout. Full cost includes instruction count, verifier/JIT, install, syscall evaluation and RSS.

## R02 — Landlock: `DROP__COMPATIBILITY_CONFIGURATION`

Minimal witness: the same declared filesystem/network policy can be projected to an older ABI by clearing unsupported handled rights. The official current documentation already makes this compatibility projection explicit, including rule masking, ABI probing and thread-synchronization semantics. A proposed projection/ordering method is configuration/compatibility control; retaining a right unsupported by the enforcer changes the guarantee. Natural carrier/oracle: stock sandboxer and stock syscall error/access outcome; 72h falsifier (not run): fix ABI, ruleset and accesses and reject any mechanism that is an official rights mask/flag choice or differs in enforced domain. Charge create/add/restrict calls, rule bytes, ABI probes, enforcer runtime and memory.

## R03 — OPA Rego-to-Wasm: `NOT_ADMITTED_UNFROZEN`

The native object is a fixed Rego decision compiled to a Wasm module and evaluated through OPA's documented Wasm ABI. The relevant complete union includes Rego compiler, module, built-in support, JSON/structured input serialization and host evaluator. A small policy/input can witness different internal code layouts, but this alone is not an action-divergence outside the union. No new recurrence/algorithm, complexity/quality guarantee, and pinned current competing compiler surface was frozen in this bounded official pass. Therefore it is a fail-closed admission decision, not an implementation/result/resource drop. A future 72h killer must fix one official policy/input corpus, use the stock evaluator as oracle, charge compile/module/load/eval/RSS cost, and reject any claim representable by existing compiler/runtime configuration.

No brief is emitted.
