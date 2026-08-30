# Candidate-grade deep review

## pcapng multi-interface block/state constructor — NOT_ADMITTED_UNFROZEN

### Same-object contract and native oracle

The input fixes packet order, bytes, capture timestamps, `interface_id`, and all interface/name/statistics/custom metadata.  The output is one pcapng serialization.  A stock Wireshark/libwiretap parse followed by a canonical packet/interface/metadata digest is the oracle.  The proposal may not add a capture policy, reorder packets, alter metadata, compress externally, or require a modified reader.

### Current authoritative grammar

The active IETF `draft-ietf-opsawg-pcapng-05` (revision dated 2026-03-16; Datatracker updated 2026-07-20) explicitly describes pcapng as extensible and shows a complex file with multiple interfaces, EPBs, NRBs, later IDBs, and ISBs.  Its grammar provides the legal carrier for a hypothetical joint constructor, but it does not itself demonstrate a software residual.

### Current upstream reality and fair union

Frozen upstream is Wireshark `master`, accessed 2026-08-11, source loci `wiretap/pcapng.c`, `wiretap/pcapng.h`, `wiretap/pcapng_module.h`, and `dumpcap.c`.  The actual reader source exposes block handlers, option parsing/writing callbacks, interface state, EPB packet/interface fields, NRB/custom block data, and reader/writer handler registration.  Official current pcapng materials state Wireshark reads and writes the format.

The *proven* strongest same-information union comprises the standard legal grammar together with current native Wireshark paths evidenced above.  It is intentionally not overstated as a complete executable writer union: this static pass did not enumerate all writer call sites and CLI/configuration routes for section, IDB, EPB, NRB, ISB, custom blocks and options.  Consequently, an absence claim cannot be made, and neither can a proposed action be certified outside the union.

### Minimal legal witness and why it does not admit a brief

Let two fixed interfaces have IDBs, then EPBs with interleaved timestamps; insert a fixed name-resolution record after early packets and fixed interface statistics after later packets.  The IETF example confirms this kind of multi-interface mixed-block layout is legal.  This is a **legality witness**, not an action-divergence certificate: no source-pinned proof says that the native writer cannot express the alternative legal placement, and the apparent action is currently only placement of fixed optional records.  It could be a writer policy/configuration, not a new whole-object N2.

### Required finite fidelity closure if a later assignment reopens it

Within 72 hours, pin a Wireshark master commit and enumerate `pcapng_write_*`, `pcapng_dump_*`, `pcapng_*block*`, dumpcap/tshark/editcap output flags and their defaults/non-defaults.  Freeze a small public multi-interface trace and the packet/interface/metadata digest.  Enumerate every legal writer path for the witness, parse each with stock reader, and reject the line if (a) native union writes the proposed sequence, (b) it changes packet order/metadata or reader semantics, (c) it only selects existing options, or (d) no nontrivial algorithm/guarantee remains.  If it survives, the full-cost ledger is file bytes, write/read CPU and wall time, RSS, temporary storage, and seek/open behavior—never capture/network-policy cost.

### Six-dimensional result

| facet | finding |
|---|---|
| decision rule | a complete global placement rule is not frozen |
| information | fixed packet/metadata information is clear |
| complexity/resource | no union-external N2 operation is identified |
| quality/guarantee | reader equality is available, but no new guarantee is stated |
| full cost | finite denominator is specified but not measured |
| generalization/no-gain | metadata placement may be policy/configuration, so no transferable claim is supportable |

**Decision:** `NOT_ADMITTED_UNFROZEN__CURRENT_WRITER_UNION_AND_COMPLETE_N2_ACTION_NOT_CLOSED`.  No scientific negative inference is made.
