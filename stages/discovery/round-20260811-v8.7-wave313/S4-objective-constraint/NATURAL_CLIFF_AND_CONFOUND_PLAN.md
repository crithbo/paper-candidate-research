# Natural cliff and confound plan

## Pre-registered route, not observed evidence

The natural suite must be selected before any observation: 20–50 versioned public JavaScript programs drawn from named WebKit test material and independently versioned public applications, frozen by repository commit/release and source hash. Each program must retain its ordinary executable JavaScript semantics under the pinned JSC revision.

For every program, record source bytes; parsed syntax-node/opcode mix; function count; literal/identifier/constant-pool counts; generated cache bytes; cache-write CPU/RSS/temp; cold and warm cache-read/startup CPU/RSS/latency; and invalidation/rebuild cost. The same stock interpreter/cache reader is the oracle; no alternate runtime, parser, or reader may enter the comparison.

## Cliff criterion

The candidate N3 phenomenon would require a discontinuity that remains after normalization by source size and syntax/bytecode composition, repeats across independently selected programs, and is visible in at least two measurement dimensions (for example cache bytes and cold-read RSS/latency). A monotone size effect, one application outlier, or a user-selected threshold is not a cliff.

## Confounds and controls

- Freeze the WebKit commit, architecture, OS, allocator/build mode, process isolation, and storage state.
- Separate cold, warm, and invalidated cache states; do not mix JIT-tier warmup with cache-read effects.
- Match or stratify program size, module/script form, source origin, syntax mix, code-generation features, and cache identity inputs.
- Repeat each condition and inspect source/bytecode dumps to prevent input-distribution changes from masquerading as representation behavior.
- Account for all write/read/invalidation work, temporary files, and RSS, rather than only bytecode bytes or steady-state interpreter time.

No such data were collected in this assignment. Hence the representation-cliff hypothesis remains unmeasured.
