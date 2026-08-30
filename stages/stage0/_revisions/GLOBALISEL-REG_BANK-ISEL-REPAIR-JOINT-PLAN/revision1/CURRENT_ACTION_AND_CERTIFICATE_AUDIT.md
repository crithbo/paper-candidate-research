# Current action and certificate audit

## Scope and source pin

This audit freezes **only** AArch64 scalar-64 mappings needed by the witness,
not a claim about every AArch64 opcode.  It is complete for the declared
region grammar at LLVM commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`.
The fixed object is an AAPCS64 `aarch64-unknown-linux-gnu` legalised SSA
MachineFunction and the unmodified downstream pipeline.

| MI form and predicate | Complete legal target alternatives used | Native cost/action facts |
|---|---|---|
| `G_LOAD s64`, exactly two operands, no implicit operands | `L_G=(dst:GPR64,addr:GPR64,cost=1)`; `L_F=(dst:FPR64,addr:GPR64,cost=1)` | AArch64 RBI explicitly returns these in GPR then FPR order |
| `G_OR s64`, exactly three operands, no implicit operands | `O_G=(all GPR64,cost=1)`; `O_F=(all FPR64,cost=1)` | explicit two-alternative RBI catalog in GPR then FPR order |
| scalar `G_FADD s64` in the fixed FPR sink cone | `F=(all FPR64)` | fixed target FPR mapping; no candidate choice |
| boundary address/live-in/sink | `pa,pb:GPR64`; `q,r:FPR64` | ABI and external interface are fixed, not chosen |
| mismatched operand | `Reassign`, `Insert`, edge/split or `Impossible` only where source permits | full current `RepairingPlacement` union, with materialisability predicate |

Excluded forms—including vectors, PHIs/terminators with unsupported repair,
implicit operands, scalable types, target-specific post-isel MIs and any
instruction not matching the rows above—delegate unchanged to stock.  That is
the complete finite action catalog for the paper's stated theorem domain.

## Native-source evidence

- [Pinned AArch64 RBI source](https://github.com/llvm/llvm-project/blob/ba5bccfe01368f76e74d6ff4c35f1330e155b4ba/llvm/lib/Target/AArch64/GISel/AArch64RegisterBankInfo.cpp) returns equal-cost GPR/FPR alternatives for scalar `G_OR`, scalar `G_BITCAST`, and s64 `G_LOAD`; its copy-cost function gives GPR-to-FPR cost 5.
- [Pinned RegBankSelect source](https://github.com/llvm/llvm-project/blob/ba5bccfe01368f76e74d6ff4c35f1330e155b4ba/llvm/lib/CodeGen/GlobalISel/RegBankSelect.cpp) visits the function in RPOT, uses `getInstrPossibleMappings`, retains a mapping only on strict cost improvement, and applies local repair placements.
- [Current RegBankSelect documentation](https://llvm.org/docs/GlobalISel/RegBankSelect.html) documents Fast and Greedy as current modes and Global as a future/intended mode.

The source check has an important negative constraint: `RepairingPlacement`
already handles CFG-aware locations, may split edges and can insert/reassign
repairs.  It is therefore a mandatory comparator action, never omitted to
manufacture the witness.

## Action-to-path / path-to-action certificate

For a declared region, every DP transition chooses exactly one catalog mapping
for its introduced MI and emits all source-required repair placements.  Thus it
forms a native plan.  Conversely, every native legal plan over this grammar
has one mapping ID and one repair kind for every MI/operand; introduce/forget/
join operations reconstruct its unique path through the decomposition.  Join
is legal only when its bank, repair, mapping and downstream-interface summaries
are identical.  Induction over the decomposition gives:

1. no DP path contains a nonnative mapping/repair;
2. every native plan appears in the frontier before dominance pruning; and
3. pruning cannot remove a plan with a different legal suffix or interface,
   because equality of `B,R,I,H` is a prerequisite.

For fixed `B,R,I,H`, all remaining permitted suffix actions and their declared
cost increments are identical; componentwise dominated `C` may therefore be
removed.  This proves exactness of the declared static Pareto frontier.

## Nonlocality proof for the witness

The local policy has no look-ahead from the first two `G_LOAD`s to the later
FPR-only `G_FADD`.  The strict `CurCost < Cost` comparison retains the first
GPR alternative at both equal-cost loads.  Once the GPR alternatives are
committed, the FPR OR has two input repairs and loses locally to `O_G`; the
subsequent FPR consumer receives one inserted conversion.  Local repair is
restricted to the surrounding MI/edge; it does not reopen predecessor mapping
selection.  A joint plan uses the same source actions but commits the FPR
alternatives before that irreversible local tie.  This is a causal
multi-instruction action divergence, not a different cost weight or a copy
counter.

## Full-cost boundary

The static theorem certifies only the defined RBI/repair/planner frontier.  It
preserves a complete downstream interface record, but does **not** infer final
RA, scavenging, frame, scheduling, MC/link or runtime improvement.  Those
dimensions are mandatory charged observations in Stage A.  Any failure of
that replay is a preclaim killer, not evidence for this revision.

