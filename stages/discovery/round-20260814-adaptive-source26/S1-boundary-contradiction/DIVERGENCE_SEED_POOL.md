# Source26 offline divergence seed pool

Assignment: `DISCOVERY-S1-20260814-ADAPTIVE-SOURCE26-EVIDENCE-CLOSURE-TRIAD-V1`. Generated before all external lookup; seeds are non-evidentiary and do not enter the scientific denominator.

## Coverage

| Engine | Used | IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S01 |
| `PROBLEM_REFRAMING` | yes | S02 |
| `CONSTRAINT_MANIPULATION` | yes | S03 |
| `NEGATION_OR_INVERSION` | yes | S04 |
| `ABSTRACTION_LADDER` | yes | S05 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S06 |
| `JANUSIAN_TENSION` | yes | S07 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S08 |

## Seed records

| ID | Engine / perspective | Two-sentence sketch and conclusion-first test | Generic/identity risk | Convergence disposition |
|---|---|---|---|---|
| S01 | structural transfer / compiler engineer | AArch64 MOPS exposes an architecturally compound memory operation after IR decisions have fixed call and exception boundaries. If successful, the cautious claim is a target-specific semantic-preserving construction for legal MOPS regions, not a new memory model. | May reduce to ISel/form choice. | selected L01 |
| S02 | problem reframing / operator | RISC-V Zfa conversion/rounding instructions make a floating contract visible late in target lowering. A valid result would need a fixed numerical contract and a non-generic joint legal-form guarantee. | May be ordinary instruction selection. | selected L02 |
| S03 | constraint manipulation / hardware architect | A GPU command graph has host construction and device visibility commitments; a same graph may admit different legal construction boundaries. A result would need retain graph/event semantics and be more than launch-configuration tuning. | Recent GPU graph coverage risk. | backlog |
| S04 | inversion / theorist | Rather than asking how to optimise `setjmp`/exception lowering, ask whether ABI-mandated unwinding forbids otherwise local state placement. The endpoint would be a target-specific formal/algorithmic construction under unchanged C++ observables. | likely historical ABI/exceptions saturation. | excluded prior-surface risk |
| S05 | abstraction ladder / maintainer | Treat a Wasm Component resource as a first-class lifetime state machine rather than a binding wrapper. A publishable endpoint would need a fixed engine and canonical ABI artifact action. | Source25 component-resource locator already unfrozen. | excluded contained |
| S06 | adjacent boundary / end user | RISC-V hypervisor trap return couples privilege-state restoration with guest-visible execution. A cautious endpoint would require an actual compiler/runtime action, not an emulator patch. | Source25 H-extension locator already unfrozen. | excluded contained |
| S07 | Janusian tension / measurement reviewer | A binary’s unwind tables must be both compact producer output and authoritative consumer recovery input. A valid N3 route needs natural corpus laws plus an independent consumer oracle. | DWARF call-site surface active/avoided. | excluded active-surface risk |
| S08 | compose/decompose / compiler engineer | A late linker relaxation and early ABI frame decision can disagree on code-size cost. The endpoint requires a target-specific finite algorithm, not generic register allocation. | saturated target-RA lineage. | excluded saturation |

## Clustering and coverage-constrained selection

S01 and S02 are non-dominated representatives of distinct target/semantic clusters: compound memory semantics (AArch64) and fixed floating-point conversion semantics (RISC-V). Each supplies an exact target, a target-specific counterfactual, and a three-role official/primary source route. No selection is made to meet a numerical target. S03 is retained only as non-evidentiary backlog; S04–S08 are excluded before locator selection for identity/saturation controls.

## Precommitted source-role routes (before lookup)

| Locator | Exact-object hypothesis / counterfactual | ANCHOR primary → fallback | CURRENT_UNION primary → fallback | CONTRARY primary → fallback |
|---|---|---|---|---|
| L01 | Fixed AArch64 program/ABI with legal MOPS-region selection; counterfactual: a target-specific region construction changes legal MOPS/scalar partition while preserving values, faults and unwind semantics. | Arm Architecture Reference Manual MOPS chapter → Arm ACLE MOPS intrinsic documentation | LLVM `llvm-project` AArch64 MOPS source/tests → GCC AArch64 MOPS source | original compiler/architecture paper query → LLVM source/tests as contrary implementation evidence |
| L02 | Fixed RISC-V program/ABI and rounding/exception contract; counterfactual: a target-specific construction chooses legal Zfa versus base conversion forms while preserving the frozen FP contract. | RISC-V ratified Zfa specification → RISC-V ISA manual index | LLVM RISC-V Zfa lowering/tests → GCC RISC-V Zfa source | original compiler/architecture paper query → LLVM/GCC instruction-selection evidence |

Primary/fallback order is frozen above. Lookup may disqualify an item but cannot add a replacement locator.

