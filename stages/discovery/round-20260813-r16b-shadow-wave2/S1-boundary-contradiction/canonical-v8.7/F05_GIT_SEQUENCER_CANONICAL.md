# F05 canonical v8.7 replacement

**Disposition: `DROP`.** The exact object is a fixed Git rebase/sequencer worktree, history, conflict trace and standard continue/abort semantics. Current `sequencer.c` owns todo/done progress, abort-safety, transaction updates and recovery. The only named alternatives are `--continue`, `--skip`, `--abort`, or `--quit`; choosing among them is user recovery policy, while a different progress representation changes the sequencer/rebase state contract. No target-specific N1/N2/N3 mechanism survives the strongest current union.

Natural carrier: Git's own rebase/cherry-pick tests and public histories. Full cost: sequencer CPU/RSS, worktree/index writes, ref transaction work, conflict-resolution latency and recovery correctness. Finite killer: on one conflicting rebase trace, reject any candidate that reduces to standard continue/abort/skip policy or changes HEAD/worktree recovery semantics.
