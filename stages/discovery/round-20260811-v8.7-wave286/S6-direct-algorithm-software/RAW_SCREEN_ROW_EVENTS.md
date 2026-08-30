# Raw screen row events

| event | current first-party source | disposition |
|---|---|---|
| Reader contract | `ui::DataPack` loads `.pak`, validates table/offset bounds, and uses binary search by resource ID; aliases refer to resource-table indices. | fixed native semantics |
| Writer contract | Current writer path constructs final resource aliases and reverse mapping; GRIT utilities expose read/repack routes. | partial union evidence |
| ID-order proposal | Resource-table ordering must satisfy binary-search ordering; changing resource IDs changes lookup semantics. | structural exclusion |
| Residual admission | Non-ID layout action union, build options and direct-collision matrix are unclosed. | `NOT_ADMITTED_UNFROZEN` |

Generic hash/packing/VCDIFF, a flag selector, wrapper, controller and external postprocess are excluded.
