# FAILED_NOT_DISPATCHABLE — paired blind pool input/coverage blocker

## Frozen assignment

- `assignment_id`: `BACKTEST-PACKER-L1-20260813-DISCOVERY-CLAIM-PACK-V9-R0-PAIRED-BLIND-R10`
- `authorization_id`: `DISCOVERY-CLAIMPACK-V9-CONTINUOUS-EXECUTION-20260813-R10`
- Contract SHA-256: `E28634BA8D3097603C07E2D1EDE72E41888E47EC17D73330E97C98A377162E4F`
- Result: `FAILED_NOT_DISPATCHABLE`
- Evidence ceiling: `NO_SCIENTIFIC_INFERENCE_FROM_PACKER_FAILURE`

## What was verified

The current frozen plan, registry, role rule, claim-pack rule and assignment contract were read and their required hashes matched. The contract mandates a fully pre-frozen 40-family blind pool, including 24 initial families across six outcome-dependent strata and two hidden expansion tranches. It also requires independently auditable pre-cutoff primary bytes, family identity isolation, exclusion of all development and prior-V8.8 identities, and an auditor-only key containing identity, cutoff proof, stratum/tranche and score key.

## Exact closure failure

The sole authorized upstream input, `control/PACKER_ASSIGNMENT.yaml`, supplies the experimental design but contains no candidate-family ledger or any eligible identity, publication/cutoff timestamp, source URL, later-outcome anchor, development exclusion set, or prior-V8.8 identity-denylist mapping. It therefore cannot establish any one of the following without inventing unprovided facts:

1. the four `later_success_positive` identities and their pre-outcome cutoff;
2. the 40-way independent family/development/prior-V8.8 non-overlap proof;
3. the six-stratum 24-family balance and the B1/B2 tranche allocation;
4. a real primary-source retrieval plan tied to a frozen identity and cutoff;
5. an auditor score key grounded in historical evidence rather than post hoc selection.

No source was downloaded and no synthetic identity, outcome, relation, score, source record, or label was created. Creating a pool by unconstrained external search would make the PACKER both selector and post-hoc outcome curator without an approved frozen source universe, defeating the requested paired same-snapshot and contamination controls.

## Not performed

- No legacy or V9 method execution, scoring, prediction, candidate experiment, E2, Stage 0/A/B activity, build, installation, or external communication.
- No EXECUTOR or AUDITOR was contacted or created.
- No old V8.8 or development material was read or reused.
- No network retrieval was performed; network bytes are `0`.

## Minimum user/mainline unblock

In a new assignment/write boundary, provide a read-only, frozen candidate-universe ledger that supplies for each of at least 40 independently eligible families: opaque packing token; target identity only for auditor; contribution type; intended stratum/tranche; source URLs/classes; source artifact dates and per-family cutoff; an auditable later-outcome anchor where required; and explicit development/prior-V8.8 denylist non-overlap evidence. Alternatively, authorize a bounded, independently pre-registered candidate-selection protocol and source universe before any selection begins. The supplied material must permit verifying the 24/32/40 pool *before* executor visibility.

This is an input/coverage failure, not a resource or transport failure, and supports no claim about V9, legacy Discovery, candidate quality, or scientific merit.
