# O4-DYNCACHE-PGM revision user review packet

## Final owner recommendation

- Decision: `STOP_RECOMMENDED`
- Quality tier: `BELOW_Q2_STOP`
- Atomic revision: consumed `1/1`
- Stage B: forbidden
- `stageb_user_approval_id`: null

## Decisive result

The revision compared PDEC against a plain COW B+tree leaf and the same leaf with the identical affine hint, update information, split actions, atomic publication, and full local cost ledger.

- 13,640 joint reachable states
- 218,240 exhaustive update cases
- 218,240 PDEC transitions absorbed by the affine-hint B+tree frontier
- 0 transitions outside that frontier
- 0 PDEC-specific residual cases
- 641/641 natural replay transitions also absorbed
- zero semantic/accounting failures
- original plus two independent replays byte-identical

## Why STOP is required

PDEC sometimes splits earlier than a default B+tree. For example, after inserts `0,1,2,7`, it splits into `(0,1)|(2,7)`. But the affine-hint B+tree has exactly the same information and can take exactly the same split, producing the same certificate, no-fallback query behavior, page touches, writes, metadata, and auxiliary space.

The claimed local caps are also shared by the controls. PDEC's worst-case candidate window remains four slots—the whole frozen leaf—so the certificate does not yield a strict local search bound. No guarantee or fully priced metric remains unique.

## Recorded negative region

On the unchanged OSM replay, PDEC ends with 295 leaves and 82,600 committed bytes, compared with 281 leaves and 71,936 bytes for plain COW. The affine-control frontier exactly matches PDEC. This is local accounting only, not an end-to-end timing claim.

## Scope of the negative conclusion

This stops `O4-DYNCACHE-PGM` as frozen. It does not prove all possible global page-aware learned indexes impossible. A different global mechanism, object, or research question cannot be introduced as another revision; it would require a new ID and normal upstream review.

No Stage B approval is requested or permitted.
