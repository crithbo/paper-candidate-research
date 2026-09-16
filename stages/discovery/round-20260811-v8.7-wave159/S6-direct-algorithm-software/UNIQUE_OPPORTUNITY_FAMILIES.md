# Unique opportunity families

## pcapng shared block-boundary and per-interface-state construction

**Exact same object.** A fixed ordered sequence of captured packet octets with their timestamps, per-packet interface identity, and fixed interface/name/statistics/custom metadata, serialized into a pcapng file and consumed by an unchanged stock pcapng reader.  Oracle equality is the reader's packet-byte/timestamp/interface-metadata digest plus successful format parsing; byte equality is not required.

**Candidate complete action considered.** Jointly place each Section Header, Interface Description, Enhanced Packet, Name Resolution, Interface Statistics and permitted Custom Block; bind each EPB to its already fixed interface; and select the option/state emission associated with that placement, without changing packet order or metadata.

**Natural carrier route.** A version-pinned public multi-interface capture trace, with its packet/interface digest recorded before any writing action, is a finite route.  No trace has been fetched in Discovery, so it is not claimed as evidence.

**Disposition.** `NOT_ADMITTED_UNFROZEN`.  The current standard establishes legal grammar freedom, and Wireshark current source establishes a substantial native reader/writer surface, but this review did not complete a source-pinned enumeration of every writer path and default/non-default configuration for NRB, ISB, custom blocks and section/interface emission.  Hence neither a current-absence gap nor a union-external complete constructor is asserted.  The grammar itself also makes a likely proposal suspect: choosing positions of fixed optional metadata is not yet a demonstrated nontrivial N2 rather than serialization policy.
