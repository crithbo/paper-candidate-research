# F05 neutral replacement snapshot

Signature: `GIT_SEQUENCER__TODO_PROGRESS_PUBLICATION__CONTINUE_ABORT_RECOVERY__FIXED_WORKTREE_HISTORY__GIT_UNION__CPU_RSS_LATENCY`.

Current Git `sequencer.c` exposes `sequencer/todo`, `abort-safety`, rebase todo/done and deferred update-ref state. Official rebase documentation specifies `--continue` after conflict resolution and `--abort` restoring the original branch. The two actions are native recovery actions for one fixed worktree/history/conflict trace. This descriptive snapshot is distinct from Git pack construction and contains no disposition.
