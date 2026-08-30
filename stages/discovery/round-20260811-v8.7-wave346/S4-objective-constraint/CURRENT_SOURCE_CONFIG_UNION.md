# Current source, configuration, and action union

## Frozen current pins

- Linux master: `d58772d8520c7ef247c4b95c9bd76d3a25da9ff5`.
- e2fsprogs master: `43643a57fb2d3368fbacd181a8cd713102d52a1a`.
- Both pins were obtained read-only on 2026-08-11.

## Native same-object union

| Facet | Official current evidence | Included fair action/configuration union |
|---|---|---|
| On-disk reader semantics | [Linux ext4 directory contract](https://docs.kernel.org/filesystems/ext4/directory.html) | Linear/HTree encoding, required `.`/`..`, legal root/interior/leaf structure, hash-to-block maps, collision overflow behavior, depth limits, and metadata-checksum tail space. |
| Index and hash features | [ext4 feature documentation](https://man7.org/linux/man-pages/man5/ext4.5.html), [mke2fs configuration](https://man7.org/linux/man-pages/man5/mke2fs.conf.5.html) | `dir_index`, `large_dir`, legal hash algorithms/default `hash_alg`, block/features settings, default and overridden `mke2fs.conf` forms. |
| Construction path | [mke2fs manual](https://man7.org/linux/man-pages/man8/mke2fs.8.html) | Native filesystem construction with feature/options/default configuration, root-directory/tar input, block-size/feature/extended configuration. |
| Update/readdir path | Linux source pin plus ext4 format contract | Current stock lookup/readdir and update/split behavior respecting HTree hash order, leaf overflow, checksum and compatibility layout; no alternative reader is admitted. |
| Repair/rebuild path | [e2fsck manual](https://man7.org/linux/man-pages/man8/e2fsck.8.html) | Normal directory-index repair/beneficial indexing and `e2fsck -D` forced directory optimization: re-index, or sort/compress linear directories. |

`mke2fs -D` direct-I/O is accounted as construction cost only; it is not confused with e2fsck `-D` directory optimization. Defaults and non-defaults are both in the comparator union.
