# Resume 1 Mechanical Validation

- Result: `25/25 PASS`; `0 FAIL`
- Mode: read-only after outcome files were written

## Passed checks

1. Required artifact set present.
2. Final manifest entry count correct before adding this validation artifact.
3. Final manifest entries verified.
4. Pre-acquisition manifest `4/4` verified.
5. Initial handoff hash matched.
6. Initial report hash matched.
7. Revision1 handoff hash matched.
8. Revision1 manifest hash matched.
9. Partial byte count matched the failure record.
10. Partial SHA-256 matched the failure record.
11. Accepted final ZIP absent.
12. Extraction/build/source/corpus directories absent.
13. Failure JSON status correct.
14. No claim-bearing observation recorded.
15. Scientific revision not consumed.
16. Failure record Stage B false.
17. Lane state `IDLE_REUSABLE_AWAITING_MAINLINE`.
18. Handoff decision blocked.
19. Handoff scientific revision not consumed.
20. Handoff does not recommend STOP or reserve.
21. Handoff Stage B boundary false/null.
22. No `stageb_authorized: true` in the artifact set.
23. Scope correction explicitly recorded as non-result-dependent with unchanged scientific gates.
24. Download script parses successfully as Python.
25. User blocker packet present.

After this ledger and command-log note were added, the final hash manifest was regenerated and re-verified separately.

