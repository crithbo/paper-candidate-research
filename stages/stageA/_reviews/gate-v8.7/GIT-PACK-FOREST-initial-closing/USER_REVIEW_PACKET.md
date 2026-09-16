# GIT-PACK-FOREST User Review Packet

- Stage: `Stage A independent gate closing`
- Lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260809-GIT-PACK-FOREST-INITIAL-CLOSING-V8.7`
- Decision: `CONFIRM_STOP`
- Canonical recommended state: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.96`
- Evidence ceiling: `BOUNDED_NATURAL_20_REPOSITORY_GIT_2_55_NEGATIVE__NO_GENERAL_IMPOSSIBILITY_CLAIM`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `no`
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

The exact joint forest/order mechanism was executed on the same complete reachable Git object sets as all comparators, with Git 2.55 native delta parity, frozen zlib 1.3.2 parity, self-contained packs/indexes, strict fsck, and canonical object equality. Across two formal runs on 20 pinned natural repositories, all 280 methods per run are correct, the candidate differs structurally from classic branching on 18/20 repositories, and the candidate has no preregistered primary benefit on any repository. Every size residual is nonpositive; neither cold nor warm access exceeds the 5% benefit threshold.

This is sufficient to stop the frozen mechanism under the bounded Stage A contract.

## What is not established

The review does not establish a general impossibility result for Git packing, delta forests, global ordering, other repository populations, other Git versions, other codecs, or a scientifically changed mechanism. It also does not establish that an executed Git comparator selected every candidate edge.

## Exact object and narrow claim boundary

The object is one self-contained Git pack v2 plus index for each pinned commit's unchanged complete reachable SHA-1 object set. The only permitted negative claim is:

`BOUNDED_NATURAL_20_REPOSITORY_GIT_2_55_NEGATIVE__NO_GENERAL_IMPOSSIBILITY_CLAIM`

## Decisive evidence

- 20/20 strict repositories in both formal runs;
- 280/280 valid methods in both runs;
- 0/20 primary-benefit repositories in both runs;
- size residual p50 `-55.30%`, p90 `-6.84%`, maximum `0%`;
- maximum cold residual `1.81%` initially and `1.33%` on replay;
- maximum warm residual `0.62%` initially and negative on replay;
- candidate pack/index hashes reproduce 20/20.

The owner reports conservative action residual 0/832. The independent audit confirms the calculation but corrects its meaning: 719/832 and 720/832 are directly observed comparator selections; 112/111 are same-path expressibility and one per run is a window-order proxy. STOP rests on the zero-primary-benefit natural evidence, not on overstating this proxy as full executed absorption.

## Fair baseline and full-cost status

The current Git 2.55 configurations, deterministic simple constructors, and classic branching comparator each produce real same-object pack/index artifacts. The per-metric envelope chooses among these actual results and does not synthesize an impossible pack. JSS/PPC remain literature subtractors only. Construction, graph/optimization, pack/index bytes, verification, RSS, access, setup, workspace, failures, and fallback fields are present and independently reconciled; native Git's pack/index generation is one measured command, while custom methods separately meter `index-pack`.

## Reproducibility and integrity

The owner manifest independently verifies `63,924/63,924` files and `3,039,711,577` bytes with no mismatch, missing, or unlisted payload. All 560 physical formal pack/index hashes match their records. Cross-run byte hashes match 224/280 overall, including candidate 20/20 and deterministic simple 40/40. Remaining nondeterminism does not change correctness, size results, conservative coverage flags, or the decision.

## User action requested

No user action is required to close this Stage A assignment. This topic must not enter Stage B under the frozen mechanism.

## Recommended next state

`STOP`

This packet is a review aid. It does not authorize Stage B or a formal paper project.
