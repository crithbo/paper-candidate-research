# Exact public anchor

## A01 — CPython buffer protocol

- Exact public identity: CPython C-API `Py_buffer` acquired with `PyObject_GetBuffer` (or parsing helpers), consumed under the returned flags, and released with `PyBuffer_Release`.
- Version/date: Python documentation 3.14.6, current at this assignment’s frozen public-source check.
- Same-object endpoint: the same exporter, requested buffer flags, consumer calls, bytes/shape/format, and exporter-validity/resize behavior; no changed ownership or validity guarantee.
- Natural carriers: `bytes`, `bytearray`, `array.array`, `memoryview`, and C extensions using file `write`/`readinto` style buffer calls.
- Primary source: <https://docs.python.org/3/c-api/buffer.html>.
- Current implementation locus: <https://github.com/python/cpython/blob/main/Objects/abstract.c> (`PyBuffer_Release`).

The anchor is exact enough to test the proposed ownership seam; it is not an assertion that a residual exists.
