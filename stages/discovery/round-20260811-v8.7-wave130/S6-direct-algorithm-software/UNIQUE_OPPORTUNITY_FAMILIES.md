# Unique opportunity families

## SQLITE-BTREE-GLOBAL-PAGE-ASSIGNMENT

The candidate family is a constructor that, during an insert/delete-induced balance, selects a legal assignment of already ordered cells, page identifiers, and overflow/free pages across an affected B-tree region. It keeps SQL-visible contents, page size, journal mode, native reader, and transaction result fixed.

It is unique to this red-team package, but it is **not retained**: the complete bounded native action is already represented by SQLite balancing and allocation; the proposed enlargement is not a distinct fixed-semantics construction.

No other opportunity family was screened in this depth-only assignment.
