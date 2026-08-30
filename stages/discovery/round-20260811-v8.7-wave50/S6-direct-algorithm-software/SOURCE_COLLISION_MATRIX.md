# Source and collision matrix — Wave50

Frozen cutoff: `2026-08-11`. Sources are official documentation/current upstream and original standards where relevant.

| Family | Primary/current source | Current action or contract | Collision / gate result |
|---|---|---|---|
| Bison LR tables | Bison `25b3d0e1a3f97a33615099e4b211f3953990c203`, [`src/tables.c`](https://github.com/akimd/bison/blob/master/src/tables.c), [manual](https://www.gnu.org/software/bison/manual/) | Native action/goto table construction and emission | Generic table-packing kernel plus native constructor; no atomic residual. |
| re2c DFA | re2c `dcc7411099580fef6554bcb8d9fd527014b99f21`, [upstream](https://github.com/skvadrik/re2c) | DFA/scanner generation contract | Generator representation change or known table encoding; no residual. |
| flex DFA | [flex manual](https://westes.github.io/flex/manual/) | Fixed scanner behavior and table representation options | Configuration/table encoding only. |
| gettext MO | [GNU gettext manual](https://www.gnu.org/software/gettext/manual/) | Native `.mo` catalog/hash lookup contract | Hash/order proposal is config or changed contract. |
| PostgreSQL GiST | PostgreSQL `086f6f1760140a0055c2faa8d6831fd3ebaf96b0`, [GiST docs](https://www.postgresql.org/docs/current/gist.html) | Opclass `penalty`, `picksplit`, `union` construction interface | Existing native same-object action interface. |
| SLEIGH | [Ghidra SLEIGH docs](https://ghidra.re/ghidra_docs/languages/html/sleigh.html) | Specification-to-decoder compilation | Fixed decoder residual not isolated. |
| CPython pyc | [CPython import/marshal docs](https://docs.python.org/3/library/marshal.html) | Code-object and marshal execution contract | Object/semantics or local emitter change. |
| GNU make deps | [GNU make manual](https://www.gnu.org/software/make/manual/) | Dependency/rebuild semantics | Controller/cache object, excluded. |
| CMake File API | [CMake File API](https://cmake.org/cmake/help/latest/manual/cmake-file-api.7.html) | Generator reply semantics | Metadata wrapper object, excluded. |
| PostgreSQL text search | [PostgreSQL text-search docs](https://www.postgresql.org/docs/current/textsearch.html) | Dictionary/tokenization/query semantics | Configuration/action union; no distinct constructor. |

No current-implementation-absence claim supports a retained residual. For the Bison deep review, current source and visible native construction surface were checked; no feature-flag claim is required because no brief is retained.
