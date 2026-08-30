# Canonical source/collision matrix — R16B S2

| Family | Natural carrier | Full-cost boundary | Collision ceiling |
|---|---|---|---|
| ldconfig | Versioned Linux shared-library directory. | scan/link/cache CPU/RSS/temp, cache bytes, loader lookup/load. | Current tool and loader cover the claimed construction. |
| mandb | Versioned manpage hierarchy. | parse/index CPU/RSS/temp, index bytes, man/whatis lookup. | Current producer action; no target-specific algorithm frozen. |
| TeX ls-R | Versioned TEXMF tree. | directory enumeration/database bytes, Kpathsea lookup/read. | Current `mktexlsr` construction; only generic ordering remains. |
| desktop MIME cache | Versioned desktop-entry directory. | parse/build cache bytes, MIME lookup/handler resolution. | Current cache plus external preference policy directly excludes claimed residual. |
