# LLVM-PPC-PREFIX-PRESSURE-PARETODP r10 natural claim execution

## Outcome

- Decision: `FAIL_CLOSED__EXECUTION_INTERFACE_AMBIGUITY`
- Natural claim processes completed: `0 / 32`
- Claim-bearing observation: `false`
- Scientific revision consumed: `false`
- Evidence ceiling: `INVALID_CONSTRUCTION__NO_SCIENTIFIC_INFERENCE`

## Frozen input and copy closure

- Relocated plan: `RELOCATED_R10_EXECUTION_PLAN.json` (32 rows).
- Copy manifest: `EXECUTION_INPUT_COPY_MANIFEST.yaml` (340 files, 127,698,561 bytes).
- One authorized local copy completed: source files 340; destination files 340; missing 0; SHA-256 mismatches 0; reparse count 0.

## First fail-closed condition

The relocated plan freezes only the global row order `SELECTED_ORDINAL_THEN_REPLAY_1_THEN_REPLAY_2`. Each row contains independently named command groups (`candidate`, `ablations`, `baseline_compile`, `baseline_link`, `baseline_inspect`, `baseline_dependency_graph`, `baseline_graph_producer`, `checker`, and `full_cost`) but no per-row sequence, command list, or executable step order. Therefore the required exact natural execution has no unique, auditable command sequence. No command was selected by inference and no natural tool process was launched.

## Required resume gate

MAINLINE must freeze a hash-pinned execution-order interface that gives every row a unique ordered sequence of its command groups (including failure/checkpoint semantics), then issue a separate start authorization. The existing copied resource tree is retained unchanged pending that gate.
