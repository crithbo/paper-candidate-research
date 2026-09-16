# Source and initial action-divergence matrix

All cited sources are official/primary and establish public carrier semantics only. No implementation-absence claim is made.

| Raw object | Official carrier record | Current/semantic boundary | Why no preliminary divergence witness survives |
|---|---|---|---|
| USGS ComCat | The official [FDSN event API](https://earthquake.usgs.gov/fdsnws/event/1/) exposes time, `updatedafter`, geometry and output-format queries; official [GeoJSON feeds](https://earthquake.usgs.gov/earthquakes/feed/v1.0/geojson.php) update at a stated cadence. | Exact object is a query response with catalog/API semantics. | A temporal-burst index, cache or batching rule is a server controller; a new representation changes the returned object. |
| Wikimedia EventStreams | Official [EventStreams](https://www.mediawiki.org/wiki/EventStreams) exposes continuous structured SSE streams and states that it is backed by Kafka. | Exact object is a continuous event stream and its delivery semantics. | Partition, retention, checkpointing and replay are online service actions; cross-lane overlap and controller exclusion apply. |
| Bitcoin blocks | Official [Bitcoin developer block-chain guide](https://developer.bitcoin.org/devguide/block_chain.html) defines ordered timestamped blocks, Merkle roots, consensus validation and UTXO constraints. | Exact object includes consensus block order/membership and validation. | Burst grouping/reordering changes the consensus artifact. A side index has a different object/function. |
| GitHub public events | Official [GitHub events API](https://docs.github.com/en/rest/activity/events) is a paginated service representation of public activity. | Exact object is a REST event response. | Packing/replay/prefetch is endpoint policy/caching, not a new same-object constructor. |
| NEXRAD archive | NOAA's [NEXRAD Level II archive](https://www.ncei.noaa.gov/products/radar/next-generation-weather-radar) is a public time-ordered natural radar carrier. | Need a frozen format reader/writer and artifact identity to compare a cross-sweep constructor. | Without that current union and canonical same-object verifier, an archive layout claim would be speculative; it is held unfrozen. |
| NASA CMR | Official [CMR search documentation](https://cmr.earthdata.nasa.gov/search/site/docs/search/api) specifies collection/granule discovery and temporal constraints. | Exact object is a discovery/retrieval response. | Release-cohort delivery is a selector/prefetch/cache policy or new package, not a same-object action. |

Active-scope check: S1 recovery-invariant, S2 checkpoint-verification, S4 energy/tail-cost, S5 dynamic rebuild/recourse and S6 native writer/planner are not reused. Wave59/71/81/90/98/103 objects are also excluded.
