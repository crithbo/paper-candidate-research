# Unique opportunity family

## HDF5-CHUNK-INDEX-BOUNDED-RECOURSE-MAINTENANCE

Hypothesis: an evolving chunked dataset with mostly append plus bounded late/backfilled chunks might cross a regime where the creation-time chunk index no longer provides the best same-reader update/read tradeoff. A complete N2 would have to specify legal index metadata conversion, chunk-record relocation, free-space accounting, filter preservation, crash/rewrite semantics and bounded recourse.

It is not retained. HDF5 already selects specialized index forms from dataspace/extension structure, especially an EA for one unlimited dimension; this pass cannot establish the complete current conversion/rewrite union nor a union-external action without inventing an absence claim.
