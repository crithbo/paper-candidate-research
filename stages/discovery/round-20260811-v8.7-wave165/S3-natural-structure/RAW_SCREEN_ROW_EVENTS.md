# RAW_SCREEN_ROW_EVENTS — Wave165

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE165-NHDPLUS-HYDROGRAPH-RELATIONAL-STRUCTURE-DEPTH-REDTEAM`. Frozen cutoff: 2026-08-11. Authority: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.

| ID | frozen natural object | source-order-independent exact semantics / oracle | proposed complete action and natural-structure hypothesis | minimal controlled witness | result |
|---|---|---|---|---|---|
| RAW-165-01 | USGS NHDPlus HR National Release 1, DOI `10.5066/P9WFOBQI`; `NetworkNHDFlowline`, `NHDPlusFlow`, `NHDPlusConnect`, and joined VAA fields | Directed reach relation is the set of flowlines reachable through explicit `FromNHDPlusID → ToNHDPlusID` flow edges plus `NHDPlusConnect` across VPUs; result is invariant to file/row/source order. Oracle is the resulting exact set of NHDPlusIDs under a frozen direction and seed set. | N2 separator/frontier constructor for exact upstream/downstream reach set; hypothesis: confluence interfaces remain bounded across natural drainage subgraphs, enabling a factorized closure state. | Two upstream VPU branches that meet one downstream reach: action must merge both ID frontiers once while returning the exact reachable-ID set. | `DEEP_DIVE_REQUIRED` → current action union and natural-law check. |

Excluded at raw stage: data cleaning/correcting network links; VAA threshold selection; standard spatial indexing/partitioning; and changing the task to catchment generation, flow modelling, or display generalization. No experiment, benchmark, data download or API batch query was run.

