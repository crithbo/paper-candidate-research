# R16A S5 replacement-01 — neutral source snapshot

Snapshot date: 2026-08-13.  This additive subtree replaces no file in the
accepted-but-excluded batch.  The original four signatures remain
`EXCLUDED_REPEATED__R16A_DEDUP` exactly as delivered.

## Exact dedup precheck

Before source depth, the following literal family terms were searched with
`rg -n -i` across `plan.md`, `registry.yaml`, and `history.md` on
2026-08-13: `nix store optimise`, `helm repo index`, `distribution garbage
collection`, and `python simple repository api`.  There was no hit.  This is
a lexical precheck only; it does not establish novelty or an implementation
absence.  The four signatures below are therefore new to this replacement
batch, subject to mainline's authoritative cross-lane signature comparison.

## R16A-S5-R01 — Nix store inode coalescing

- Canonical signature: `object=Nix valid store paths with identical regular-file
  NAR contents; problem=post-build disk duplication; action=global hard-link
  coalescing of identical files; mechanism=content-identity inode sharing;
  information=all present valid paths; output=same readable store paths;
  comparator=current nix-store optimise/auto-optimise-store; cost=scan+hash+
  link+store I/O+disk.`
- Neutral carrier: a finite valid-store snapshot containing two byte-identical
  regular files.  This is a canonical real system-state carrier, not a claimed
  empirical workload result.
- First-party snapshot: Nix 2.32.9 command reference, accessed 2026-08-13,
  `nix-store --optimise`; current setting documentation for
  `auto-optimise-store` was included in the reality check.

## R16A-S5-R02 — Helm chart repository index construction

- Canonical signature: `object=directory of packaged Helm charts plus
  index.yaml; problem=incrementally publish searchable chart metadata;
  action=construct/merge index.yaml from chart archives; mechanism=chart
  metadata extraction and deterministic index merge; information=directory and
  optional existing index; output=stock-client-readable index.yaml; comparator=
  helm repo index with --merge/--url; cost=archive read+metadata parse+index
  read/write+bytes.`
- Neutral carrier: a finite public chart-archive directory and an existing
  `index.yaml` where applicable; canonical system input, no performance claim.
- First-party snapshot: Helm 3.21.1 command documentation, accessed
  2026-08-13, including `--merge`, `--url`, and inherited cache/config flags.

## R16A-S5-R03 — CNCF Distribution reachability reclamation

- Canonical signature: `object=OCI Distribution registry manifest/blob graph;
  problem=reclaim blobs unreachable from manifests; action=mark all manifest
  digests then sweep unmarked blobs; mechanism=content-address reachability;
  information=complete registry while read-only/stopped; output=same remaining
  API-readable manifests and referenced blobs; comparator=registry
  garbage-collect with --dry-run/--delete-untagged; cost=manifest scan+mark
  memory+blob scan+deletion+availability interruption.`
- Neutral carrier: a finite manifest/blob DAG with one shared and one orphan
  blob, matching the official explanatory graph.  It is a canonical formal
  carrier, not a new trace observation.
- First-party snapshot: CNCF Distribution garbage-collection documentation,
  accessed 2026-08-13, including stop-the-world/read-only warning and flags.

## R16A-S5-R04 — Python Simple Repository API representation construction

- Canonical signature: `object=Simple API project/file metadata and file URLs;
  problem=publish a repository response under current API requirements;
  action=construct valid HTML or JSON project listing; mechanism=normalized
  project naming and required file-link/metadata serialization; information=
  package-file metadata; output=client-acceptable Simple API response;
  comparator=the current specification's two legal serializations; cost=
  metadata extraction+serialization+served bytes+client parse.`
- Neutral carrier: a finite project with versioned distribution metadata and
  file URLs.  This is a canonical API-state carrier; no claim is made that a
  public update trace was retrieved.
- First-party snapshot: PyPA Simple Repository API, accessed 2026-08-13,
  including versioning, HTML/JSON forms, normalized names, and required links.

## Snapshot integrity and non-leakage

The snapshot records facts before either decision stream.  It contains no
canonical disposition, proposal wording, or V9 field.  No V9 artifact existed
when the canonical files were authored.  Cross-lane equivalence remains a
mainline decision.
