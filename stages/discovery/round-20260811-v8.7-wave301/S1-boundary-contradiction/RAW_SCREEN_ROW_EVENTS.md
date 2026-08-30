# RAW_SCREEN_ROW_EVENTS — Wave301

| row | fresh state/commit family | disposition |
|---|---|---|
| R01 | glibc ELF lazy binding/dlopen intermediate loader-state commit | deep |
| R02 | Linux futex2 waitv enqueue/wake/timeout commit | deep |
| R03 | CPython importlib ModuleSpec/sys.modules pre-exec commit | deep |
| R04 | JVM class-initialization transition | raw: no current source/corpus union pinned |
| R05 | ELF TLS static/dynamic model commit at loader start | raw: overlaps glibc loader union |
| R06 | robust-futex owner-death/waiter-pending transition | raw: overlaps futex action and kernel safety contract |

io_uring and QUIC were excluded as prior/registered lineages before deep review.
