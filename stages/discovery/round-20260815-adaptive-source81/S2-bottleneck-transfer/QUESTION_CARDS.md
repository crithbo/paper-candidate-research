# Evidence-qualified question card

| Field | S81-RQ-01 |
|---|---|
| Same-object identity | Fixed medlow static ELF inputs, ABI, values, symbol interfaces and test-observable executable semantics |
| Complete candidate action sketch | Parse relaxable relocation groups and indivisible data-group constraints; choose one legal GP point and data-group order/placement; emit a standard linker script/input arrangement; invoke stock `--relax-gp` |
| Current fair union | Clang `-mrelax` default / `-mno-relax`; LLD default relaxation / `--no-relax`; `--relax-gp` / `--no-relax-gp`; stock linker scripts and fixed GP symbol; all get equal object graph and carrier information |
| Non-generic discriminant | One GP, 12-bit signed displacement, PSABI relocation groups, static medlow executable restrictions, and group-preserving layout constraints |
| Counterfactual | If legal data placement were decoupled from the GP window, stock relaxation could retain fewer rewrite opportunities despite the same generated objects; the candidate would make that coupling explicit |
| Minimal action witness | Two legal data groups with differently weighted eligible references can be placed so a default GP placement covers one group while a distinct legal GP/layout covers both; stock loader and program output remain the oracle. This still needs source-pinned reconstruction. |
| Full-cost boundary | compile/object preparation, linker CPU/RSS/temp, emitted text bytes, static-data/padding bytes, relocation/loader acceptance, GP initialisation path, startup, and relevant runtime accesses |
| Natural route | Zephyr v4.4.0 RISC-V sources; deterministic Stage-0 selection rule restricted to native RISC-V board/application builds; no acquisition in Discovery |
| Minimum falsifier | Show that the strongest stock script plus `--relax-gp` can reproduce the candidate plan with the same guarantee, or that stock current source/direct literature already contains the same target-specific optimizer |
| Closure debt | Immutable LLVM commit pin; complete script/config union; direct paper audit; source-pinned two-layout witness; formal algorithm/guarantee; natural-carrier retrieval and full-cost probe |
| Current disposition | `NOT_ADMITTED_UNFROZEN__FINITE_CURRENT_UNION_AND_GUARANTEE_CLOSURE_REQUIRED` |

The card is an evidence-qualified raw family, not a clean brief. It was not rejected because implementation, resources, or results are missing.
