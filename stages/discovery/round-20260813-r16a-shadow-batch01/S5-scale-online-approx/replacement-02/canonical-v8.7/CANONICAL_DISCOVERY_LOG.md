# Canonical v8.7 discovery log — replacement-02

Frozen assignment: `DISCOVERY-S5-20260813-R16A-V9-PROSPECTIVE-SHADOW-BATCH01`.
The canonical stream is v8.7/OFF.  It uses only the preceding neutral snapshot
and is sealed before V9 SHADOW material exists.

## R16A-S5-R05 — OSTree static-delta and repository-summary construction

Current-upstream reality check is frozen to upstream `v2026.1` (`84fcfe1`) and
the official manual pages accessed 2026-08-13.  The static-delta command itself
provides complete generate semantics between selected revisions, including
`--from`, mandatory `--to`, `--empty`, `--max-usize`, signature type/key
controls.  The summary command provides `--update`, optional metadata, and
signature controls.  The manuals also supply native `verify` and
`apply-offline` operations for stock legality/oracle checks.

The apparent joint complete constructor (generate a signed static delta and
publish the corresponding summary) is already directly expressed by this
current native union.  It operates on the same repository revisions, with the
same signing information, reader/verification contract, and all decision
costs—object reads, delta construction/compression, signing, summary I/O,
served bytes, and client verification—retained.  A mere alternative scheduling
of those commands would be a controller rather than a new N2 action.

**Canonical disposition:**
`DROP__CURRENT_UNION_DIRECTLY_EXPRESSES_ATOMIC_ACTION`.

This narrow structural drop does not say that OSTree has no future maintenance
or delta research residual.  It says only that this exact whole action is not
an unexpressed residual.  No `PROPOSE_STAGE0` was formed and no experiment was
run.

## Finite fidelity route

If a future, distinct action were ever proposed, a ≤72h falsifier would use
the neutral two-revision repository carrier, construct both states, require
`ostree static-delta verify` and `apply-offline` acceptance, compare the signed
summary contents, and count all frozen cost dimensions.  Rejection occurs on
any changed revision state, reader/verification outcome, signing contract, or
deleted cost denominator.  This is documented only as a closure route, not
executed evidence.
