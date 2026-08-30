# Candidate-grade deep review

## D1 — Java StackMapTable joint frame placement/encoding: `STRUCTURAL_DROP`

**Same-object contract.** Bytecode, method/control-flow/types and JVM runtime behavior are fixed; outputs must pass the stock verifier. The initial frame is implicit. Each subsequent StackMapTable frame is interpreted relative to the prior frame.

**Current action catalog.** The JVMS defines `same_frame`, both one-stack-item forms, `chop_frame`, `same_frame_extended`, `append_frame` and `full_frame`; `offset_delta` determines the bytecode location relative to prior frames. OpenJDK verifier source material checks frame offsets and type consistency at control-flow verification points. Current OpenJDK API material also documents automatic generation, with an explicit exceptional path for unreachable code.

**Minimal witness test.** For a fixed verifier-consistent state sequence, choosing a shorter tag is local byte encoding. Relocating/removing a frame at a required control-flow target changes the verification contract or fails; introducing extra semantically redundant frames is not an identified target-specific algorithm/guarantee. Thus no stock-legal two-output witness establishes a nontrivial whole placement action.

**Strong union / collision.** The native verifier and automatic/explicit writer routes, plus the JVMS encoding variants, absorb the proposed action space. A generic shortest-path/ILP or emitter patch would be disallowed even if implemented. No direct-paper novelty claim is required to establish this structural collapse.

**Full cost / killer.** A 72-hour gate would compile or construct two version-pinned classes, require stock verification and equal execution, and ledger write/verify/load CPU-RSS-temp/bytes. It would immediately reject any result whose only difference is tag selection/format freedom. Since that is the remaining action, no Stage0 brief is admitted.

**Decision.** `STRUCTURAL_DROP` / `COMPLETE_ZERO_PROPOSALS`. This is a same-object/action-structure decision, not an inference from missing implementation, results, resources or AI readiness.
