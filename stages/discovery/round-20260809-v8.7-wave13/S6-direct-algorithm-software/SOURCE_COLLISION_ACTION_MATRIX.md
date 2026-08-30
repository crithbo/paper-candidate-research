# S6 Wave 13 — current upstream reality/collision matrix

Frozen cutoff: 2026-08-09. Sources are official Apache ORC material and primary literature only. The current tag is `rel/release-2.3.1`; no older issue or future-work statement is used as absence evidence.

| Seed | Exact object / natural oracle | Frozen current source reality and strongest union | Claimed action gap audit | Fidelity route | Outcome |
|---|---|---|---|---|---|
| ORC string-dictionary construction | Fixed ordered natural tabular records → standard ORC v1 file; official ORC reader/projected full scan and index semantics | Official [configuration](https://orc.apache.org/docs/core-java-config.html): dictionary threshold/max bytes/early check, rbtree/hash implementation, direct columns, stripe/page/index/compression actions. Official [WriterContext API](https://orc.apache.org/api/orc-core/org/apache/orc/impl/writer/WriterContext.html): threshold and per-stripe encoding actions. Official [ORCv1 spec](https://orc.apache.org/specification/ORCv1/): automatic first-row-group choice and sorted dictionary encoding. | **Absorbed.** Threshold policy, data structure, early decision and direct/dictionary choices are all explicit current actions; lexical dictionary ordering is format-fixed. No atomic full constructor outside union was verified. | A finite reader/full-scan plan cannot repair missing action gap. | `DROP_CURRENT_UNION_ABSORPTION` |
| ORC record reordering before writer | Ordered records → ORC | Same ORC writer/index/statistics contract | Changes row order/row-group statistics and predicate behavior; if external it is pipeline glue. | Not same object. | `DROP_CHANGED_OBJECT_WRAPPER` |
| ORC setting sweep | Same ORC | Current threshold/size/strategy/stripe/index flags | Ordinary parameter selection. | Not N1/N2. | `DROP_ROUTINE_TUNING` |

## Supporting sources

- The current official [ORC 2.3.1 release](https://orc.apache.org/releases/) supplies the tag reality anchor.
- The [ORCv1 specification](https://orc.apache.org/specification/ORCv1/) defines dictionary/direct streams and writer encoding selection, preserving the format/reader contract.
- The current official configuration and API pages enumerate default and non-default action capability; their presence is why no lack-of-action inference is made.
- Zeng et al., [An Empirical Evaluation of Columnar Storage Formats](https://arxiv.org/abs/2304.05028), is a methodological subtraction for format-level encoding choices, not evidence of a new ORC algorithm.
