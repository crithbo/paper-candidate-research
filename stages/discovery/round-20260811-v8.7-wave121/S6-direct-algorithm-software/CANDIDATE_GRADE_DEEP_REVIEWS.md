# Depth red-team — libpng cross-row filter action

## Frozen object and native semantics

The object is a single, non-interlaced image with fixed decoded pixels, width/height, color type, bit depth, ancillary-chunk policy and PNG lossless stream semantics. The output must conform to the W3C PNG Third Edition and decode through libpng to the identical pixels. A different codec, palette/color transform, bit depth, lossy quantizer, decoder, or PNG semantic mode is out of object.

## Current upstream reality and strongest executable union

Upstream is frozen to `pnggroup/libpng:libpng18` as fetched 2026-08-11. `pngwutil.c` exposes the writer's image-size calculation, IDAT compressor ownership and a persistent zlib stream. Its current IDAT path uses the configured `zlib_level`, `zlib_method`, `zlib_window_bits`, `zlib_mem_level` and `zlib_strategy`; the stream is initialized/reset through `deflateInit2`/`deflateReset`, and IDAT calls preserve output state across inputs. The same source selects default strategy conditional on `do_filter`, and can optimize the zlib CMF header for a legal stream.

The fair current union therefore contains every public/default and non-default permitted filter mask, compression level/method/window/memory/strategy, filter-none path, the native row-filter candidates, stream/chunk buffering, and all legal PNG writer actions exposed under the frozen format contract. `png_write_IHDR` also defaults `do_filter` to all filters for eligible images. The standard fixes lossless pixels and permissible filter/stream semantics; it does not make output bytes canonical.

## Candidate action and minimal witness

Candidate action: for each row `i`, choose `f_i` from the allowed PNG filter set jointly over a bounded horizon, using a state that includes the predecessor raw/filtered row and a finite representation of the frozen zlib history, then emit the selected filtered rows to the same zlib tuple. This is a complete action only if the state approximation/error and terminal action are defined.

Minimal legal witness: two adjacent, correlated rows with permitted filters `A` and `B`; arrange their byte differences so row-local filter scores tie or prefer `A`, while the byte prefix induced by `B` changes compressibility of row two under the same zlib stream. Both resulting streams remain standard PNG and decode identically. This witnesses a cross-row decision variable, not a demonstrated gain.

## Red-team closure

The source confirms persistent compressor state and exposes a full settings union, but this review did **not** freeze: (1) the exact native row-score/selection routine and all compile-time filter paths at a commit hash; (2) a finite zlib-state abstraction whose approximate global objective has a stated error/guarantee; or (3) a direct-current collision matrix covering same-object PNG optimizers/writers that may already search filter sequences or jointly tune filter/compression choices. Without all three, the action-gap certificate remains a structural hypothesis rather than an admission-grade N2.

## Full-cost denominator and finite 72-hour killer

For a fixed public PNG corpus, the required denominator is: image parse/decode; construction of all candidate filtered rows/state; planner memory/time; native zlib encode; PNG chunk/CRC output; output bytes; native decode; decoded-pixel equality; encode/decode CPU and peak RSS. Comparator is the full current libpng union at identical PNG semantics and frozen zlib/config tuple, not a single default run.

Finite killer: on a 2–8 row small image witness and then a bounded natural corpus slice, fail closed if any candidate stream fails libpng decode/pixel equality/PNG conformance; if the joint action reduces to a filter/config sweep; if a same-object current optimizer already expresses it; or if all exact legal candidate sequences are non-Pareto after planner+encode+decode+RSS+bytes are charged.

## Decision

`NOT_ADMITTED_UNFROZEN` and **no brief**. The topic is not structurally STOP: the whole-image decision variable and a finite fidelity route are explicit. It is not proposed because current-union/direct-collision closure and a rigorous finite state/action definition are incomplete. This conclusion is unrelated to implementation availability, result availability, resources, or AI readiness.
