# Candidate-grade deep review

## BTF typegraph/stringtable planner — NOT_ADMITTED_UNFROZEN

The Linux BTF specification defines type data and a string table. Struct member records carry a type ID and name offset. BTF.ext carries func information, line information and CO-RE relocations; the specification explicitly requires loader manipulation, and its records include type IDs and section/access-string offsets. Hence a valid planner must regenerate the complete reference closure, not merely reorder raw type records.

The proposed same-object action is a joint type dedup/canonical ordering/string assignment over a fixed decoded type graph, while preserving CO-RE, line and function semantics. A two-independent-type swap plus full reference regeneration is a finite native-legal witness. It does not establish a research action: without a formal graph/dependency/loader-cost guarantee, it reduces to existing dedup plus record ordering.

Current LLVM/pahole/dwarves producer flags, type-dedup scopes, declaration tags, datasec handling and all libbpf paths have not been source-enumerated. No implementation absence is claimed. Direct collision search is likewise open. Therefore neither the strongest current union nor a union-external nontrivial N2 is frozen.

Natural carrier: version-pinned Linux kernel BTF and public CO-RE eBPF object sources (for example libbpf-bootstrap); no asset was fetched. Oracle: bpftool BTF display/digest, stock libbpf parse/load and kernel verifier acceptance, with equal decoded graph and CO-RE/line/func records. Full cost: producer/write CPU-wall-RSS-temp, `.BTF`/`.BTF.ext` bytes, libbpf parse/load and verifier CPU/RSS, loader relocation work and read cost.

72-hour killer: pin current LLVM, dwarves and libbpf commits; enumerate all producer dedup/ID/string/config paths; construct the full type-ID/string-offset regeneration witness; check bpftool decoded equality and stock libbpf/kernel acceptance; reject if native union expresses it, effects reduce to ordering, CO-RE semantics differ, or full cost absorbs byte gains.
