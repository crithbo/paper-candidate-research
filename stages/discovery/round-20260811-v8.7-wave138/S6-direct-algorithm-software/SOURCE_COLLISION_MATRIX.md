# Source / collision matrix

| family | official/current source | same-object reader/oracle | direct collision / current-union finding |
|---|---|---|---|
| Lucene BKD | [Lucene 10 BKD API](https://lucene.apache.org/core/10_3_1/core/org/apache/lucene/util/bkd/package-summary.html), `BKDWriter`/`BKDReader` | `BKDReader` | Writer recursively partitions all points and current config exposes leaf-size primitive; no natural stable mismatch has been evidenced. |
| PostgreSQL BRIN | [PostgreSQL 18 docs](https://www.postgresql.org/files/documentation/pdf/18/postgresql-18-A4.pdf) | backend index scan; `amcheck` consistency tool | Range summaries and index methods exist, but a current full action catalog and natural transition are not frozen. |
| LLVM MBP | [current source](https://www.llvm.org/docs/doxygen/MachineBlockPlacement_8cpp_source.html) | emitted object code/function semantics | Current source contains function-wide chains, tail duplication and `applyExtTsp`; a global layout mechanism is already in union. |
| CPython marshal/pyc | [official marshal docs](https://docs.python.org/3/library/marshal.html), [PEP 552](https://peps.python.org/pep-0552/) | CPython import/marshal reader | Marshalled code-object format is version-specific; hash-based deterministic pyc already directly addresses metadata nondeterminism. |
| OpenJDK CDS | official OpenJDK CDS documentation/source route | JVM class loader | Archive-layout objective entails runtime/image policy; not a native fixed-output format action. |
| PostgreSQL GiST | PostgreSQL current index documentation/source route | backend GiST reader/checker | No current source/action catalogue and corpus version were frozen in breadth pass. |

All absence-sensitive rows are `NOT_ADMITTED_UNFROZEN`, not dropped for availability, code, result, resource, or AI-readiness reasons.
