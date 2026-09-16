# Official-source audit — S2-91-CQ01

| Sequence | Frozen official route | Pin / result | Permitted interpretation |
|---:|---|---|---|
| 1 | `api.github.com/repos/python/cpython` | 200; default branch `main` | Version-rule input only. |
| 2 | `api.github.com/repos/python/cpython/commits/main` | 200; `dffac6163e693cf80ed42cdc8e2cb5c0cb9577d7` | Immutable source pin. |
| 3 | `Include/internal/pycore_code.h` | 200; SHA-256 `08db5fac78833099243ab519a0e8ef039fcee2e3f7b9795aa57f9499daf18fc8` | Current cache representation. |
| 4 | `Python/specialize.c` | 200; SHA-256 `aabab89656c84ee7e5539cc45ab3dd625693b0ffa4193d690bf2c6ef74894e60` | Current quickening/specialization/deoptimization actions. |
| 5 | `Python/bytecodes.c` | 200; SHA-256 `42554ee70c95d75413f60f99ed0fca1a6b10efbee75355d2a84759dd08c76e82` | Current instruction family and specialization surface. |
| 6 | `Lib/test/test_dis.py` | 200; SHA-256 `7ec27f4df07d342803bd4cfc9c6c1346957341de3c00bb299e522ccd4e0ff730` | In-tree carrier for adaptive/quickened disassembly. |

## Exact-current observations

The four retained source loci share one main SHA and retain both the code-unit/cache representation and the executable specialization state machine. The test carrier supplies fixed Python functions that can be quickened and checks their adaptive disassembly. It is an appropriate bounded source-level carrier, but not by itself a two-alternative-plan proof.

## Interpretation limits

- `SEARCH_BOUNDED_OPEN` applies to direct collision beyond the clearly observed stock cache/specialization machinery; no external search was authorized.
- A proposed cache-layout/state construction that only changes current cache entry counts, counters, specialized opcodes, deopt mapping or standard quickening is already inside the visible subtractor boundary.
- Whether an action outside that boundary exists is unresolved; no absent feature is asserted and no Stage0 conclusion follows.
