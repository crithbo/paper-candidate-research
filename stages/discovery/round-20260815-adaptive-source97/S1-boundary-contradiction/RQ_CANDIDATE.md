# Research-question candidate

## Primary RQ — RQ97-01

For a fixed Java `ExecutorService`, fixed submitted-task set, fixed task effects/results, and the Java SE 25 completion/cancellation/termination endpoint, is there a non-generic whole-lifecycle constructor that improves CPU, RSS, latency, or queue cost without changing the documented shutdown/interrupt semantics?

Alternative phrasings were intentionally not promoted: the object, endpoint, and candidate action would remain identical. The RQ is answerable only if the proposed constructor is neither a shutdown-policy selector nor generic task scheduling/batching.

