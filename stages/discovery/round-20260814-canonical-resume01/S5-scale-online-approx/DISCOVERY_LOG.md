# S5 canonical resume01 — Discovery log

Assignment: `DISCOVERY-S5-20260814-CANONICAL-RESUME01`; method:
`V8_7_POTENTIAL_READINESS_SEPARATED`; claim-pack mode: `OFF`; cutoff:
2026-08-14.  No V9 material was produced.

## Dedup and diagnostic screen

Exact string checks across current `plan.md`, `registry.yaml`, and `history.md`
for Subversion FSFS, restic index/prune, Borg chunk/compact, and Git
multi-pack-index found no matching identity. Git MIDX was screened out before
depth because a Git object/pack identity is too close to already reviewed
version-control storage families. The three independent object families below
were deep-reviewed. This diagnostic count is not a quota.

| Family | Same-object contract and current union | Result |
|---|---|---|
| SVN FSFS packed shard | Fixed FSFS revision/revprop shard; stock revision/verify semantics; `svnadmin pack` / `svn_fs_pack`, FSFS format-7 logical addressing, packing cache parameter, and block-read configuration are the comparator union. Natural carrier: an Apache public repository history with packed FSFS shards. Full cost: read/reorder/index/manifest/temporary disk/RSS/commit delay/revision-read I/O. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ACTION` |
| restic pack/index maintenance | Fixed snapshot/pack/blob graph and restore semantics; `restic prune` scans snapshots, selects unused/partial packs, repacks, changes indexes and deletes obsolete files. Union includes documented `--max-unused`, `--max-repack-size`, `--repack-cacheable-only`, `--repack-smaller-than`, compression and dry-run controls. Carrier: versioned public restic repository design/test fixture route. Full cost: remote download/upload, scratch, pack/index bytes, CPU/RSS, restore availability. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ACTION` |
| Borg segment compaction | Fixed Borg repository archives/chunks and stock restore/list semantics. Current `borg compact` directly frees space; union includes `--threshold`, `--cleanup-commits`, `--dry-run`, progress/stats variants and append-only boundary. Carrier: versioned public Borg repository/archive trace. Full cost: segment scan/rewrite/delete, index memory, bytes, CPU/RSS, duration and free-space recovery. | `DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ACTION` |

## Scientific conclusion

Each identified atomic maintenance action is already present in its fair
current native union. The remaining variation is parameter/trigger selection
or generic packing, not a frozen union-external N1/N2/N3. This is a narrow
action-space conclusion, not a claim that the systems have no research
opportunities. No missing source, implementation, result, resource, or AI
readiness was used as negative evidence.

No `PROPOSE_STAGE0` brief is warranted. A later distinct action would need a
finite fidelity plan: use the named public/canonical repository state, require
stock verify/restore/revision-read equivalence, account for every cost above,
and reject the claim if semantics or a cost denominator changes.
