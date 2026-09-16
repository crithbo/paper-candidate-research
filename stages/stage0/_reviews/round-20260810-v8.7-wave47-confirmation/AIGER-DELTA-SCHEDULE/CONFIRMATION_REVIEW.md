# AIGER-DELTA-SCHEDULE Stage 0 Confirmation Review

- Assignment: `STAGE0-C2-20260810-AIGER-DELTA-SCHEDULE-CONFIRM-V8.7`
- Role: `STAGE0 CONFIRMATION`
- Review date: `2026-08-10`
- Decision: `CONFIRM_STAGE0_PASS`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.74`
- Novelty route: `N2`
- Evidence ceiling: `STAGE0_CONDITIONAL_PAPER_POTENTIAL__STATIC_ACTION_DIVERGENCE_ONLY__NO_NATURAL_OR_ALGORITHMIC_RESULT`
- Latest-collision status: `SEARCH_BOUNDED_OPEN__NO_DIRECT_FATAL_IN_OBTAINED_PRIMARY_SOURCES`
- Stage A authorized: `false`
- Stage B authorized: `false`
- Lane state after delivery: `IDLE_REUSABLE_AWAITING_MAINLINE`

## Independent-review declaration and frozen inputs

This confirmation was redone from the frozen Discovery and PRIMARY packages. No prior topic judgment was inherited. The review did not implement a scheduler or adapter, run an AIGER candidate, execute a benchmark, or start Stage A/B.

The Discovery manifest was independently verified `4/4`; its brief, handoff, and manifest-self hashes are respectively:

- `179A41BFF132986FC37FC6E4FB71764B9F39A36CE7ACB7A4032B7370D344EC2A`
- `50AB1097AC9F981C644D559BFD3765A1507F66796AC85C46B90F68D54158EEE1`
- `16EF94DC69CCB0F6A3C26DD2919C5CE27E9E00342B4A6966FFD26EA0D5147439`

The PRIMARY manifest was independently verified `4/4`; the observed hashes exactly match the mainline freeze:

| PRIMARY file | SHA-256 |
|---|---|
| `STAGE0_REPORT.md` | `5DCFD38CBF13396EF11D2F6A5379DA8C31042CDAA6910D383B5C9A49D5CDF516` |
| `Q1_COMPARATOR_MATRIX.md` | `C7E41B99ED50C900E6798605B33DB3B0C1D77DBE6F2CBF2AEA650B79D79CF30C` |
| `SOURCE_AUDIT.md` | `64D3915E57E2A51D789B8E20243B3D357CEF86E4C958E70F486129094BA85F75` |
| `handoff.yaml` | `A89CE0E7AE163DA2CB07566A81CBD00A0CFF95A09F61CDFCCEDACE941E8897A7` |
| manifest self | `6A8D77F924127B395DAF706457CE72BB3BA3D78F802BDC8C9A58DE1192CFF974` |

## Mechanical gate result

| Gate | Independent result | Consequence |
|---|---|---|
| Frozen same object | `PASS` | A legal candidate changes only the numbering of fixed reachable AND nodes. |
| Complete action | `PASS` | The action is the full set of legal topological AND orders, not a writer flag. |
| Six-AND certificate | `PASS` | The 12-byte and 13-byte schedules are legal and differ by one whole-file byte under the stated stripped artifact. |
| Current native absorption | `NO_DIRECT_ABSORPTION_FOUND` | Current AIGER/Yosys/ABC paths expose deterministic traversal/canonicalization, not the global variable-byte objective. |
| Nontrivial N2 route | `PASS_CONDITIONAL` | A formal precedence-constrained discontinuous labeling problem and finite exact/formal route exist; no theorem or scalable guarantee is yet evidence. |
| Latest collision | `SEARCH_BOUNDED_OPEN` | Checked original/official sources contain adjacent facets but no same-object direct fatal. This is not an absence claim. |
| Natural/full-cost route | `FINITE` | HWMCC, reference parsing, exact graph equality, native parity, whole-file accounting, and small exact ceilings form a bounded Stage A route. |

## Frozen same-object and complete-action contract

The same object is one fixed reachable AIG with:

- fixed PI and latch identities and order;
- fixed output, bad, constraint, justice, and fairness order;
- fixed AND vertices, edges, and inversion bits;
- unchanged Boolean functions and reset/property semantics; and
- one standard binary AIGER 1.9 artifact accepted by the reference reader.

The only candidate action is a bijection from the fixed AND vertices to consecutive post-interface identifiers that is a linear extension of the AND dependency partial order. For each emitted AND, the standard-required ordering `rhs0 >= rhs1` is then applied. Thus operand orientation is not an additional free action under standard binary AIGER; the residual is gate-label scheduling alone.

Graph rewriting, structural hashing that merges vertices, deletion, interface/property permutation, `aig2`, ASCII-only replacement, an external codec, and a thin or private representation are outside the object. A native output is eligible for equal-guarantee comparison only if a reference parse and an identity-anchored graph certificate show that it preserved this contract.

For a schedule `pi`, let fixed PI/latch literals occupy the standard prefix and let every AND receive the even literal induced by its position in `pi`. With fixed inversion bits and `rhs0 >= rhs1`, the primary payload objective is

`C_delta(pi) = sum_v [lambda(lhs_v-rhs0_v) + lambda(rhs0_v-rhs1_v)]`,

where `lambda(x)` is the number of AIGER base-128 little-endian bytes for unsigned `x`. Whole-file bytes are a separate deployment denominator because the decimal latch/root/property lines can change width even when `C_delta` improves.

This action is complete and same-object: every legal topological numbering is representable, and no graph or reader change is needed.

## Independent six-AND certificate recomputation

Use 63 PIs with literals `p_i=2i` and the six reachable ANDs

- `g1=p1&p2`, `g2=p60&p61`, `g3=p62&p63`, `g5=p58&p59`;
- `g4=g1&g2`, `g6=g4&g5`;
- fixed output order `[g6,g3]`.

All six gates are reachable: `g6` reaches `g4,g5`, `g4` reaches `g1,g2`, and `g3` is the second output. Both schedules respect `g1,g2 < g4 < g6` and `g5 < g6`.

### Schedule S1: `g1,g2,g4,g5,g6,g3`

| Gate | `lhs` | `rhs0,rhs1` | Deltas | Encoded bytes |
|---|---:|---:|---:|---:|
| `g1` | 128 | 4,2 | 124,2 | 2 |
| `g2` | 130 | 122,120 | 8,2 | 2 |
| `g4` | 132 | 130,128 | 2,2 | 2 |
| `g5` | 134 | 118,116 | 16,2 | 2 |
| `g6` | 136 | 134,132 | 2,2 | 2 |
| `g3` | 138 | 126,124 | 12,2 | 2 |

Total AND-delta payload: `12 B`. Fixed outputs are `136` and `138` in that semantic order.

### Schedule S2: `g2,g5,g3,g1,g4,g6`

| Gate | `lhs` | `rhs0,rhs1` | Deltas | Encoded bytes |
|---|---:|---:|---:|---:|
| `g2` | 128 | 122,120 | 6,2 | 2 |
| `g5` | 130 | 118,116 | 12,2 | 2 |
| `g3` | 132 | 126,124 | 6,2 | 2 |
| `g1` | 134 | 4,2 | 130,2 | 3 |
| `g4` | 136 | 134,128 | 2,6 | 2 |
| `g6` | 138 | 136,130 | 2,6 | 2 |

Total AND-delta payload: `13 B`. The value `130` crosses the one-byte limit: its encoding is `0x82 0x01`; every other listed delta is at most `127`. Fixed outputs are `138` and `132`, again in semantic order `[g6,g3]`.

The header is identical (`M=69,I=63,L=0,O=2,A=6`), and both output literals have three decimal digits. With identical symbol/comment policy, S2 is therefore exactly one whole-file byte larger. This certificate proves only legal action divergence. It says nothing about natural headroom, runtime, or paper-level superiority.

## Current-upstream native union

The three exact pins were independently confirmed as the official default-branch heads on the review date:

- AIGER `039ec1a2cc37d3093ac35c4b6df65336b346f409`;
- Yosys `0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552`;
- ABC `6c51a9238544bce6eb300b7b1c3e5bb4215bec84`.

The exact source blobs also match the PRIMARY audit: Yosys `aiger.cc` blob `1320937a096ffd70a30f2f9755ba9667546d7905`, ABC `ioWriteAiger.c` blob `cad335d4f48183a2dfc0244e55c0fb73a55e2cda`, and AIGER `aiger.c` blob `793be2b6aae98d279469416638498caa35387237`.

### AIGER reference writer

`aiger_write_binary` calls `aiger_reencode`, then emits exactly `lhs-rhs0` and `rhs0-rhs1`. Re-encoding assigns fixed input/latch codes first and traverses latch roots, outputs, bad properties, constraints, justice literals, and fairness roots in their array order. Its DFS child rule and root order are deterministic; there is no search over legal schedules and no variable-byte objective. If the in-memory object is already reencoded, the current source returns without reordering. Reference no-op/reencode/root-DFS outputs are therefore mandatory native baselines, not absorption.

### Yosys `write_aiger`

The pinned writer recursively converts fanins and allocates each gate when `mkgate` is reached; it then emits the two standard deltas. The option `-no-sort` only prevents sorting input/output ports. Other switches control ASCII output, initialization conversion, property/interface modes, symbols, or side maps. No checked switch invokes a whole-DAG scheduler for the frozen byte objective.

For parity, run the complete finite same-object-relevant option grid, including sorted and `-no-sort` paths, while matching metadata. Any path that changes fixed interface/property order, inserts dummy ports/latches, changes initialization, or changes the graph fails the frozen equality checker and is not an equal-guarantee result.

### ABC `write_aiger`

The pinned command surface is `-s`, `-c`, `-u`, and `-v`. Default standard output numbers the internal AIG order and emits standard deltas. `-c` writes `aig2` and is outside the format contract. `-s` and `-v` do not create a global byte scheduler.

`-u` is a material boundary: it calls `Saig_ManDupIsoCanonical`, whose source explicitly derives canonical CI and CO permutations before traversing and duplicating the AIG. Thus `-u` must be exercised in the native union, but it is equal-guarantee only on an instance where the fixed interface/property order and graph-identity certificate still pass. Otherwise it is an informative contract-failing control. In neither case does it directly express minimization of the frozen variable-length objective.

### Absorption conclusion

The current finite native union consists of reference no-op/reencode/root DFS, every Yosys path that can pass the fixed-object checker (especially the `-no-sort` boundary), and ABC default plus the conditionally legal `-u` output. None of the successfully inspected source paths contains an optimizer over all legal topological AND orders for `C_delta` or whole-file bytes. No direct native absorption was found.

## Academic Research Suite inline reviews

### Methodology reviewer

The object, action, legality, objective, and one action-divergence certificate are mechanically defined. The complete schedule space is not confused with a finite writer-flag grid, and whole-file bytes are not conflated with the AND payload. Exact graph/interface checking and a small-instance exact ceiling are finite.

The phrase “exact FPT” is not yet evidence. A frontier state that stores exact predecessor ages can have `n^{O(w)}` rather than `f(w) poly(n)` complexity. Stage 0 therefore confirms only a finite bounded-frontier/exact route, not an FPT theorem. Before the phrase FPT, approximation, or guarantee supports a claim, the parameter, state equivalence, recurrence, completeness, and time/space bound must be proved.

### Domain reviewer

The AIGER specification requires consecutive topological AND identifiers and base-128 delta encoding, while leaving multiple legal topological orders for many fixed DAGs. The current reference/Yosys/ABC sources use traversal, internal order, port sorting, or isomorphic canonicalization; they do not optimize the complete frozen objective. Fixed AIGER 1.9 interface/property order and exact graph identity are essential because functional equivalence alone would admit rewriting and no longer test the proposed serialization action.

HWMCC provides natural AIGER 1.9 material and a standard-reader route. It does not by itself show that eligible circuits contain useful threshold-sensitive freedom, and competition preprocessing may make some instances canonical or otherwise null. Family-stratified null cases must remain in the evidence.

### Devil's-advocate reviewer

The strongest failure modes remain live:

1. native DFS/canonical orders or simple threshold-aware ready-set scheduling may capture essentially all natural headroom;
2. savings may be confined to tiny synthetic threshold constructions and disappear in whole-file/full-cost accounting;
3. the bounded-frontier DP may be only a generic exponential/XP formulation, leaving no nontrivial algorithmic contribution;
4. a closer logic-serialization paper may be indexed under graph layout, proof compression, or circuit-file engineering rather than AIGER; and
5. ABC/Yosys import paths may alter graph identity, shrinking the set of valid native comparator outputs.

These are cheap Stage A falsifiers or bounded-search uncertainty. None is current scientific negative evidence sufficient for STOP.

## N2 substance and atomic proposition

The frozen N2 is not “choose a writer option” and not merely “run Kahn with a local score.” It is the following same-object static proposition:

> Given a fixed reachable AIGER 1.9 AIG with fixed interface/property order and inversion bits, optimize the exact standard binary AND-delta payload over all legal topological AND numberings; report whole-file bytes separately; and contribute either a proved exact algorithm under an explicit structural parameter, or a hardness result paired with a nontrivial approximation/relaxation/bound or another auditable formal property, plus a deterministic scalable method whose failure boundary is explicit.

The discontinuous base-128 thresholds and coupling among a gate rank, its later fanin rank, and the gap between its two fanins make this a precedence-constrained labeling objective rather than ordinary topological sorting. A generic exhaustive/ILP oracle is only the small-instance ceiling. A ready-node heuristic, serializer patch, or parameter sweep without a theorem, bound, certified relaxation, or independently substantive algorithm does not close N2.

This proposition is already statically definable, and a finite path to testing it exists. The absence of the eventual recurrence, proof, implementation, and positive natural result is an evidence-readiness gap rather than a Stage-0 structural failure. No atomic revision is needed.

## Bounded collision audit

The independent bounded check covered:

- the AIGER 2007 format report and AIGER 1.9 official material: exact format and codec boundary, no optimization of legal global numbering;
- Kabiljo/Dhulipala et al., KDD 2016: unrestricted compression-friendly graph/index reordering with recursive bisection and theory, but not AIG precedence, fixed AIGER interfaces, or the exact two-delta objective;
- Gagrani et al., NeurIPS 2022: legal topological ordering of computation DAGs, but for peak memory with a learned scheduler rather than AIGER bytes;
- Mishchenko, Chatterjee, and Brayton, DAC 2006: AIG rewriting for area/depth, which changes the graph;
- Heule and Biere, IWIL 2015: AIGER-inspired delta plus variable-byte compression for literal ordering inside clausal proofs, a different serialized object and action.

Targeted searches combining AIGER, gate/node order, topological order, delta, variable-byte encoding, labeling, and compression did not return a primary source covering all frozen facets. This remains `SEARCH_BOUNDED_OPEN`, especially for older logic-synthesis serialization work. Failed raw-source fetches were treated as transport limitations only; source findings above rely on successfully obtained official pages, papers, and exact GitHub API objects. No absence inference is made.

## Finite Stage A fidelity and killer route

No Stage A work is authorized by this confirmation. If mainline later authorizes Stage A, the first claim-bearing observation must be preceded by one fidelity gate:

1. pin the AIGER/Yosys/ABC commits, HWMCC archive, commands, and metadata policy;
2. freeze a reference parse that records PI/latch/output/bad/constraint/justice/fairness order, inversion bits, resets, and the exact reachable AND adjacency;
3. prove the candidate adapter covers every legal topological numbering of that same object and cannot rewrite, merge, delete, or reorder the interface;
4. reproduce the six-AND certificate through reference parsing and exact graph equality;
5. enumerate the complete native union and classify each output by the same contract, including Yosys `-no-sort` and ABC `-u`;
6. freeze the exact algorithmic recurrence and its honest complexity label, with exhaustive/ILP comparison on small instances; and
7. ledger delta payload, whole-file bytes, planner/writer/reader/check CPU, peak RSS, verification, fallback, and artifact hashes.

Only after that gate may a small family-stratified HWMCC pilot test natural threshold-sensitive freedom and full-cost Pareto behavior. Null chains, threshold-inert graphs, native-equality failures, timeouts, and fallback must stay in the denominator.

The direction fails scientifically if the complete same-object native union expresses the same action/objective; the exact equality contract cannot be met; the only surviving method is local emitter engineering or generic option selection; or no independent formal/algorithmic contribution survives fair baselines and natural full-cost testing. Missing code, missing native output, or a not-yet-positive natural result is not such evidence at Stage 0.

## Final synthesis

The fixed AIGER object and complete legal action are coherent. The six-AND witness is mechanically correct and establishes one byte of action divergence without overclaiming natural benefit. Current AIGER, Yosys, and ABC sources add strong traversal/canonicalization baselines but do not directly absorb global variable-byte scheduling. The formal N2 is narrow and high-risk, yet statically definable with a finite public CPU/formal closure path.

Therefore the independent decision is `CONFIRM_STAGE0_PASS / TIER_B_Q2_VIABLE`. This is conditional paper potential only. It does not establish an FPT result, natural headroom, scalability, or a main quantitative claim, and it does not authorize Stage A or B.

## Primary sources used

- Armin Biere, [The AIGER And-Inverter Graph (AIG) Format](https://fmv.jku.at/papers/Biere-FMV-TR-07-1.pdf).
- [Official AIGER page and AIGER 1.9 report index](https://fmv.jku.at/aiger/).
- [AIGER pinned source](https://github.com/arminbiere/aiger/blob/039ec1a2cc37d3093ac35c4b6df65336b346f409/aiger.c).
- [Yosys pinned AIGER backend](https://github.com/YosysHQ/yosys/blob/0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552/backends/aiger/aiger.cc) and [official `write_aiger` documentation](https://yosyshq.readthedocs.io/projects/yosys/en/v0.55/cmd/write_aiger.html).
- [ABC pinned command source](https://github.com/berkeley-abc/abc/blob/6c51a9238544bce6eb300b7b1c3e5bb4215bec84/src/base/io/io.c), [writer](https://github.com/berkeley-abc/abc/blob/6c51a9238544bce6eb300b7b1c3e5bb4215bec84/src/base/io/ioWriteAiger.c), and [`-u` canonicalization](https://github.com/berkeley-abc/abc/blob/6c51a9238544bce6eb300b7b1c3e5bb4215bec84/src/aig/saig/saigIso.c).
- [HWMCC 2025 official site](https://hwmcc.github.io/2025/).
- Dhulipala et al., [Compressing Graphs and Indexes with Recursive Graph Bisection](https://www.kdd.org/kdd2016/papers/files/rpp0883-dhulipalaAemb.pdf), KDD 2016.
- Gagrani et al., [Neural Topological Ordering for Computation Graphs](https://proceedings.neurips.cc/paper_files/paper/2022/hash/6ef586bdf0af0b609b1d0386a3ce0e4b-Abstract-Conference.html), NeurIPS 2022.
- Mishchenko, Chatterjee, and Brayton, [DAG-aware AIG rewriting](https://doi.org/10.1145/1146909.1147048), DAC 2006.
- Heule and Biere, [Clausal Proof Compression](https://easychair.org/publications/paper/fgBF/open), IWIL 2015.
