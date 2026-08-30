# Final Phase1 eligibility ledger

Status: `FAILED_NOT_DISPATCHABLE__BLIND_CORE_UNCLOSED__NO_SCIENTIFIC_INFERENCE`.

Two previously control-audited entries remain eligible: `f6c1` and `q7m2`. R13B-03 supplied 20 private-nonmatch commitments, but all 20 lack the frozen cutoff pairing, later/target anchor, pre-cutoff primary bytes, and dated locator closure required by the original Phase1 contract. No Batch03 entry was promoted.

Raw slots used/remaining are 80/8. With eligible=2, even an upper-bound assumption that every remaining raw slot could yield one eligible entry gives 10, below the required blind core of 24. Batch04 was not started.

This is a calibration-input coverage failure only. It makes no claim about V9 scientific quality and creates no candidate evidence.
