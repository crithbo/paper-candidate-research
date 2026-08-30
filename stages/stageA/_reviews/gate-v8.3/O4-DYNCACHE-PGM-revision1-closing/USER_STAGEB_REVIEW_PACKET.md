# O4-DYNCACHE-PGM — Independent Closing Packet

## Decision

`STOP`. This is a terminal Stage A recommendation for the frozen same-ID mechanism. It is not eligible for `PENDING_USER_STAGEB_REVIEW`.

## Decisive reason

Revision1 answers the one requested question and finds no PDEC-specific residual:

- `218,240/218,240` exhaustive transitions are contained in the same-information affine-hint B+tree frontier;
- strict exhaustive residual: `0`;
- `641/641` natural transition comparisons are contained;
- PDEC's maximum candidate window remains four slots, equal to the entire capacity-four leaf;
- original plus two replay result trees are byte-identical.

The affine frontier is not being presented as a separately benchmarked faster system. It is a mechanism-identity test: once a COW B+tree leaf has the same 24-byte hint, update information and legal split actions, it can take the same split and inherit the same certificate at exactly the same local cost. The frozen PDEC leaf contains no additional mechanism beyond that construction.

## Honest scope

This result stops `O4-DYNCACHE-PGM` as frozen. It does not say all learned indexes or all future global page-aware mechanisms are impossible. Missing full ESA/PGM/ALEX/TLX experiments, an effective-delete stream, or paper-scale performance are not the reasons for STOP.

On the natural input, PDEC has 14 more final leaves and 10,664 more committed bytes than plain COW, but plain does not dominate every local metric. The decisive comparison is PDEC's exact equality with the affine frontier, not a claimed timing regression.

## Authority

- Revision budget: consumed `1/1`.
- `stageb_user_approval_id`: `null`.
- `stageb_authorized`: `false`.
- No Stage B or same-ID rescue is requested.
- A materially different mechanism would require a new topic ID and new upstream review.

