# Revision audit — KALLSYMS token stability

## Frozen inputs and mechanical checks

| Item | Required SHA-256 | Result |
|---|---:|---|
| AGENTS.md | 66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063 | PASS at assignment start |
| plan.md | 978FE016FF87789CDC4CDE68B5D04ADC46943CEF5E341075E71A70C9DB785448 | PASS at assignment start |
| registry.yaml | 857BC250001AFDA462B5572B0098E5F57AA8B4D6F8C18AA6333D9A60DB6DDB6F | PASS at assignment start |
| ROLE_STAGE0_REVIEW.md | 741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E | PASS at assignment start |
| Primary manifest | 1FB7A293E1BE441C6B5A740A5BEEEB4B22028A9401D3F9C9B9283549401C5014 | 4/4 PASS |
| Confirmation manifest | F711BACB784BB6D7D79CD2FB61033428F12309BC2604A327DDEA7FE0D6FD08B8 | 2/2 PASS |

## Current-source reality check

The pinned Linux upstream source is `d58772d8520c7ef247c4b95c9bd76d3a25da9ff5`.

| Primary source | Fact independently used | Consequence |
|---|---|---|
| `scripts/kallsyms.c` | Current construction scores two-byte token profits and greedily fills free slots; `compress_symbols` applies non-overlapping replacements. | Current action is a specific greedy construction, not the entire legal native grammar. |
| `scripts/kallsyms.c` | `expand_symbol` recursively expands token entries; writer emits names, markers, token table/index, offsets and name sequences. | Acyclic recursive productions plus unchanged writer/reader are mandatory; an external map codec is not same-object. |
| `kernel/kallsyms.c` | Reader expands the emitted table and uses name sequences for lookup. | Reader cannot change; every action must decode to the same logical symbol relation. |
| `scripts/link-vmlinux.sh` | The script regenerates kallsyms through relinks and final `System.map` comparison, with an optional extra pass on object-size change. | Native fixed point is a hard predicate.  `R0` preserves object layout and still uses this script, instead of bypassing it. |

No absence claim is made: `SEARCH_BOUNDED_OPEN` remains for direct literature/current-source collisions outside the frozen sources.  The construction's claim is restricted to the declared native subgrammar; it does not assert that upstream lacks all possible global optimizers.

## Comparator boundary

| Comparator | Same object? | Role |
|---|---|---|
| Pinned stock kallsyms + full link | Yes | Required native anchor |
| Stock plus VCDIFF / second binary delta | Final artifact only; token grammar unchanged | Strong patch subtractor |
| Finite predecessor-token stability grid | Yes if run through the same link schedule | Direct heuristic comparator |
| Tiny exact/CP enumeration | Yes only on fixture | Oracle/audit, never core method |
| FSST/Courgette/line-info delta | No unchanged token-reader contract | Related-work subtractors, not equal-quality baseline |

## Scientific-risk audit

- The `R0` restriction is deliberately conservative.  A positive Stage-A claim requires an actual action outside the comparator union; it cannot relax `R0` to rescue a result.
- The pathwidth guarantee is conditional on the **complete** factor graph.  It is not a claim that Linux maps have small width, nor a generic polynomial solver claim.
- The 8-versus-15 command accounting is a static data-bearing witness under the declared transducer.  It is not a measured full-kernel delta result.
- No GPU, hardware, implementation, benchmark, or download was used; their absence did not determine the decision.
