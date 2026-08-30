# Source120 S1 Contribution-Type Deep Review

## RQ02 — benchmark/tool contract

### Hard-gate audit

- Same object: `PASS`. The object is StableHLO portable artifacts within the documented compatibility window, not generic compiler differential testing.
- Canonical evidence: `PASS`. The current versioned VHLO compendium, compatibility APIs, specification, interpreter and check dialect are first-party carriers.
- Current collision: `BOUNDED OPEN`. Official #1245 directly subtracts the generic idea of interpreter-backed testing. The retained residual is only the coupled witness-generation, specification-typed oracle, and cross-consumer decision protocol; independent paper/tool collision remains for Stage 0.
- Fair baselines: syntactic VHLO roundtrip; plain reference-interpreter evaluation; current consumer-native validation. All must use the same artifact, input, semantic class, supported-version window and failure policy.
- Full cost: corpus preparation, input/witness generation, serialization/deserialization, reference execution, consumer compilation/execution, oracle normalization, unsupported classification, and failure triage.
- Reproducibility: finite public commit/version/consumer matrix with generated witness manifest and exact verdict rules.
- Claim ceiling: no observed breakage, no measured coverage gain, and no cross-consumer result; only a falsifiable Stage 0 package.

### Direct-subtraction result

The sentence “replace syntax checks with the reference interpreter” is not novel enough: StableHLO itself names this future work. The surviving claim must require all three residual pieces:

1. input-bearing witness synthesis from historical/current VHLO compendium entries;
2. a specification-derived oracle taxonomy that distinguishes exact, tolerance-bounded, implementation-defined, undefined/unsupported and invalid cases;
3. a decision matrix over portable-artifact version pairs and at least two consumers, including complete setup and exclusion cost.

If Stage 0 finds any current tool or paper covering that conjunction on the same object and a non-worse cost/guarantee boundary, the topic is `DIRECT_FATAL`. If fewer than two residual pieces are needed to obtain the claimed decision endpoint, narrow to an upstream engineering contribution and drop the paper candidate.

### Q2-shape hypothesis

A public benchmark/tool paper could be complete at Q2 if it defines a reusable versioned corpus transformation, validates semantic oracle correctness, measures coverage and disagreement categories across a meaningful compatibility/consumer matrix, and yields decision-changing results without counting unsupported regions as failures. Q1 potential is not claimed at Discovery; it would require a broadly important semantic-failure taxonomy or a generalizable compatibility-testing mechanism validated beyond one project.

### Verdict

`PROPOSE_STAGE0`, cautiously `TIER_B_Q2_VIABLE`, with independent collision search and fidelity closure mandatory before any claim-bearing run.
