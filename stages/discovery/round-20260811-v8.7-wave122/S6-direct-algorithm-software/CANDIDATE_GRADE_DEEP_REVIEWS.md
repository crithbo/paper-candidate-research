# Depth red-team closure — libpng global filter sequence

## 1. Current upstream pin and writer action catalog

The official repository and raw `libpng18` source were fetched at the frozen date. Repository discovery identifies the `libpng18` branch and the relevant current source files: `pngwrite.c`, `pngwutil.c`, public `png.h`, plus the configuration surface. A direct attempt to pin the branch with `git ls-remote https://github.com/pnggroup/libpng refs/heads/libpng18` failed before source transfer with Windows Schannel `SEC_E_NO_CREDENTIALS`; a direct GitHub commit-history fetch was rate-limited (HTTP 429). Therefore no commit hash is fabricated.

Positive source facts that are sufficiently frozen:

- `png_write_IHDR` defaults eligible writer filter selection to `PNG_ALL_FILTERS` when no filter is set.
- `pngwutil.c` owns an IDAT zstream and configures level, method, window bits, memory level and strategy through `png_deflate_claim`; it reuses/resets the stream and `png_compress_IDAT` preserves its output state across input calls.
- The writer emits IDAT chunks and CRCs; its compressed output is a standard PNG stream. Public settings therefore include permitted filter selection and zlib parameters, not merely one default.

The exact row-filter selection function, every compile-time conditional filter path, and the moving branch commit remain unpinned. This is a reality-check limitation, not evidence that an action is absent.

## 2. Finite fidelity closure plan

For the minimal two-row witness, closure does not require an approximate compressor model. Define the state at step `i` as an **exact, replayable prefix transcript**: fixed pixels and filter choices `f[0..i]`, fixed libpng source build and frozen compressor tuple; run the native encoder from the start over that prefix when evaluating a successor. The finite candidate set is at most `|F|^h` (five PNG filters, chosen finite `h` such as 2–8); its state is auditably represented by input/filter-prefix bytes rather than an asserted finite summary of private zlib state.

This supplies a finite StageA fidelity gate only: native PNG legality, native decoded-pixel equality, recorded output bytes, encode/decode CPU and peak RSS for every enumerated prefix. It supplies no whole-corpus guarantee and no positive result. Extending the algorithm beyond finite `h` would require a stated state approximation/error/complexity guarantee before making a claim.

## 3. Same-object optimizer collision closure

The comparator cannot be narrowed to libpng with a fixed zlib tuple. The official Google Zopfli repository documents `zopflipng`/Zopfli as generating valid DEFLATE/zlib streams with speed/compression options; a valid PNG stream produced this way is same decoded-pixel and same standard format object. Thus ZopfliPNG is a direct same-object writer family whose compressor action belongs in the strongest union.

The official/first-party source endpoints for OptiPNG and pngcrush could not be completely fetched in this bounded assignment (OptiPNG request error; pngcrush SourceForge endpoint rejected as unsafe). Their complete current filter/strategy/action unions are consequently not claimed. Neither an old limitation nor a future-work sentence is used as absence evidence.

Because the complete union of libpng, ZopfliPNG, OptiPNG and pngcrush has not been source-enumerated, it is unknown whether any already supplies joint filter-sequence search. The proposed filter sequence is therefore not certified union-external.

## Corrected full-cost and 72-hour killer

If later source closure permits admission, the natural corpus is public PNG/pngsuite plus public lossless images. Same-object oracle is W3C PNG conformance and native-reader decoded-pixel equality. Full cost is decode/parse, candidate planning/replays, filter construction, compressor work, PNG chunk/CRC output, output bytes, encode/decode CPU and peak RSS. The fair baseline is the complete same-object writer union, including current libpng parameter space and same-object optimizers—not a default libpng run.

Kill within 72 hours if: a stream is illegal or pixel-inequivalent; a candidate changes codec/object/guarantee; the action is expressible as an existing filter/config/compressor choice; current optimizer source expresses joint sequence search; or exact finite candidates are non-Pareto after every cost is charged.

## Decision

`NOT_ADMITTED_UNFROZEN`; no Stage0 brief. The two-row witness and finite small-witness fidelity route remain valid. Admission is blocked only by incomplete current source pin/path closure and, crucially, the unresolved strongest same-object optimizer union; it is not blocked by missing implementation, results, resources or AI readiness.
