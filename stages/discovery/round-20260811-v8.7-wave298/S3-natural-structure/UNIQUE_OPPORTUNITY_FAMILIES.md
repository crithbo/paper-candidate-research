# UNIQUE_OPPORTUNITY_FAMILIES

| Family | Same-object semantic oracle | Phenomenon schema and confounds | Only possible non-generic action if admitted |
|---|---|---|---|
| TZif | stock TZif reader resolves the same timestamps/offsets/abbreviations for a fixed zone | Retained transition suffixes across `V-1,V,V+1`, controlling rule edits, zone renames, `zic` release, cutoff range and leap-second mode | `zic`-specific transition-block constructor, not a generic patcher, preserving reader answers |
| TeX fmt | matching engine loads a format and typesets same frozen input | retained control-sequence/macro memory graph, controlling engine/version/package/source changes | engine-specific format-memory construction |
| Emacs eln | matching Emacs loads the same Lisp library/function behavior | repeat compile cache/reuse only within same host/Emacs ABI; control CPU/libgccjit/linker | native compilation/loader coupled construction |
| GHC hi | matching GHC reads same interface for dependent module compilation | retained interface fragments under source/options/object coupling | compiler-interface construction |
| OCaml cmi | matching compiler imports same exported interface | retained exports under compiler format/version and source changes | compiler-interface construction |
| PostgreSQL catalogs | matching server resolves same catalog semantics | recurring catalog changes under initdb/server/version/config controls | catalog-builder construction |
