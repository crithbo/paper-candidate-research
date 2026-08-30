# CASE-A — executor result

Assignment: `BACKTEST-EXECUTOR-L1-20260814-DIVERGENCE-SEED-FRONTEND-V1-R1`  
Cutoff: `2023-07-16`  
Disposition: **PROPOSE_STAGE0**

## Divergence seed pool (non-evidentiary)

| ID | Engine / rotated perspective | Cautious conclusion if true |
|---|---|---|
| S1 | Constraint manipulation / algorithm | Exact attention may admit a different tile-residency schedule for asymmetric query/key-value shapes. |
| S2 | Problem reframing / systems | The unit of optimization may be a sequence batch with ragged lengths, not one dense attention matrix. |
| S3 | Adjacent possible / memory hierarchy | Online normalization could be composed with a schedule that preserves only the sufficient per-row state across tiles. |
| S4 | Contradiction juxtaposition / cost | A FLOP-reducing alternative can lose to an exact method once HBM traffic, synchronization, and padding are all charged. |
| S5 | Abstraction ladder / compiler | A declarative tile-and-residency plan might expose a portable exact-action search space without changing attention semantics. |
| S6 | Reversal / falsification | If all legal ragged/asymmetric schedules reduce to the existing dense tiling plan, the residual disappears. |

## Evidence-gated coverage locators

| Locator | Supplied evidence | What it establishes | Seed disposition |
|---|---|---|---|
| L1 | `sources/E01.pdf`, abstract and §1 | The carrier is attention-based sequence transduction and uses scaled dot-product/multi-head attention. | Bounds S1–S5 to the same attention function. |
| L2 | `sources/E02.pdf`, abstract and §1–2 | Prior efficiency work changes attention complexity and uses reversibility/chunking; it identifies activation and quadratic-attention memory costs. | Keeps approximation and changed training architecture outside the proposed action. |
| L3 | `sources/E03.pdf`, abstract and §1 | An exact IO-aware tiled attention action already reduces HBM traffic and must be the direct comparator. | Narrows S1–S5 to residual scheduling conditions, not a generic “faster attention” claim. |

## Question Card

| Field | Frozen executor formulation |
|---|---|
| Exact object / natural scenario | Exact scaled-dot-product attention in long-context training or inference, including causal/mask semantics, on a hierarchy with HBM and on-chip fast memory. |
| Opportunity | Existing supplied coverage separates approximate complexity reduction from an exact dense IO-aware tile action; it does not establish direct coverage of a schedule specialized to ragged/asymmetric batches under the same semantics. |
| Atomic action and mechanism | Generate a legal **exact** tile-residency schedule that retains online-normalization sufficient statistics, chooses Q/KV traversal from actual ragged/asymmetric shapes, and accounts for padding and synchronization. |
| Information condition / comparator | Inputs include Q, K, V, mask, sequence lengths, device-memory capacity, and dtype. Comparator is the supplied exact dense IO-aware tiled action under identical tensors, masks, precision, and end-to-end accounting; approximate/hash actions are separate comparators, not substitutes. |
| Endpoint and full cost | Exact-output equivalence plus HBM reads/writes, on-chip storage, kernel launches/synchronization, padding work, and wall-clock where later authorized. |
| Boundary / contrary evidence | No claim for changed attention, approximation, altered model quality, or an uncharged layout conversion. The residual fails if the supplied exact action already realizes the same ragged/asymmetric traversal and costed state retention. |
| Minimal falsifier | A small two-length batch with a causal mask for which every legal schedule either materializes prohibited state, changes outputs, or has no lower charged traffic than the direct comparator. |
| Finite closure path | `FINITE`: write a schedule legality/equivalence checker for a small witness; enumerate the finite traversal/residency choices; calculate all charged transfers; then compare the selected schedule with the same-semantic exact comparator. No execution was performed here. |
| Contribution type / dependencies | `N2`; requires a later frozen kernel/measurement contract and authorized implementation resources. |

## Decision and accounting

The object and guarantee remain exact attention; the proposed action is a concrete schedule, not a wrapper, selector, or approximation. L3 is treated as strong contrary evidence and removes the generic IO-tiled claim. The surviving residual is limited to costed ragged/asymmetric schedule construction, with a finite falsifier and closure route. S1–S6 are all accounted for by L1–L3 and the Question Card. Therefore this is a conditional Stage 0 proposal, not a claim that the residual is novel or successful.
