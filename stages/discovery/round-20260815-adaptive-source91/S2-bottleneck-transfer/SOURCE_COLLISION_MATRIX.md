# Collision matrix

| Comparator | Result |
|---|---|
| Stock CPython adaptive bytecode/cache/specializer/deopt union | Strong baseline; excludes flags/controllers/custom interpreter |
| Historical hash-based `.pyc` | Different identity; excluded from resurrection, not this object |
| Direct same-object joint algorithm | `SEARCH_BOUNDED_OPEN`, no absence inference |
