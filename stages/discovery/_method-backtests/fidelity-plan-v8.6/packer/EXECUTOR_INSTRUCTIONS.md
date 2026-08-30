# Blinded executor instructions — fidelity-plan v8.6

Read only `EXECUTOR_INPUT/`. The canonical sealed manifest is
`SEALED_INPUT_MANIFEST.yaml` in the PACKER directory and is not executor input.
For each opaque case, decide one of
`PROPOSE_STAGE0` or `DROP` under this rule:

`PROPOSE_STAGE0` is permitted when the input fixes same object/function and
guarantee, identifies a non-wrapper decision/action outside the stated current
union, and supplies a finite, auditable fidelity-closure path. Interface,
format, checker, witness, implementation, and empirical result need not exist
yet. `DROP` is required for direct action-space absorption, a wrapper/selector,
a changed object or guarantee, or no finite faithful closure path.

Do not search for the originating project, infer later outcomes, or add future
knowledge. Record the decision, object/guarantee test, action-gap reasoning,
and the proposed small fidelity closure (if any). Do not score or execute any
experiment.
