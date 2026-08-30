# User research request for reserve exit

This is not a Stage B request and not a resource-blocker retry. It is the minimum human research package needed to make the frozen Stage A causal comparison executable without changing its object or mechanism.

## Minimum required input

1. **One complete natural mobile run.** A single unsplit foreground UI/frame or camera/ISP workload concurrently with on-device LLM inference, on one identified mobile SoC/configuration. No synthetic requests or reconstruction from aggregate bandwidth.
2. **Per-request source mapping.** Immutable request ID, run/workload ID, source engine/process and operation/phase, issue time, address or auditable address class, read/write, bytes/burst, dependency/completion boundary, and foreground deadline/quality membership.
3. **Complete path and first shared arbiter.** For each accepted request, the route from source to a specifically named first arbiter shared by protected foreground and LLM traffic, plus the arbiter input/output action. A platform researcher or vendor may attest the mapping if raw address/topology details require anonymization.
4. **Actual native-QoS comparator.** Per-request AxQOS/equivalent values and the actual ordering, urgency, weight, starvation, queue-state and adaptive parameters used by that arbiter. A protocol-field description alone is insufficient.
5. **Common denominator.** Candidate and B4 must replay the identical arrival/payload/dependency/completion stream, use an equal information alphabet, preserve model/decoding/output quality, and keep bandwidth, capacity, power/thermal and starvation budgets fixed.
6. **Unit-bearing full-cost paths.** Measurement or a validated model for mapping/classification time, metadata bits/storage, queue state, arbiter work/cycles, DRAM timing/row behavior, bandwidth loss, fairness/starvation, power/energy/thermal, control setup, cold/steady state and fallback.
7. **One small natural witness.** A compact auditable subset that demonstrates legality/equivalence, object identity, denominator equality and expected action coverage for both the candidate and strongest native dynamic QoS cell.

## Acceptable delivery form

An anonymized trace plus schema, mapping attestation, comparator configuration or datasheet/RTL/simulator checkpoint, exact version/commit, SHA-256, byte size, collection command/configuration, and permission/license statement. Confidential field values may be consistently tokenized as long as identity, order, dependencies, action and cost accounting remain auditable.

## Safety and scope boundary

- No Stage B approval is requested or implied.
- No GPU or exclusive device is required for reviewing the package.
- The assignment must resume on the same frozen natural mobile object and comparator contract.
- A synthetic trace, a different SoC, aggregate counters alone, Sereno-style yielding alone, XSched command scheduling alone, or EDF union-oracle output is not an acceptable substitute.
