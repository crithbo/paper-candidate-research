# Candidate-grade deep reviews

## D1 — minimap2 chain / primary-mapping construction

- **Object/oracle:** fixed read/reference, scoring and output semantics; stock alignment records are the oracle.
- **Current union:** upstream specifies minimizer indexing, seed sorting, DP chaining, primary/secondary selection, extension, `--rmq`, gap patching and defaults/non-default chaining thresholds. It explicitly offers second-round chaining and alternate seed sorting.
- **Witness / N2 test:** two legal seed-chain histories can produce different chain choices, but preserving fixed output turns a new plan into a generic chaining/order algorithm unless a target-specific bounded seed-gap theorem is supplied. None is frozen.
- **Natural/full-cost/killer:** public read/reference datasets; output equality, chaining+alignment CPU/RSS/temp/bytes. Killer: a finite repeat/long-indel input must distinguish a theorem from the current DP/RMQ union.
- **Decision:** `STRUCTURAL_DROP` — residual is generic chaining/heuristic selection under a broad existing union.

## D2 — WFA2 gap-affine alignment construction

- **Object/oracle:** fixed sequences, affine penalties and exact score/CIGAR semantics; native alignment validation is oracle.
- **Current union:** the official WFA material describes WFA as exact gap-affine alignment with time proportional to read length and score, including WFA-Adapt and wavefront width/memory choices.
- **Witness / N2 test:** different legal wavefront storage/recompute histories can preserve score, but the named construction is already a direct exact score-parameterized algorithm. A generic recurrence/DP variant does not create a target-specific residual.
- **Natural/full-cost/killer:** public read pairs; exact score/CIGAR, CPU/RSS/temp/output. Killer: finite score-bounded pair must show a new guarantee beyond WFA/WFA-Adapt.
- **Decision:** `STRUCTURAL_DROP` — direct collision absorbs the proposed FPT/exact shape.

## D3 — Lean 4 elaboration/metavariable constructor

- **Object/oracle:** fixed Lean source/imports/options, accepted declaration and kernel semantics; kernel acceptance is oracle.
- **Witness / N2 test:** a fixed obligation set may admit different lawful metavariable discharge histories. A target-specific bounded-dependency elaboration certificate is conceivable, but the current elaborator option/action union and direct collision are not frozen.
- **Natural/full-cost/killer:** Mathlib-style public sources; build/kernel acceptance, elaboration CPU/RSS/temp/artifact bytes. Killer: finite mutually constrained declarations that validate a proposed certificate without changing elaboration semantics.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.

## D4 — sourmash MinHash sketch construction

- **Object/oracle:** fixed sequence stream, k-mer/hash definition and explicit similarity-error contract; stock query/error checker is oracle.
- **Witness / N2 test:** legal bounded sketch update histories can differ while meeting a common approximation contract. Without a fixed native action/config union and a target-specific sketch-structure theorem, it is generic streaming sketch selection.
- **Natural/full-cost/killer:** public genomes/sequence collections; similarity/error, construction/query CPU/RSS/sketch bytes. Killer: fixed stream and error budget that proves an invariant beyond standard MinHash sampling.
- **Decision:** `NOT_ADMITTED_UNFROZEN`.

## Result

`COMPLETE_ZERO_PROPOSALS`: 8 unique families, 4 deep reviews, 2 structural drops, 2 unfrozen. No incomplete implementation, result or resource status caused a decision.

