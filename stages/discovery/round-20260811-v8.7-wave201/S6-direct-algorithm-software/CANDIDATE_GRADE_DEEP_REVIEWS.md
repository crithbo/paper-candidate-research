# Candidate-grade deep review

## ECMA-335 table-row / heap global assignment — STRUCTURAL_DROP

### Current upstream reality and strongest union

The official `MetadataBuilder` API adds rows and returns typed handles; its current serialization obtains row counts and heap sizes, then computes stream layout. `MetadataRootBuilder.Serialize` validates ECMA-required table ordering unless `SuppressValidation` is explicitly set. `MetadataSizes` derives compressed-stream simple/coded index widths from the maximum row counts of the referenced table families and derives heap-index width from complete heap size. Thus table and heap placement are already globally coupled in the native representation, not independent local bytes.

Relevant configuration paths include normal versus Edit-and-Continue delta (`#-` / uncompressed) representation and standalone debug metadata. The current builder's `SuppressValidation` option was checked as a validation switch, not evidence that arbitrary output retains normal CLI semantics. A complete Roslyn/ILAsm flag inventory is not needed to decide the earlier same-object failure, so no implementation-absence claim is made.

### Minimal action-divergence witness

Consider two distinct MethodDef rows A and B in a valid metadata table. A row swap followed by complete regeneration of all metadata references, coded/simple indexes, IL token operands, and sorted-table associations can yield a reader-valid assembly. It necessarily changes A/B's row IDs and therefore their metadata tokens. The operation is technically native-legal only for the changed artifact; it is not legal under the frozen same-object contract.

The attempt to retain old token values eliminates the row-assignment degree of freedom. Heap-only remapping also must regenerate every heap reference and offers no stated non-routine N2; index-width thresholds depend on aggregate sizes, not on frequency ordering alone.

### Same-object oracle, natural carrier, cost, and killer

- Oracle: stock .NET reflection token queries plus IL token inspection; `ildasm /metadata=VALIDATE` and raw/schema display are additional structural checks. A valid strong-name verification path is required where the carrier is signed.
- Natural route: version-pinned public .NET Runtime and Roslyn C#/VB assemblies, with their ordinary build inputs; no corpus was downloaded or built in this assignment.
- Full cost: build/writer CPU, wall time, RSS and temporary storage; PE and metadata-stream bytes; verifier/disassembler CPU/RSS; CLR load/reflection and PDB/debug lookup cost; signing/re-signing cost where applicable.
- 72-hour killer: pin the producer commits; take two token-addressable public members; apply the complete-reference-regeneration construction; inspect IL and `MetadataToken` through stock tooling. If either value changes, reject same-object immediately. If values are constrained to remain identical, show whether any remaining joint heap action has a nontrivial formal objective beyond routine interning/order; otherwise reject.

### Collision and fidelity conclusion

Latest direct-collision closure is unnecessary to the disposition: token observability is a direct same-object counterexample. No claim is made that no metadata-packing work exists. The correct outcome is `STRUCTURAL_DROP`, not `NOT_ADMITTED_UNFROZEN`, and neither missing implementation nor missing performance evidence influenced the decision.
