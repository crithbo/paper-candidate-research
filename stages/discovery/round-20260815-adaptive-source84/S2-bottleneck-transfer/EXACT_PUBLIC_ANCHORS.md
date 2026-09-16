# Exact public anchor

| Field | Frozen value |
|---|---|
| Anchor identity | `OPENXLA_XLA_GPU_BUFFER_ASSIGNMENT__COMMAND_BUFFER_CAPTURE_REPLAY` |
| Primary official source | OpenXLA, “From HLO to Thunks”, accessed 2026-08-15: https://openxla.org/xla/hlo_to_thunks |
| Current-source loci | `openxla/xla` current `main`, `xla/service/buffer_assignment.*`, GPU runtime command-buffer conversion sources, and `xla/debug_options_flags.cc`; source pin remains a bounded closure debt |
| Exact same-object boundary | Fixed HLO module, target/toolchain and debug configuration, input/output tensor shapes and values, device/host transfer semantics, and stock XLA GPU executable observable results |
| Non-generic endpoint | Pareto frontier over peak device allocation, command-buffer record CPU, replay/launch CPU, and end-to-end device execution—under identical HLO/output semantics |
| Oracle | Stock XLA executable result equality plus stock command-buffer legality; no custom reader or altered runtime contract |
| Natural/canonical carrier route | Version-pinned public XLA GPU HLO test modules selected deterministically from `openxla/xla` testdata after resolving the current commit; this is a finite canonical route, not a claimed natural performance result |

The official documentation explicitly presents buffer assignment before lowering and command-buffer conversion over compatible contiguous thunks. It establishes the phase boundary motivating the RQ, not that current XLA lacks any joint algorithm.
