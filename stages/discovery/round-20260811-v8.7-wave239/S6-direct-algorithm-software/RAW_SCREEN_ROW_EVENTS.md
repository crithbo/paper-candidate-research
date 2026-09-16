# Raw screen-row events

| Row | First-party anchor | Same-object lead | Disposition |
|---|---|---|---|
| R1 | Linux kernel SquashFS documentation | A regular file may use contiguous compressed blocks and/or a tail fragment; the fragment lookup table is part of the stock reader format. | retained for source closure |
| R2 | Current upstream `mksquashfs.c` on `plougher/squashfs-tools` master | Current source declares data-block size, fragment controls, duplicate checking, sort state, xattr controls, compressor state and parallel/order queues. | retained for action-union audit |
| R3 | Upstream 4.7.4/4.7.5 documentation | `mksquashfs` exposes `-b`, `-comp`, `-no-fragments`, `-no-duplicates`, sorting and action facilities; fragments are packed by default for small files. | retained; proves action availability, not residual |
| R4 | Proposed joint constructor | Choose legal fragment membership/tail treatment, duplicate representatives and write order while regenerating all tables. | static freedom witness only |
| R5 | Compression/filesystem-layout collision check | Existing upstream facilities already include duplicate checking, sort, alignment actions, compressor selection and fragment modes. | no residual admitted until complete composition and direct literature collision close |

The raw rows deliberately do not treat documentation gaps, absent measurements, or unavailable local tooling as scientific evidence.
