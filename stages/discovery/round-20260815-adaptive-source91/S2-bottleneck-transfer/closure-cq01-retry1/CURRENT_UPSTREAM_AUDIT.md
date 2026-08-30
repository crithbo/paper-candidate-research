# Current upstream audit — CPython retry1

## Immutable identity and scope

The official Git commit API identifies `dffac6163e693cf80ed42cdc8e2cb5c0cb9577d7` with tree `3d2185a5b91be271c46afcf1ab84d5206c115ae6`. No branch, substitute commit, clone, build, or execution was used.

The frozen object remains one fixed source module and input under stock CPython with unchanged bytecode, language, exception, adaptive-specialization, deoptimization, output, and full-cost semantics.

## Bounded current action/configuration union

The retained source shows the following connected stock mechanism, not an absence claim:

| Locus | Current action or constraint | Consequence for the frozen object |
|---|---|---|
| `Include/internal/pycore_code.h:16,61-65` | `co_code_adaptive` is the code-unit carrier; inline-cache entry count is representation-coupled and changing it also requires opcode metadata update. | Cache footprint/layout is not independently configurable per runtime event in this bounded source view. |
| `Python/bytecodes.c:64,78` and generated opcode metadata path | Bytecode definitions declare cache effects; deoptimization guards are emitted with the instruction semantics. | Opcode representation, cache slots, and deopt guards form one generated/native family. |
| `Python/specialize.c:18,65-79` | Specialization uses opcode metadata and adaptive/backoff counters. | State transition and specialization policy already use the native inline-cache/metadata representation. |
| `Python/opcode_targets.h:2-3` | The 256-way dispatch table includes `TARGET_CACHE`. | Dispatch has a stock cache-bearing opcode target contract. |
| `Lib/test/test_dis.py`, `Lib/test/dis_module.py` | Existing test/disassembly carrier. | They expose a carrier for future static semantic/layout inspection, but no pair of complete competing plans is established by this source-only closure. |

The three frozen directory listings were used only for the specified deterministic selection rule. After excluding the four fixed files, `opcode_targets.h` and `dis_module.py` were selected as the ordinal-lexicographic source and test matches. Directory discovery was not expanded.

## Two-plan and residual status

This source scope establishes the stock representation/action boundary, but it does **not** establish two complete stock-legal cache-layout-plus-specialization-state plans for one fixed module/input. In particular, no retained source specifies a legal caller-facing operation that swaps cache layout independently while retaining the same bytecode, specialization/deoptimization contract and full-cost endpoint.

Accordingly, a union-external CPython-specific joint action, its information boundary, a non-generic discriminator, and a finite guarantee remain unclosed. Treating a generic packing, state-machine controller, or changed bytecode representation as that residual would violate the frozen object.

## Full-cost and falsifier ledger

Any later closure must account for code footprint/cache bytes, dispatch work, adaptive and deoptimization transitions, source/bytecode generation, and semantic/disassembly checks. A finite falsifier is: exhibit a fixed module/input with two complete native-legal plans and demonstrate that the proposed action differs from the native family while preserving bytecode, exception, specialization/deoptimization and output semantics. Failure to produce that pair leaves the residual unclosed.
