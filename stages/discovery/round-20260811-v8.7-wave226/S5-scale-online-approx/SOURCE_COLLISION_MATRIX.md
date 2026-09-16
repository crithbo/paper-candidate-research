# Wave226 Cap’n Proto Layout Matrix

| Facet | Current union | Witness status |
|---|---|---|
| Logical object | fixed decoded message **tree**; no multiple pointers per object | alias-preserving proposal is invalid object change |
| Segments | sequential arena allocation; extra segment avoids relocation | layout may use far/double-far landing pads; incremental legality unclosed |
| Packing | stock packed/unpacked stream I/O | canonical messages are not packed; outer compression excluded |
| Canonicalization | preorder, one segment, no packing, truncated defaults | canonical-only layout cannot represent general multi-segment packed update |
| Reader security | lazy pointer validation and traversal/depth limits | oracle must preserve all stock acceptance/limits |
| Finite killer | stock decode plus canonicalization where applicable | fail on decoded tree mismatch, illegal pointer, recourse breach, union absorption or no full-cost gain |
