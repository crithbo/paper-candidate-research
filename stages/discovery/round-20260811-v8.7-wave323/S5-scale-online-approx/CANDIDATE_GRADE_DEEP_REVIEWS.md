# Candidate-grade deep reviews

## D1 — Berkeley DB WAL checkpoint — `DROP__CURRENT_WHOLE_ACTION`

**Current pin/union.** Oracle Berkeley DB 18.1.32 documentation freezes `DB_ENV->txn_checkpoint()`/`db_checkpoint`, write-ahead logging, `db_archive`, normal and catastrophic recovery, and all `-k`/`-p` checkpoint scheduling controls. A checkpoint writes changed database pages, makes obsolete logs archivable, and bounds recovery work; stock recovery consumes the database plus required WAL files.

**Same-object contract.** Fixed transactional key/value updates, commit visibility and DB recovery result. Information is the committed WAL/database state at each arrival, never future transactions. Full cost is page/log reads and fsyncs, checkpoint/recovery CPU, RSS/temp, retained/archive/delete bytes, write amplification, latency and post-crash recovery.

**Witness and result.** After two committed updates, native checkpoint applies log state to database pages and archives only eligible logs. Any proposal that decides the interval/threshold is a controller; a full alternate page/log transition must preserve WAL/recovery and is not named. Therefore no union-external bounded-recourse constructor survives. Natural versioned update trace was not frozen; it is not used as a DROP reason. Conditional 72h killer: pinned DB update log, crash/reopen oracle, native replay, and full-cost dominance.

## D2 — ZooKeeper snapshot + transaction log — `DROP__CURRENT_WHOLE_ACTION`

**Current pin/union.** Official ZooKeeper 3.9 current admin documentation defines znode snapshots, appended transaction logs, subsequent log roll, recovery tooling, `snapCount`, `snapSizeLimitInKb`, `txnLogSizeLimitInKb`, `preAllocSize`, and retention/autopurge. It expressly allows writes to continue in the preceding log during a snapshot. The whole union includes native snapshot/log publication, recovery and all defaults/nondefaults.

**Same-object contract.** Fixed versioned znode update sequence, quorum-visible state and unmodified server restart/recovery semantics. Charge snapshot serialization/fsync, log scan/roll, CPU/RSS/temp, retained/deleted bytes, follower synchronization and recovery/read latency.

**Witness and result.** A checkpoint consists of a reader-valid snapshot plus old/new log coverage; changing its firing range or purge count is only a threshold policy. No complete alternative action with a bounded recourse or competitive guarantee was named without changing quorum/recovery semantics. Natural public update trace was not frozen. Conditional 72h killer: a pinned source revision and official log/snapshot fixture; fail on recovery mismatch, native-union replay, or no full-cost residual.

## D3 — Pulsar topic compaction — `DROP__CURRENT_WHOLE_ACTION`

**Current pin/union.** The official Pulsar 4.1 topic-compaction documentation exposes broker-side compaction, its reader semantics (latest message per key), subscription behavior and configuration/administrative invocation. This union includes compaction scheduling, segment rewrite/publication and consumer recovery under all documented settings.

**Same-object contract.** Fixed ordered keyed message trace, latest-per-key consumer result and stock broker/client recovery. Account for reads, rewrite and index bytes, object/segment retention, CPU/RSS/temp, compaction lag and consumer replay latency.

**Witness and result.** Rewriting a compacted ledger to discard superseded keyed messages is already the native complete action. Selecting when to run it, a threshold or concurrency is prohibited control rather than N2. No source-backed whole constructor with a distinct bounded-recourse/competitive guarantee survives. A versioned natural production trace was not frozen; no inference follows. Conditional 72h killer: fixed public keyed stream trace, stock client equality/recovery, current compactor replay and full-cost Pareto test.
