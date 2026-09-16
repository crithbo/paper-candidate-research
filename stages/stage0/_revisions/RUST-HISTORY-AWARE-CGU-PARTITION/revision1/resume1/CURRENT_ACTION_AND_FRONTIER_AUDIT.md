# Current action and frontier audit

## Native action grammar

At pinned rustc `ba28ff76f353a722f31c4f3dd2ac4e437d36411b`, the relevant source has a finite action grammar: collect current mono items; choose item and reachable inlined-copy placement; attach stock linkage/visibility; merge to the permitted CGU count using size/overlap; compute deterministic names; internalize; and reject non-distinct symbols. Current configuration actions include codegen-unit count, incremental mode, LTO and compatible Cargo profile/configuration branches.

The observed `smallvec 1.15.2` test-harness carrier has two stock named CGUs and 2,246 `MONO_ITEM` records. This is a real same-current object, but it does not make a predecessor label a native action.

## Candidate action audit

Let `M` be current mono items and `H(m)` a label inferred only from the immediate predecessor release. The proposed decision is still a membership map `p: M -> C` over the existing named-CGU grammar. All Rust legality predicates are independent of the origin of `H`. Thus:

`(M, current linkage/visibility/inlining/name constraints, capacity, H) -> p`

is a labelled constrained partition problem. `H` is an objective annotation, not a new codegen action, and no legal action becomes available or unavailable because of it.

## Required state versus generic collapse

An honest future-native state must include item identity, linkage, visibility, inlining-copy multiplicity, deterministic-name/merge provenance, capacity/overlap, and current symbol predicates. Adding predecessor cohort `H` produces a product state. Its recurrence is no more target-specific than a graph partitioner with labels.

Dropping those native predicates gives a generic graph/cache objective and violates future-action preservation. Keeping them gives a generic constrained partitioner with Rust validity checks, not a new Rust-specific algorithmic invariant, FPT parameter or approximation guarantee. No non-product relation between `H` and any native action was named.

## Action-divergence result

Two complete whole-graph membership maps could be written syntactically, but the second map would be an arbitrary alternative partition over the same native grammar. It has no union-external atomic action and no target-specific guarantee. Claiming it as a legal native divergence would merely assume the candidate compiler modification that the gate is meant to justify. This fails the gate; it is not an implementation-readiness objection.

## Finite Stage A falsifier retained only as a negative boundary

If a successor with a genuinely new ID proposed a non-product native action, a finite check would enumerate the current union on the same current graph, validate coverage/linkage/names/symbols, then compare full partition/compile/link/incremental costs against a predecessor-label shuffle. For this ID there is no scientific Stage A route because the required non-generic action/guarantee has already collapsed.
