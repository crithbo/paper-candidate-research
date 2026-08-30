# RQ candidates

## Primary RQ — S82-RQ-01

For a fixed Linux x86-64/i386 position-independent ELF shared-object input, exported interface, logical pointer values, and stock GNU-loader semantics, can a target-specific joint constructor of relative-pointer placement and RELR encoding improve complete link, file-size, and loader cost beyond GNU ld `--pack-relative-relocs`?

The first-party evidence check answered the decisive structural question early: once object semantics are fixed, the concrete proposed action is ordering/alignment of relocatable address slots to yield more RELR bitmap runs. That is generic representation packing, not a target-specific algorithmic action or guarantee. Replacing the reader/loader or changing binding/ABI would violate the question.

Accordingly this RQ is excluded before raw rather than converted into a generic solver, layout flag selector, or compression wrapper.
