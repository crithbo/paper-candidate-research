# RAW_SCREEN_ROW_EVENT

| ID | Family / first-party source | Fixed construction guarantee and result |
|---|---|---|
| R01 | btrfs tree/log recovery ([docs](https://btrfs.readthedocs.io/en/latest/Tree-log.html)) | Same recovered tree/metadata after power failure; native tree-log recovery plus write ordering; `NOT_ADMITTED_UNFROZEN`. |
| R02 | ext4 journaling ([kernel docs](https://www.kernel.org/doc/html/latest/filesystems/ext4/journal.html)) | Same journal replay/recovered metadata; generic journaling union; `NOT_ADMITTED_UNFROZEN`. |
| R03 | XFS metadata repair ([docs](https://docs.kernel.org/filesystems/xfs-online-fsck-design.html)) | Same XFS recovery/repair oracle; local repair scheduling only; `NOT_ADMITTED_UNFROZEN`. |
| R04 | LMDB copy-on-write meta pages ([docs](https://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=libraries/liblmdb/intro.doc)) | Same committed meta/root page after crash; native COW protocol; `NOT_ADMITTED_UNFROZEN`. |
| R05 | LevelDB manifest/version-set recovery ([upstream](https://github.com/google/leveldb/blob/main/doc/impl.md)) | Same recovered key/version state; manifest/log recovery union; `NOT_ADMITTED_UNFROZEN`. |
| R06 | Apache Lucene commit points ([docs](https://lucene.apache.org/core/9_0_0/core/org/apache/lucene/index/IndexCommit.html)) | Same reader-visible committed index layout; native commit protocol; `NOT_ADMITTED_UNFROZEN`. |
