# Global five-field identity preflight

This preflight separates local no-match from a novelty conclusion.

| RQ / seed | Five-field signature | All-history comparison | Relation | Result |
|---|---|---|---|---|
| RQ01 AArch64 MOPS | fixed AArch64 memmove semantics; MOPS/ordinary-copy segmentation; overlap and architectural restart endpoint; same ISA; code+runtime/full-copy cost | no exact local object/action/endpoint identity located | `NO_MATCH__NOT_NOVELTY_EVIDENCE` | source-check eligible |
| RQ02 Hexagon HVX | fixed HVX function/call graph; packet/register/call construction; ABI result endpoint; same target; compile+packet+spill/runtime cost | no exact local object/action/endpoint identity located | `NO_MATCH__NOT_NOVELTY_EVIDENCE` | source-check eligible |
| S03 OpenMP map/release | target-map completion/release trace | no selected RQ; only locator control | `NOT_ADMITTED__LOCATOR_ONLY` | no raw |
| S04 RISC-V vector state | vector call-state construction | prior RISC-V vector / RVV identity set | `RELATED_OR_TERMINAL_CONTROL` | seed excluded |
| S05 CUDA graph update | graph visibility/update action | prior CUDA graph identity set | `RELATED_OR_TERMINAL_CONTROL` | seed excluded |
| S06 ifunc resolver | resolver/form lowering | terminal ifunc identity | `TERMINAL_CONTAINS` | seed excluded |

Mandatory non-reopen controls were checked and not selected: Source45 MLPerf open bounded identity, Source44 RVV-VXRM active Stage 0 identity, Source43 bounded identities, and all frozen terminal identities.
