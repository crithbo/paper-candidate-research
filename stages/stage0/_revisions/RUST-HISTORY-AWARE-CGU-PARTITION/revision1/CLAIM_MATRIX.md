# Claim matrix — Rust history-aware CGU partition revision1

| Gate element | Required evidence | Frozen-input status | Finding |
|---|---|---|---|
| Same current object | Named current crate plus current mono-item graph | absent | blocker |
| Predecessor-only information | Pinned prior checksums/lockfiles, no successor signals | absent | blocker; boundary is defined |
| Two complete legal plans | All roots/inlined items, linkage, names, merge, symbols and ABI | impossible to enumerate without graph | not fabricated |
| Current union | Collection, placement, inlining, merge, symbols and Cargo/rustc grid | source-level audited | retained comparator |
| Rust-specific finite state | Preserves all future native actions, legality and declared full cost | cannot validate without graph action map | pending resume |
| Non-generic N2 guarantee | Exact/FPT/certified bounded frontier over Rust-specific state | cannot honestly state | pending resume |
| Direct collision | Current same-object method + objective + guarantee | bounded official search | `SEARCH_BOUNDED_OPEN` |
| Stage A falsifier | Same-contract legality/union/shuffle/full-cost test | finite route is specified | not authorized |

## Decision logic

This is neither `PASS` nor the terminal generic-collapse sentinel.  A PASS
would assert an unobserved concrete graph and native action divergence; a STOP
would treat a missing but finitely obtainable input artifact as scientific
negative evidence.  The correct disposition is therefore
`BLOCKED_USER_ACTION_REQUIRED__MISSING_FROZEN_CURRENT_MONO_ITEM_GRAPH` and the
scientific revision remains unconsumed.
