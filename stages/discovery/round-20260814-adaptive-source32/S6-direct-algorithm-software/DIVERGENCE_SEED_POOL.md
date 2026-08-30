# Source32 Divergence Seed Pool

Generated offline before lookup; network-security exclusion `PASS`.

| ID | Engine | Pre-evidence sketch | State |
|---|---|---|---|
| S32-01 | `BISOCIATION_STRUCTURAL_TRANSFER` | SystemZ callee-save selection and packed stack layout share ABI frame state; inspect as whole constructor. | selected |
| S32-02 | `PROBLEM_REFRAMING` | Treat fixed SystemZ ABI save area as a stateful range constructor, not independent spills. | variant S32-01 |
| S32-03 | `CONSTRAINT_MANIPULATION` | AArch64 SVE predicate spill placement could couple vectorcall and frame state. | SME-adjacent risk |
| S32-04 | `NEGATION_OR_INVERSION` | NVPTX mbarrier allocation/cp.async group state may form a target-specific constructor. | Source29 GPU-barrier cooling risk |
| S32-05 | `ABSTRACTION_LADDER` | AVR frame pointer/base pointer choices likely remain generic frame lowering. | control |
| S32-06 | `ADJACENT_POSSIBLE_OR_BOUNDARY` | SystemZ XPLINK versus ELF save layout could expose a formal ABI transition. | selected control |
| S32-07 | `JANUSIAN_TENSION` | Fixed GPU barrier phase and shared-memory pressure conflict; exact active identity uncertain. | backlog |
| S32-08 | `COMPOSE_DECOMPOSE_SIMPLIFY` | LoongArch relocation+frame region appears linker adjacent. | excluded |

Selected pre-evidence locators: S32-01, S32-03, S32-04, S32-06. Coverage: 8 seeds, 8 engines, six viewpoints; `PASS`. No outcome-aware replacement.
