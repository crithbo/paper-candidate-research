# UNIQUE_OPPORTUNITY_FAMILIES — Wave207

| family | natural structure hypothesis | action under review | result |
|---|---|---|---|
| OCI versioned image layer churn | controlled descriptor/diff-ID reuse remains stable across image releases | same-complete-object whole-layer constructor | one deep review; direct structural DROP |

Carrier freeze route is intentionally content-addressed: retrieve manifest by immutable digest; save exact manifest byte hash plus config/layer descriptor digests, sizes and media types; `HEAD` every descriptor and save `Docker-Content-Digest`/`Content-Length`; retain release tag only as provenance. This route avoids tag movement and registry layout confounding. No retrieval occurred in this assignment.

