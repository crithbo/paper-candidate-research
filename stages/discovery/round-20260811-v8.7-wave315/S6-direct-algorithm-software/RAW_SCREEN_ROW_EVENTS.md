# Source-level events

| event | official source | implication |
|---|---|---|
| `lexsort` performs unstable lexicographic sorting using `SortColumn` values/options and optional limit. | Arrow-RS API docs | exact ordering/null semantics are explicit |
| documented sort path returns indices then applies `take` to each batch column. | Arrow blog/API docs | delayed copying/materialisation is already a native composition |
| multi-column lexsort is documented with row-format acceleration guidance. | Arrow API/blog | strong same-object performance subtractor exists |
| interleave has specialized primitive/list/list-view/dictionary/run-end/struct/record-batch paths plus fallback. | Arrow-RS API docs | current union is broader than a single materialisation strategy |

