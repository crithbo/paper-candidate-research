# Exact public anchor

## A01 — io_uring multishot provided-buffer ownership

- exact public object: current liburing/io_uring multishot receive with provided buffers and optional incremental buffer consumption.
- current primary interface: [io_uring provided buffers](https://man7.org/linux/man-pages/man7/io_uring_provided_buffers.7.html).
- current contrary interface: [io_uring multishot](https://man7.org/linux/man-pages/man7/io_uring_multishot.7.html).
- upstream current source/header locus: [liburing `io_uring.h`](https://github.com/axboe/liburing/blob/master/src/include/liburing/io_uring.h).
- natural carrier: high-concurrency socket/stream applications using multishot receive and provided buffer rings; this is systems I/O, not a network-security topic.

The frozen endpoint includes selected buffer ID, CQE result/flags, `IORING_CQE_F_MORE`, `IORING_CQE_F_BUF_MORE`, cancellation/error behavior, and legal return timing.
