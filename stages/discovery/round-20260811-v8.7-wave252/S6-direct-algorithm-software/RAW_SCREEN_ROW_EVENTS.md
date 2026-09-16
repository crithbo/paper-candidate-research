# Raw screen rows

| Family | Native greedy grouping/coalescing | Outcome |
|---|---|---|
| LevelDB data-block builder | prefix-shared entries and restart grouping | UNFROZEN |
| Apache Lucene postings block writer | postings/block grouping | STRUCTURAL_DROP: occupied Lucene index family/union |
| GNU Bison table packing | greedy/default table packing | STRUCTURAL_DROP: Wave249 duplicate |
| LLVM GlobalMerge | global coalescing of globals | UNFROZEN |
| Yosys opt_merge | equivalent-cell/coalescing | STRUCTURAL_DROP: active/previous Yosys scope |
| graph-tool coarsening | greedy graph grouping | UNFROZEN |
