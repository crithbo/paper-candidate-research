# Candidate-grade deep reviews

## UOF-241-01 — FDT/DTB

**Same object/oracle.**  For one pinned DTS semantic tree, preserve all node/property/value content, FDT header/version constraints and the stock parser's interpretation.  Linux documentation specifies a DTB header, structure block and a concatenated strings block; property records hold string-block offsets.  It also says property definitions must precede subnodes for kernel parser compatibility.

**Static action-divergence witness.**  With two decoded trees whose property-name sets overlap, two legal strings-block orders can have equal decoded relations yet different byte alignments and different VCDIFF source matches.  A joint constructor can select an order/layout by `bytes(D_i)+lambda*delta(D_{i-1},D_i)`, while a per-version emitter chooses an order from only the current input.  This witness is semantic/algebraic, not a natural gain.

**Strongest composition.**  Current `dtc`/libfdt construction with all writer flags/version/padding choices, then standard VCDIFF.  The same predecessor bytes and tree must be available to the current builder composition.

**Closure finding.**  The reviewed Linux document describes format and `dtc`, but does not pin current dtc/libfdt writer source, all output flags/defaults, release-tag DTB carriers, or the exact legal writer action frontier.  Therefore the union is incomplete. `NOT_ADMITTED_UNFROZEN`, not DROP.

**Finite plan/killer.**  Later Stage A may select 20–50 official tag-adjacent DTS→DTB pairs under one architecture/`dtc` pin, save source/config/tool hashes and validate decoded relation with libfdt. Kill if stock writer configuration reproduces the action, any reader semantic mismatch arises, current flags make it tuning-only, or full artifact+delta/build/read/boot CPU-RSS has no held-out residual.

## UOF-241-02 — kmod binary indexes

**Same object/oracle.**  Fixed dependency/alias mapping over a frozen module tree and a stock libkmod query result.  The official kmod project identifies libkmod-backed tools for resolving module dependencies and aliases, with compatibility requirements for indexes.

**Action witness.**  If two legal index layouts encode the same mapping and one is locally slightly larger but shares more stable predecessor bytes, a predecessor-aware finite frontier DP chooses differently from a per-version producer plus post-hoc delta.  It is a whole index construction only if index grammar and decoder acceptance are fixed.

**Strongest composition/full cost.**  Frozen `depmod`/libkmod producer and reader configurations plus same-information VCDIFF; index/image/delta bytes, index construction CPU/RSS, libkmod lookup CPU/RSS and module-tree acquisition/verification cost.

**Closure finding.**  Current producer source revision, `modules.dep.bin` grammar/configurations and an official adjacent module-index artifact series were not pinned.  No claim that depmod lacks an action is made. `NOT_ADMITTED_UNFROZEN`.

**Killer.**  Same as FDT, plus reject if the required carrier necessarily changes module set/alias semantics or an external cache is needed.

## UOF-241-03 — OpenJDK jimage

**Same object/oracle.**  Fixed JDK module/resource mapping and byte payloads, read through a stock jimage reader.  OpenJDK material records that JDK 9's `lib/modules` is a jimage, with header/index/resource sections and module/resource lookup goals.

**Action witness.**  A legal resource-index/layout candidate can trade local jimage bytes against prior-version byte stability; independent jlink construction plus VCDIFF never changes the builder decision from predecessor state.  This is a possible N2 only after the current legal layout space and stock reader are fixed.

**Closure finding.**  Current jlink source pin, all current flags/plugins, exact reader equivalence and small official adjacent image route are not frozen.  The OpenJDK investigation paper is format context, not evidence of a residual. `NOT_ADMITTED_UNFROZEN`.

**Finite plan/killer.**  Pin 20–50 official JDK tags/images and a jlink build; validate resource map/bytes and stock lookup; account image/delta/build/read/startup CPU-RSS. Kill on semantic inequality, in-union construction, unbounded action frontier or no held-out residual.

No deep review alleges an absence in upstream tools or treats unmeasured natural data as negative evidence.
