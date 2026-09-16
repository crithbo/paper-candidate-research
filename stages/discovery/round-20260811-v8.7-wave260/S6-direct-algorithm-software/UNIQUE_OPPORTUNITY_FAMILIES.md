# Candidate-grade families

## Xapian Glass B-tree bulk constructor

Potential N2: a target-specific bounded-state/Pareto bulk construction jointly choosing page fills, splits and dictionary/posting boundary placement for one fixed term-posting corpus. Comparator: complete current Xapian builder options and native B-tree construction. Natural route: version-pinned public corpus; full cost: build CPU/RSS/temp/bytes plus query/open/verify cost. The witness establishes only legal layout freedom. Current source/flag union and B-tree/index-construction collision are unclosed: `NOT_ADMITTED_UNFROZEN`.

## GNU gettext `.mo` joint hash/string-table constructor

Potential N2: exact/FPT construction jointly assigning lookup hash-table size, message order and string offsets while retaining fixed translations/plurals/context under stock gettext. Comparator: all current `msgfmt` modes. Natural route: version-pinned GNU translation catalogues; full cost: writer CPU/RSS/temp/bytes plus lookup/parse cost. The witness is legal but current writer union and perfect-hash/string-layout collision are unclosed: `NOT_ADMITTED_UNFROZEN`.

## Sphinx Search inverted-index constructor

Potential N2: a target-specific approximate/Pareto planner jointly selecting dictionary and postings block layout for frozen documents, analyzer and queries. Comparator: full current Sphinx builder configuration. Natural route: public versioned document corpus; full cost: indexing CPU/RSS/temp/bytes and query/verification latency/memory. Current source union and direct index-layout literature are unclosed: `NOT_ADMITTED_UNFROZEN`.
