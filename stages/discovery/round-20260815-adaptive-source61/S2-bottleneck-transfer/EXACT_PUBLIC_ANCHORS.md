# Exact public anchors — Source61 S2

| RQ | Exact object / same-function boundary | Official source | Role |
|---|---|---|---|
| RQ-S61-01 | Fixed virtual-memory contents, fault mode and stock post-resolution mapping semantics | Linux userfaultfd documentation, accessed 2026-08-15: https://docs.kernel.org/admin-guide/mm/userfaultfd.html | ANCHOR/CURRENT |
| RQ-S61-02 | Fixed anonymous/tmpfs logical contents and same virtual-memory access semantics | Linux THP documentation, accessed 2026-08-15: https://www.kernel.org/doc/html/latest/admin-guide/mm/transhuge.html | ANCHOR/CURRENT |
| RQ-S61-03 | Fixed FUSE inode/backing-file bytes and stock open/read/write/mmap semantics | Linux FUSE passthrough documentation, accessed 2026-08-15: https://cdn.kernel.org/doc/html/latest/filesystems/fuse/fuse-passthrough.html | ANCHOR/CURRENT |

These are object/semantic anchors only, not absence/newness or quality conclusions.
