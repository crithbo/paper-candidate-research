# Current upstream audit — OpenXLA retry1

## Immutable scope

The official commit response pins `openxla/xla@3527e1e6a5a82770e4ad8c8a2d9c64dd30ec91f6`, tree `83e9eab8e178a6541c7af66ddd263192797169b2`. The frozen object remains one fixed HLO module lowered to a stock XLA GPU executable with unchanged semantics, buffer-assignment and contiguous command-buffer conversion/replay endpoint.

## Bounded current action/configuration union

| Retained locus | Observed current role | Consequence |
|---|---|---|
| `xla/service/buffer_assignment.cc` and `buffer_assignment_test.cc` | Native buffer allocation/slice assignment, including sequential-order test entry points and reuse/isolation cases. | Allocation and lifetime legality are already a stock decision surface. |
| `xla/backends/gpu/runtime/command_buffer_conversion_pass.cc` | Conversion pass maps supported runtime sequences into command-buffer machinery with command configuration. | Capture/group conversion has native eligibility/configuration semantics. |
| `command_buffer_conversion_pass_test.cc` | Test config explicitly enables command-buffer command types and checks conversion to command-buffer thunks. | Supported capture action is not an unmodelled interface gap. |
| `command_buffer_cmd_emitter_test.cc` | Tests cover concurrent/sequential execution graphs, out-of-order regions, lane affinity, conditionals and while handling. | Command grouping/scheduling already has a nontrivial stock runtime action family. |
| `xla/debug_options_flags.cc` | Debug-options flags configure relevant GPU behavior. | Defaults/non-default controls must be included in any later same-object comparator. |

The two frozen directory listings yielded `buffer_assignment_test.cc` and, excluding the fixed conversion test, ordinal-first `command_buffer_cmd_emitter_test.cc`. No directory expansion occurred.

## Carrier and residual status

The bounded tests establish independent stock allocation and command-buffer carriers, but do not supply two complete same-HLO plans jointly varying allocation plus command grouping under one frozen full-cost ledger. Nor do they define a target-specific action outside the composition of allocation, scheduling and command-buffer configurations. A generic packing/scheduling controller or changed HLO/executable contract cannot fill that gap.

Future closure would need a fixed HLO with two complete native-legal allocation-and-group plans, then a target-specific action and finite guarantee outside this current union. Full cost must include allocation/peak bytes, capture/record/replay, scheduler/grouping work, conversion/configuration overhead and executable semantics.
