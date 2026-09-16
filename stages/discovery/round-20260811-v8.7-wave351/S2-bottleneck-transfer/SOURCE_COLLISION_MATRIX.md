# Source and collision matrix — Wave351

| Facet | Official/current source | Current union / impact |
|---|---|---|
| Send/receive state | [OpenZFS send and receive](https://openzfs.github.io/openzfs-docs/Basic%20Concepts/Operations/Send%20and%20Receive.html) | Common base, incremental history, compressed/large-block/embed/raw options, destination constraints and interruption/resume are current semantics. | Options/configuration cannot be an action gap. |
| Resume/receive | [zfs-receive](https://openzfs.github.io/openzfs-docs/man/v2.1/8/zfs-receive.8.html) | Partial state, -s and receive_resume_token/send -t are native recovery union. | Token scheduling is not N2. |
| Send modes | [zfs-send](https://openzfs.github.io/openzfs-docs/man/v2.0/8/zfs-send.8.html) | Raw/compressed/incremental modes and their constraints are public producer union. | Mode choice/re-encryption not residual. |
| Integrity | [ZFS checksums](https://openzfs.github.io/openzfs-docs/Basic%20Concepts/Checksums.html) | Replication stream checksums protect intervening transport/storage. | Changed stream/checksum behavior changes guarantee. |
| Stream tools | [zstream](https://openzfs.github.io/openzfs-docs/man/master/8/zstream.8.html) | Existing stream inspection/manipulation controls exist but do not establish a stock-equivalent joint state algorithm. | Generic transformation excluded. |

## Collision conclusion

Current upstream pin is fixed but a complete union-external two-plan witness and direct paper collision target are absent. No novelty clearance or direct absorption claim is made.
