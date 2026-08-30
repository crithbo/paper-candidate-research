# Same-object action-gap audit

The candidate needed a complete native producer/receiver construction that preserves the identical destination tree and metadata, uses the stock receiver protocol/result semantics, and supplies a target-specific guarantee. It could not be generic chunking, generic delta encoding, an option choice, or a controller.

| Candidate form | Current union subtraction | Result |
|---|---|---|
| Fixed/adaptive block selection | Current per-file block behavior plus `--block-size` | Absorbed or parameter selection. |
| Checksum substitution/selection | Negotiated/default checksum set and `--checksum-choice` | Absorbed or flag selection. |
| Whole file versus delta | Default local whole-file and explicit delta/whole-file modes | Absorbed. |
| Rolling-search/hash organization | Native receiver-signature and sender rolling all-offset matching construction | Generic delta/chunking remainder, not target-specific N2. |
| Scheduling scan/transfer/retry | Recursion/transfer/transport policy paths | Controller/policy, disallowed. |

No union-external same-object whole producer/receiver action was frozen. A proposal would replay current actions or change source/destination/metadata/protocol semantics. The visible candidate class is therefore structurally absorbed; this is independent of the unmeasured natural regime.
