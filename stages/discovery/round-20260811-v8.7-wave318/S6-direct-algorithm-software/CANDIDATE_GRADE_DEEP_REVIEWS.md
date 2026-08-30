# Candidate-grade depth review — Lean4 elaboration/metavariables

## Exact semantics and oracle

Lean source, imports and options are fixed. The output is an accepted set of declarations with identical kernel semantics. The stock kernel is the native oracle: it checks the fully elaborated core term, while metavariables/free variables are not admissible in added declarations.

## Current union

The official language reference identifies parsing, macro expansion, command/term elaboration, unification, type-class instance synthesis, tactic execution, kernel checking and compilation. The `MetavarContext` API documents natural/synthetic/synthetic-opaque metavariables, nested calls between `isDefEq` and type-class resolution, local-context extension, and a deliberate prohibition on type-class resolution assigning caller/elaborator metavariables. Current releases also document app-elaborator behavior that creates parameter metavariables and assigns elaborated arguments.

Thus the fair union is not a plain DAG of obligations: it includes assignment kind, owner/context, nested type-class invocations, unification, tactic actions, macro elaborators and fixed command sequencing.

## Required typed mutually-constrained witness

The smallest useful shape would be an implicit type metavariable `?α`, an instance metavariable `?inst : C ?α`, and a term argument whose elaboration constrains `?α`, for example the elaboration obligations induced by a declaration shaped as:

```lean
def choose {α : Type} [Inhabited α] (x : α) : α := x
example : choose 0 = 0 := rfl
```

However, this is **not** a frozen two-history witness. The official constraints explicitly state that type-class resolution must not assign elaborator-created metavariables, while unification may resolve natural metavariables and may invoke type-class resolution recursively. Consequently, merely permuting “solve `?α`” and “synthesize `?inst`” is not established as two native-lawful histories under the fixed elaborator. Constructing two accepted *source programs* would change the exact object and does not meet the witness requirement.

## N2/guarantee test

A valid contribution would require a target-specific bounded-dependency certificate that preserves assignment ownership/context and proves accepted elaboration with an exact/FPT/approximation/certified resource bound. It cannot be ordinary topological scheduling or a generic CSP. Because the required two-history native witness is not frozen, neither the full atomic action interface nor the proposed certificate recurrence is closed.

## Natural carrier, full cost and finite killer

- **Carrier:** versioned Mathlib-style Lean source/import graph.
- **Oracle:** command success, produced declaration acceptance and kernel checking.
- **Full cost:** parse/macro/elaboration/type-class/unification/tactic work, kernel check, compile, CPU/RSS/temp and produced artifacts.
- **72h fidelity/killer:** first construct a concrete mutually constrained declaration for which two internally native-lawful histories are source-traceable and both kernel-accept. Failure to freeze that witness ends the route before a performance claim; it is currently not performed and is not negative empirical evidence.

## Disposition

`NOT_ADMITTED_UNFROZEN`. No absence claim, STOP or resource inference is made. Current source semantics demonstrate that a naive scheduling formulation is unsafe; the complete action witness, direct collision matrix and target-specific certificate remain finite but unclosed.

