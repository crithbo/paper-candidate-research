# Claim matrix

| Gate claim | Result | Evidence / boundary | Consequence |
|---|---|---|---|
| Immutable current QEMU source can be pinned | PASS | v11.1.0 `84f07211cc5b4fc6a371559bf8a5de4fb068e648` | source/object freeze closed |
| Current region allocation/full flush/invalidation union is complete enough for comparison | PASS | official docs plus region/TB-maintenance paths | strong baseline fixed |
| Current union already performs selected live-TB capacity relocation | FAIL | current actions allocate regions, flush all TBs, or delete invalid TBs | no direct absorption found |
| Same-QEMU direct-chain witness is finite | PASS | fixed `A -> B`, same page/fixed CPU state, with `C` invalidation control | fidelity route is testable |
| All live-reference categories have a total quiescent repair/publication action | PASS | QHT, page, cache, direct-jump, host-PC and region-reset catalogue | transition contract is closed |
| Candidate collapses to generic cache controller/compaction | FAIL | QLCF-DP state/action invariant is tied to QEMU-native reference closure and safe fallback | target-specific N2 remains |
| Finite, honest guarantee exists | PASS | exact DP under declared treewidth/destination/slack/repair parameters; full-flush fallback | no unbounded or speed guarantee claimed |
| Stage A fidelity/full-cost falsifier is finite | PASS | two-TB replay, page control, guest/exception and reference oracles | later preclaim route fixed |
| Revision budget | CONSUMED | this certificate is gate-bearing scientific revision | independent closing only |

Claim ceiling: conditional Q2 potential only.  No code-cache size, memory, throughput, translation, or correctness result is claimed before a future Stage A fidelity closure.
