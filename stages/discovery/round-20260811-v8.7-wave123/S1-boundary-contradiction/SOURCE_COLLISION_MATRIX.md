# SOURCE_COLLISION_MATRIX

| Family | Current source | Classification |
|---|---|---|
| btrfs | [Tree log](https://btrfs.readthedocs.io/en/latest/Tree-log.html) | Native recovery union. |
| ext4 | [Journal](https://www.kernel.org/doc/html/latest/filesystems/ext4/journal.html) | Generic journal excluded. |
| XFS | [Online fsck](https://docs.kernel.org/filesystems/xfs-online-fsck-design.html) | Native repair union. |
| LMDB | [Intro](https://www.openldap.org/devel/gitweb.cgi?p=openldap.git;a=blob;f=libraries/liblmdb/intro.doc) | COW union. |
| LevelDB | [Implementation](https://github.com/google/leveldb/blob/main/doc/impl.md) | Manifest union. |
| Lucene | [IndexCommit](https://lucene.apache.org/core/9_0_0/core/org/apache/lucene/index/IndexCommit.html) | Commit union. |
