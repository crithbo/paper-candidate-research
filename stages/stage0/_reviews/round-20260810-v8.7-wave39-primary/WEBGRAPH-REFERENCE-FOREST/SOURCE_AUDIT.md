# WEBGRAPH-REFERENCE-FOREST Source and Current-Reality Audit

- Audit date/cutoff: `2026-08-10`
- Role: independent Stage 0 PRIMARY source verification
- Inclusion rule: official upstream source/docs, publisher/author paper pages and author artifacts only
- Search status: decisive current-source claim closed; broader novelty remains `SEARCH_BOUNDED_OPEN`

## Input integrity

Discovery manifest recomputed 4/4. The brief, handoff and manifest self hashes match the mainline freeze. No Discovery file was modified.

## Verified source ledger

| ID | Source | Authority/version | Verified claim | Classification |
|---|---|---|---|---|
| S1 | [Java BVGraph current source](https://github.com/vigna/webgraph/blob/master/src/it/unimi/dsi/webgraph/BVGraph.java) | official `vigna/webgraph` master snapshot; immutable release API 3.6.12 also checked | current Java compression scans window candidates and greedily commits minimum immediate bit cost subject to `maxRefCount`; store surface exposes window/depth/interval/ζ/flags/offsets | deployment baseline |
| S2 | [Javadoc version index](https://javadoc.io/doc/it.unimi.dsi/webgraph/latest/it/unimi/dsi/webgraph/BVGraph.html) | official published artifact index | current Java artifact is `webgraph 3.6.12` | version pin |
| S3 | [Official Rust WebGraph repository](https://github.com/vigna/webgraph-rs) | first-party Vigna project | Rust implementation of WebGraph, with current graph/CLI crates | upstream authority |
| S4 | [Rust `BvCompZ` release source](https://docs.rs/webgraph/latest/src/webgraph/graphs/bvgraph/comp/bvcompz.rs.html) | `webgraph 0.6.2`, 2026-05-01 | builds maximum-weight reference forest, runs bounded-depth subforest DP, greedily re-adds references, writes BVGraph stream and offsets | decisive direct subtract |
| S5 | [Rust crate item/version page](https://docs.rs/webgraph/latest/webgraph/all.html) | `webgraph 0.6.2` | exports `BvComp`, `BvCompZ`, random-access and sequential BVGraph readers plus offsets | same-object closure |
| S6 | [CLI release source](https://docs.rs/webgraph-cli/latest/src/webgraph_cli/lib.rs.html) | `webgraph-cli 0.4.2` | exposes `--bvgraphz`, `--chunk-size`, window, depth, interval and instantaneous code options; states compression/memory/decode trade-off | flags/config reality |
| S7 | [Zuckerli official publication page](https://research.google/pubs/zuckerli-a-new-compressed-representation-for-graphs/) | IEEE Access 2020, DOI `10.1109/ACCESS.2020.3040673` | same graph-compression/list-access family; real-world evaluation and reference-chain algorithm | direct paper subtract / evaluation anchor |
| S8 | [WebGraph original paper](https://vigna.di.unimi.it/ftp/papers/WebGraph.pdf) | WWW 2004 author-hosted paper | canonical referentiation/intervalization/coding and random-access format | genealogy anchor |
| S9 | [Rust WebGraph paper official author record](https://vigna.di.unimi.it/papers.php) | The Web Conference 2024 Companion, DOI `10.1145/3589335.3651581` | Rust port is first-party modern WebGraph implementation | deployment boundary |
| S10 | [Laconic official PVLDB paper](https://www.vldb.org/pvldb/vol17/p2212-xu.pdf) | PVLDB 17(9), DOI `10.14778/3665844.3665852` | modern rule-based graph compression with compression/compute memory and time ledger | methodological adjacent / shape anchor |
| S11 | [Log(Graph) author publication page](https://htor.inf.ethz.ch/publications/index.php?pub=309) | PACT 2018, DOI `10.1145/3243176.3243198` | alternative compressed graph representation balancing space and access speed | methodological adjacent |

## Current upstream action audit

### Java `BVGraph`

At the compression loop, each node's current list is compared against every preceding list in the cyclic window. `diffComp` estimates actual compressed bits; the smallest candidate is committed immediately and `refCount` becomes the chosen parent's count plus one. This confirms a local-greedy Java baseline.

### Rust `BvCompZ`

The released source explicitly distinguishes itself from standard `BvComp`. It buffers a chunk, evaluates root and every legal reference with the same compressor, chooses a locally maximum-saving parent for each node to form a maximum-weight directed forest, applies a DP whose state is node and available reference length, then greedily reintroduces valid references and writes native bits/offsets.

This is not a theoretical union or an offline oracle: it is shipped first-party code with a CLI flag. It directly invalidates the Discovery absence statement and covers the proposed three-list motivation after correcting its edge pattern.

### Complete finite configuration surface

- Java: `windowSize`, `maxRefCount`, `minIntervalLength`, `zetaK`, compression code flags, thread count, offset generation/load modes and no-reference settings.
- Rust CLI: endianness, `compression_window`, `min_interval_length`, `max_ref_count`, outdegree/reference/block/residual codes, `bvgraphz`, `chunk_size`; corresponding native offsets and readers.

The revision comparator must use a finite legal grid fixed before evidence. It need not exhaust meaningless combinations, but exclusions require source-grounded incompatibility or dominance, not convenience.

## Collision verdicts

- `DIRECT_FATAL` for the current broad claim “introduce a global bounded reference forest for WebGraph.” Current `BvCompZ` and Zuckerli already do this on the same object and native format.
- `SEARCH_BOUNDED_OPEN` for a narrower complete-legal-parent-DAG optimizer with a real guarantee beyond `BvCompZ`'s best-parent forest + bounded-depth DP + greedy repair.
- `METHODOLOGICAL_ADJACENT` for Laconic and Log(Graph): their representation/action contracts are not equal-quality same-object BVGraph baselines.
- Vertex reordering/LLP is a negative control or alternate object, not a fair baseline under fixed order.

## Witness audit

Discovery's `1→0` and `2→0` edges do not compete under a path-depth bound; they are two depth-one children of the same root. A repaired abstract pattern adds `2→1` and second-choice `2→0`, but abstract saved-bit weights are not native evidence. Revision must derive the costs from actual successor lists and the pinned encoder, including intervals/residuals/reference metadata and offsets.

## Search and verification limitations

- Local `git ls-remote` still failed with Windows Schannel `SEC_E_NO_CREDENTIALS`. No absence, staleness or commit claim is inferred from that failure.
- Immutable docs.rs crate releases and official GitHub-rendered source supplied the decisive current code. Mutable master commit SHA is therefore not fabricated.
- The search is sufficient to close the stated native absence claim, but is not asserted exhaustive for every bounded-depth forest theorem. Latest novelty remains `SEARCH_BOUNDED_OPEN` until Stage B if the topic survives.
- Quartile labels are calibration shorthand only; no unstable quartile claim is used as a scientific premise.

## Reproducibility record

Queries targeted the official WebGraph Java/Rust repositories, docs.rs release source, current CLI flags, Zuckerli, the original WebGraph paper and modern graph-compression neighbors. The decisive claims can be rechecked from S1–S7 without downloads or unpublished material.

## AI-assisted review disclosure

This audit was produced with AI-assisted source retrieval and analysis. Canonical judgments remain evidence-linked; failed retrievals are disclosed and never treated as negative technical evidence.

