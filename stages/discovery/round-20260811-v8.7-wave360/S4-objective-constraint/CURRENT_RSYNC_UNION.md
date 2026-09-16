# Current rsync producer/receiver union

- Pin: rsync master `3b84610ccb35d1355f6e88e0e870bef48a164fbb`, checked read-only 2026-08-11.
- First-party evidence: [rsync man page](https://download.samba.org/pub/rsync/rsync.1), [algorithm report](https://rsync.samba.org/tech_report/), [protocol overview](https://rsync.samba.org/how-rsync-works.html), [NEWS](https://download.samba.org/pub/rsync/NEWS.html).

The strongest same-information union includes file-list scan and recursive/incremental-recursion modes; receiver fixed-block weak/strong signatures; sender rolling all-offset checksum search; literal/basis-reference instruction stream; receiver reconstruction and whole-file checksum verification; and current default/non-default `--whole-file`, `--block-size`, `--checksum-choice`, `--checksum`, checksum seed, compression, sparse/preallocation, batch, transport, and metadata/deletion modes.

The current documentation also records per-file dynamic block sizing. Removing these actions from the comparator would be unfair. A complete comparison includes both producer and receiver options plus protocol/checksum negotiation.
