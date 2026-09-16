# Source / collision matrix

| gate | primary source | closure result |
|---|---|---|
| lexsort API/semantics | [Arrow-RS lexsort docs](https://arrow.apache.org/rust/arrow/compute/fn.lexsort.html), [arrow-ord](https://docs.rs/crate/arrow-ord/latest) | fixed values/options/limit and errors documented |
| current sort composition | [Apache Arrow multi-column sort post](https://arrow.apache.org/blog/2022/11/07/multi-column-sorts-in-arrow-rust-part-1/) | index-first plus deferred `take`, multi-column comparator and row-format subtractors |
| current interleave union | [arrow-select interleave docs](https://arrow.apache.org/rust/arrow_select/interleave/index.html) | type-specialized/fallback/list-view actions exposed |
| recent performance leads | [Arrow-RS upstream PR listing](https://github.com/apache/arrow-rs/pulls) | small-limit lexsort and primitive-list interleave are current upstream work, not gap proof |

The same-object composition absorbs the stated materialisation/dispatch candidate. No absence claim is needed for the disposition.

