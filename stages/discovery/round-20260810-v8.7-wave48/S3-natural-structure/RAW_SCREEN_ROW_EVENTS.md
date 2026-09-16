# Wave48 raw-screen row events

Frozen assignment: `DISCOVERY-S3-20260810-V8.7-WAVE48-NATURAL-STRUCTURE-DEEP`  
Frozen cutoff: 2026-08-10.  Rules frozen: `v8.7 + R3-P0/R4 + R5-P0`; shadow v8.8 and R5-P1/P2 were neither read nor applied.

Each row below is a screening event, not a candidate count.  Re-screens are retained separately from deduplicated families.

| event | family | object / natural carrier | raw disposition | reason at screen |
|---|---|---|---|---|
| R01 | INFLUX-TSM-BLOCK-CUT | InfluxDB v2 OSS TSM series blocks; public operational time-series exports | `DEEP_DIVE_REQUIRED` | Natural value/timestamp runs could admit a legal block-boundary constructor; no claim of an uncovered action yet. |
| R02 | RE2-DFA-BUDGET | RE2 compiled regex plus production regex/text corpus | `STRUCTURAL_DROP` | Current native memory-budget partition, cache flush and NFA fallback already define the relevant semantic-preserving actions. |
| R03 | EXT4-EXTENT-PLACEMENT | ext4 logical-file-to-extent mapping over real build/package trees | `DEEP_DIVE_REQUIRED` | Extent locality is natural and verifier-visible; must distinguish an output constructor from allocator heuristics. |
| R04 | HPACK-TABLE-RETENTION | HTTP/2 header traces and HPACK dynamic table | `STRUCTURAL_DROP` | Retention/eviction is the protocol's native dynamic-table decision; a policy substitution would be a controller. |
| R05 | JEMALLOC-SIZE-CLASS | jemalloc allocation traces and size-class map | `STRUCTURAL_DROP` | Changing size classes alters allocator representation/ABI-cost contract; remaining knobs are tuning. |
| R06 | OPENFST-STATE-ORDER | weighted FST repositories and OpenFST serialized FSTs | `STRUCTURAL_DROP` | Determinization/minimization/optimization already supply same-object constructors; no atomic union-external action was named. |
| R07 | ELF-HASH-LAYOUT | ELF shared-object repositories with GNU/SysV hash sections | `STRUCTURAL_DROP` | Linker already chooses `--hash-style`; output-format variant is a link-time option, not a new same-information constructor. |
| R08 | CUDD-REORDERING | BDD/DdManager workloads from formal-tool repositories | `STRUCTURAL_DROP` | Dynamic reordering is native and configurable; a trace-selected order is a prohibited selector. |
| R09 | INFLUX-TSM-BLOCK-CUT | same family re-screened after current storage-engine documentation check | `STRUCTURAL_DROP` | Current TSM writer already couples compression to timestamp/value shape; proposed bounded cutting has no established union-external atomic action. |
| R10 | EXT4-EXTENT-PLACEMENT | same family re-screened after allocator/documentation check | `STRUCTURAL_DROP` | A possible global placement routine would replace native allocator semantics; bounded same-function verifier route is not frozen. |

Counts required by R5-P0: `RAW_SCREEN_ROW_EVENT=10`; `re-screen events=2`; `UNIQUE_OPPORTUNITY_FAMILY=8`; `CANDIDATE_GRADE_DEEP_REVIEW=2`; `STAGE0_BRIEF=0`.
