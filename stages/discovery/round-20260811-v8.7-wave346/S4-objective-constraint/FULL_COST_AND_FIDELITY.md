# Full cost and fidelity contract

**Same function:** directory names, inode association, lookup/readdir behavior, ext4 feature semantics, and stock-reader acceptance remain identical.

**Full-cost denominator:** filesystem/image construction CPU/RSS/temp and bytes; index and directory bytes; cold/warm stock lookup/readdir CPU/RSS/tail latency; cache/device effects; journal/metadata effects; and e2fsck/repair/rebuild CPU/RSS/temp. No cost may be shifted into offline formatting or future repair without accounting.

**Native legality witness:** a smallest same directory tree must yield a stock-mountable image; lookup/readdir must return the same visible names/inodes as the comparator; HTree headers/maps/checksums must obey the documented format; and the complete construction must not be reproducible by the frozen current union. The last condition is not met for the visible candidate class.
