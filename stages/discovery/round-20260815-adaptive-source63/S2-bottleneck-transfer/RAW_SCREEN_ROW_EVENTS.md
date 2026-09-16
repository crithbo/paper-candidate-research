# Raw-screen row events

| event | signature | stage reached | disposition | rationale |
|---|---|---|---|---|
| selected RQ | QEMU_DIRTY_BITMAP__FIXED_QCOW2_NODE_AND_BITMAP__PERSIST_MIGRATE_MERGE__STOCK_QMP_BACKUP_ENDPOINT | question card | EXCLUDED_BEFORE_RAW | current QMP union covers lifecycle/merge; remainder is generic metadata configuration |
| selected RQ | QEMU_VFIO__FIXED_VM_DEVICE__DMA_DIRTY_LOG_STATE_SYNC__STOCK_MIGRATION_ENDPOINT | question card | EXCLUDED_BEFORE_RAW | current dirty-log state machine makes proposed difference a controller/policy |
| selected RQ | QEMU_MIGRATION__FIXED_VM_STATE__DIRTY_STREAM_STATE_CONSTRUCTION__STOCK_QMP_DESTINATION | question card | EXCLUDED_BEFORE_RAW | no union-external action witness; feature/configuration selection only |

Counts: seeds=6; selected_RQs=3; evidence-qualified_raw=0; deep_reviews=0; clean_briefs=0.  No outcome replacement occurred.
