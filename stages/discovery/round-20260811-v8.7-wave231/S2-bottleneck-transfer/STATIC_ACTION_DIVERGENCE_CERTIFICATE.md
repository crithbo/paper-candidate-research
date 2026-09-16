# Static action-divergence certificate — FlatBuffers whole-buffer layout

**Frozen upstream:** `google/flatbuffers` tag `v25.12.19`, commit `282dcb1c3266b45600510da4810092f6ec4c85f2` (official tag queried 2026-08-11).  
**Stock semantics:** C++ generated reader and `flatbuffers::Verifier`; schema, root, logical object graph/values, identifier/size-prefix deployment contract and verifier limits are identical.

## Minimal legal schema and logical object

```fbs
table Child { label:string; hot:uint; }
table Root { left:Child; right:Child; }
root_type Root;
```

Logical object `G`: root `R`; `left=(label="a", hot=1)` and `right=(label="a", hot=2)`. The access profile is part of the construction input, not a changed reader contract: after obtaining `Root`, workload `W` reads `right.hot` before `left.hot` with fixed probability `p>1/2`. The fixed graph has equal logical values under either construction.

## Fair native union U

At the frozen tag, relevant paths are `include/flatbuffers/flatbuffer_builder.h` (`FlatBufferBuilder`, backwards writes, `PreAlign`, `EndTable`, vtable deduplication, `CreateString`/`CreateSharedString`, `Finish`/size-prefixed finalization and allocator/buffer-min-alignment controls), generated object API `Pack`/`UnPack`, and `include/flatbuffers/verifier.h` (`Verifier`, generated `Verify`). U permits legal child build order, automatic matching-vtable reuse, optional shared string reuse, alignment/padding, and standard root finalization. These must all be enabled/fairly supplied to the comparator.

## Two stock-equivalent buffers and divergence

**B0 (strong baseline):** invoke `CreateSharedString("a")`, create `right` then `left` in the generated/default dependency order, use stock `EndTable` vtable reuse and finish `R`.  
**B1 (candidate action):** same shared string and stock vtable dedup, but apply `ProfiledTopoLayout(G,W)`: choose among legal child-table topological orders and exact object/vtable/string reuse classes a layout that minimizes the weighted root-to-first-byte span

`C(layout; W) = Σ_(q in W) w_q · span(root_start, first_byte(target(q))) + λ·buffer_bytes`,

subject to FlatBuffers forward `uoffset_t`, backward vtable `soffset_t`, field alignment, table/vtable validity, same root and stock verifier acceptance. For tree-shaped graphs, the planner uses bottom-up dynamic programming over each table's child-order permutations (bounded by schema arity `d`) and returns the exact optimum in `O(n·2^d·poly(d))`; it may fall back to the baseline order when `d` exceeds a declared bound. It does not alter values, schema, reader, feature flags or verification.

Both B0 and B1 must satisfy generated `VerifyRootBuffer`/`GetRoot` and produce equal values. B1 differs by a **whole-buffer, profile-indexed construction rule**: it chooses one legal sequence using global descendant access weights and constrained offsets, whereas B0 uses only caller/default sequence plus local sharing/dedup atoms. This is not generic packing, compression, postprocessing or schema reordering.

## What the certificate proves—and does not prove

It proves a static same-object action divergence relative to a frozen strong baseline contract. It does not prove that B1 is faster or smaller on any corpus, that the DP is novel, or that it beats all possible custom uses of the stock builder. Those are Stage 0/Stage A questions. If source audit finds stock generated builders already implement this profile-driven DP, or a direct same-object paper does, the candidate is directly absorbed and must be dropped.
