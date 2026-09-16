# Rule audit workspace

This directory is the only writable workspace for the long-lived `RULE-AUDIT-SENTRY`.

Each material audit uses a separate `stages/rule-audit/<audit_id>/` directory. Audit outputs are advisory proposals and do not change project policy until the user approves them and mainline applies the accepted delta to shared control files.

The rule-audit lane never runs candidate experiments, changes candidate state, authorizes Stage B, lowers quality gates, revives terminal topics, or creates automation.
