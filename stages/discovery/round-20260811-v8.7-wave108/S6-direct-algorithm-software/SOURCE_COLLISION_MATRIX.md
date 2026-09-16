# Source and collision matrix

| Family | Primary/current source | Current union evidence | Result |
|---|---|---|---|
| mimalloc | [upstream source](https://github.com/microsoft/mimalloc) | page/segment, free-list and remote-free actions | absorbed |
| jemalloc | [upstream source](https://github.com/jemalloc/jemalloc); [official manual](https://jemalloc.net/jemalloc.3.html) | arena/bin/extent/tcache lifecycle | absorbed |
| snmalloc | [upstream source](https://github.com/microsoft/snmalloc) | ownership, remote-free and allocator state | absorbed |
| rpmalloc | [upstream source](https://github.com/mjansson/rpmalloc) | span/cache construction actions | absorbed |
| dlmalloc | [author source](https://gee.cs.oswego.edu/dl/html/malloc.html) | chunks/bins/coalescing union | absorbed |
| Ninja | [official manual](https://ninja-build.org/manual.html); [upstream source](https://github.com/ninja-build/ninja) | dependency/ready/pool/launch actions | controller structural drop |

The matrix makes no absence inference; all action-space conclusions are affirmative current behavior/source claims.
