# Raw-screen row events

| event | object family | evidence-led result | disposition |
|---|---|---|---|
| RAW | pcapng multi-interface shared block/state writer | Wave152 left the current writer/reader action union and natural trace route unpinned. | UNIQUE |
| REALITY_CHECK | IETF pcapng draft -05 | Current authoritative draft specifies flexible SHB/IDB/EPB/NRB/ISB/custom-block layouts and multi-interface files. | DEEP |
| REALITY_CHECK | Wireshark current master | Current source visibly implements pcapng reader block/option handlers and a pcapng writer locus; official project material identifies pcapng as a read/write format. | DEEP |
| ACTION_CERTIFICATE | shared boundary plus per-interface state | A legal multi-interface block ordering exists, but no complete union-external native writer action was frozen. | NOT_ADMITTED_UNFROZEN |

The final status is not based on missing implementation, measured result, compute, or AI readiness.
