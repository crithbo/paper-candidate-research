# Unique opportunity family

## POSTGRES-BRIN-NATURAL-RANGE-DEGRADATION

Hypothesis: on a temporally ordered public trip table, later out-of-order arrivals broaden BRIN page-range summaries and create a repeatable false-positive transition. The same-object test holds table schema, inserted records, SQL semantics, index opclass and range size fixed; it changes only a canonical prefix/arrival-order arm and query windows.

The family is not retained. The hypothesized *law* can be falsified, but its candidate exploitation is exhausted by existing native range-size/opclass/summarization/de-summarization/VACUUM actions or becomes physical reordering/controller logic. No N3 mechanism survives.
