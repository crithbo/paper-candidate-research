# SOURCE_COLLISION_MATRIX — Wave191

| facet | first-party source | frozen fact / adverse evidence | decision effect |
|---|---|---|---|
| natural monthly carrier | [MediaWiki History dumps](https://dumps.wikimedia.org/other/mediawiki_history/readme.html) | history since 2001; monthly updates named `YYYY-MM`; only latest two versions retained; page/user history reconstruction may update old records | reproducible route exists, but requires immediate checksum capture and confound control |
| links oracle | [API:Links](https://www.mediawiki.org/wiki/API:Links) | exact links-from-pages output with namespace, title, limit, continuation and direction controls | stock exact query union is real |
| template oracle | [API:Templates](https://www.mediawiki.org/wiki/API:Templates) | exact transcluded-pages output with namespace/limit controls | stock exact query union is real |
| category oracle | [API:Categorymembers](https://www.mediawiki.org/wiki/API:Categorymembers) | exact members with type, timestamp/sort-key, direction, continuation and namespace controls | ordinary category index/ordering is not a residual |
| search/index union | [CirrusSearch](https://www.mediawiki.org/wiki/Extension:CirrusSearch/en), [reindex/config guidance](https://www.mediawiki.org/wiki/Extension:CirrusSearch) | Elasticsearch implementation, continuous updates; documented settings and reindexing paths | generic index/cache/tuning excluded |
| current source | [Wikimedia MediaWiki upstream mirror](https://github.com/wikimedia/mediawiki) | master source listing is primary upstream, but no resolved commit/source-symbol/config closure was captured | implementation-absence claim prohibited; action gap remains unclosed |

`CURRENT_UPSTREAM_REALITY_CHECK`: completed only to the documented API/config boundary. Because current source commit and full configuration/action closure are not frozen, the package makes no “MediaWiki currently lacks X” claim and does not reach a direct-absorption finding.

