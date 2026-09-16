# Source40 question cards

## QC-01: VE vector-length region state

- **Same-object endpoint:** stock-accepted VE generated behavior for a fixed
  MachineFunction and vector-length semantics.
- **Action family:** legal vector-length state/region construction and operation
  grouping.
- **Full-cost boundary:** compiler CPU/RSS/temp, code bytes, vector-state
  transition count, and target execution cost only under later authorization.
- **Carrier commitment:** deterministic official VE test-subtree rule in
  `CARRIER_COMMITMENTS.yaml`.
- **Disposition:** RQ complete; specific carrier/current-locus/oracle closure
  deferred to the bounded queue, not a science DROP.

## QC-02: XCore hardware-loop state

- **Same-object endpoint:** stock-accepted XCore generated behavior for a fixed
  MachineFunction and loop semantics.
- **Action family:** legal hardware-loop state plus fallback-boundary construction.
- **Full-cost boundary:** compiler CPU/RSS/temp, code bytes, loop-state
  instructions and target execution cost under later authorization.
- **Carrier commitment:** deterministic official XCore test-subtree rule in
  `CARRIER_COMMITMENTS.yaml`.
- **Disposition:** RQ complete; specific carrier/current-locus/oracle closure
  deferred to the bounded queue, not a science DROP.

