# Divergence seed pool — Source68

Generated before source lookup. No seed is evidence, a raw row, or an opportunity denominator.

| Seed | Engine | Perspective | Sketch | Selection |
|---|---|---|---|---|
| S68-01 | `BISOCIATION_STRUCTURAL_TRANSFER` | linker engineer | Relative relocation packing can move link output size cost to loader relocation/read cost. | selected |
| S68-02 | `ADJACENT_POSSIBLE_OR_BOUNDARY` | platform loader engineer | Mach-O chained fixups can move image-load cost to chained-fixup construction/layout. | selected |
| S68-03 | `ABSTRACTION_LADDER` | runtime deployment engineer | ReadyToRun precompilation can move JIT cost to image construction/validation/loader interaction. | selected |
| S68-04 | `NEGATION_OR_INVERSION` | compiler engineer | ELF static PIE layout can move startup work to relocation metadata. | backlog |
| S68-05 | `COMPOSE_DECOMPOSE_SIMPLIFY` | application maintainer | NativeAOT image reuse can move startup cost to code/data fixup construction. | backlog |
| S68-06 | `JANUSIAN_TENSION` | systems reviewer | dyld shared-cache prebinding can trade startup for cache construction. | backlog |

The selected formats/loaders are distinct. Backlog is fixed and cannot replace a rejected selected seed.
