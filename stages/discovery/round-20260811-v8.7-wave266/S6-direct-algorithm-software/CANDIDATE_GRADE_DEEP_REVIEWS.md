# Candidate-grade depth red-team

The official GNU manual source-pins the MO semantics: header and offsets, sorted original descriptors, parallel translation descriptors, optional double-hash table, NUL-terminated strings, context/plural representation and charset declaration. It also documents `msgfmt` alignment, endianness and `--no-hash` options. This closes the relevant stock writer/reader action set sufficiently for the narrow claim.

The minimal two-file witness is reader-equivalent but absorbed by the native no-hash/alignment modes. The hash cannot become a new target-specific global constructor because it indexes a fixed sorted original table; a replacement hash/offset planner is either routine emission, generic static hashing or packing. No complete same-object N2 guarantee survives.

Finite falsifier: pin msgfmt/libintl, compile two native-legal variants of one catalog, check lookup/plural/context equality, replay native options and charge writer/reader/RSS/bytes. Reject if any claimed benefit is an existing option or a generic hash/layout kernel. **Status: `STRUCTURAL_DROP`.**
