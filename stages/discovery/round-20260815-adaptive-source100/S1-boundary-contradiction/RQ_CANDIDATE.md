# Research-question candidate

## Primary RQ — RQ100-01

For a fixed POSIX rwlock, reader/writer trace, scheduling-option state and read/write endpoint, is there a target-specific whole admission/handoff constructor that reduces CPU, RSS or wait latency while preserving the documented reader blocking, writer precedence and recursive-read semantics?

The RQ survives only if the action is more than selecting a reader/writer fairness policy, waiter order or generic lock scheduling rule.

