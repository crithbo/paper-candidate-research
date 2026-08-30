# RQ-S72-01

- Exact public anchor: Apache Hadoop current MapReduce Shuffle API and Pluggable Shuffle/Sort documentation, accessed 2026-08-15.
- Tentative object: stock MapReduce reducer shuffle/sort for a fixed key-value job with fixed reducer output semantics.
- Primary RQ: Does the stock current reducer expose a non-configurational bounded-recourse merge constructor under online map-output arrival, preserving its existing output and failure/recovery semantics?
- Same-object boundary: map-output records, reducer key order/output, native reader and job recovery remain unchanged.
- Minimum natural carrier/oracle: a versioned public TeraSort-like MapReduce job/trace and stock reducer output comparison.
- Minimum falsifier: action space is only native configuration plus custom MapOutputCollector or ShuffleConsumerPlugin; no native action remains.
- Precommitted route: official current ShuffleHandler API and official Pluggable Shuffle/Sort document.
- Ordinary closure result: EARLY_GENERIC_OR_PLUGIN_EXCLUSION.

The selected RQ does not elevate custom plugin interfaces to a native residual and does not treat configurable spill/merge thresholds as an N2 action.
