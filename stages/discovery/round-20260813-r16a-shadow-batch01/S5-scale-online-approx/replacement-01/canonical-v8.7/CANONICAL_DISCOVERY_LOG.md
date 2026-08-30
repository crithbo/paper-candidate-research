# Canonical v8.7 discovery log — replacement-01

Frozen assignment: `DISCOVERY-S5-20260813-R16A-V9-PROSPECTIVE-SHADOW-BATCH01`.
Canonical method is v8.7/OFF and is insulated from the later V9 shadow.
Source snapshot: `../neutral-source-snapshot/FAMILY_SIGNATURES.md`, frozen
2026-08-13.  This is an additive replacement after mainline declared the
previous Cargo/APT/ThinLTO/Conda package repeated; it makes no change to that
package's scientific dispositions.

| Family | Current-upstream reality check | Same-object current union and action finding | Canonical disposition |
|---|---|---|---|
| R16A-S5-R01 Nix store inode coalescing | Official Nix 2.32.9 reference names `nix-store --optimise`; setting path includes `auto-optimise-store`, whose default is disabled.  No absence is asserted. | `nix-store --optimise` globally hard-links identical files in the Nix store.  It has the identical object, available information, operation, preserved store paths, and cost boundary needed by the apparent action. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` |
| R16A-S5-R02 Helm repository index | Official Helm 3.21.1 docs say `helm repo index [DIR]` reads chart archives and writes `index.yaml`; `--merge` and `--url` are named non-default controls.  Repository cache/config inherited flags were inspected. | Stock `helm repo index`, together with `--merge`, covers the complete proposed construction/merge action on the same chart-directory object and stock index reader semantics. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` |
| R16A-S5-R03 Distribution registry reclamation | Official Distribution docs specify `registry garbage-collect [--dry-run] [--delete-untagged] [--quiet] config.yml`, mark then sweep, and require read-only/stopped service to avoid corruption. | The current native command is the proposed complete reachability action, under the same complete-information and availability contract.  `--delete-untagged` is included in the union. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION` |
| R16A-S5-R04 PyPA Simple API representation | The official spec defines both HTML and JSON response forms, normalized names, repository versions, and required project/file links.  It is a protocol specification, not evidence of an official current constructor implementation or a versioned natural update trace. | No particular server implementation/current configuration union or finite action-divergence witness was closed.  The two legal serializations alone do not prove either absorption or a new algorithmic residual. | `NOT_ADMITTED_UNFROZEN__CURRENT_CONSTRUCTOR_UNION_AND_WITNESS_UNCLOSED` |

## Decision discipline

R01--R03 are structural drops because the first-party current comparator
directly implements the exact whole action, not because implementation or
performance evidence is absent.  The direct-coverage claim is narrowly limited
to those explicitly frozen actions; it makes no claim that every maintenance
algorithm in those ecosystems is absorbed.  R04 is not a drop: absence of
implementation/materials or a natural trace is not negative evidence, so it
remains unfrozen rather than being converted into a proposal.

No `PROPOSE_STAGE0` was produced.  Thus no `TOPIC_BRIEF`, Stage 0 transition,
or downstream authorization is present.

## Natural/canonical route and full-cost boundary

All four use a bounded canonical real system-state carrier specified in the
neutral snapshot.  Were a later Stage A admissible, the finite killer is to
instantiate that carrier, run the stock oracle/reader against both legal
before/after states, and reject a claimed residual if output/reader acceptance,
guarantee, or the listed full-cost denominator changes.  This is a fidelity
closure route only; no experiment was run here.
