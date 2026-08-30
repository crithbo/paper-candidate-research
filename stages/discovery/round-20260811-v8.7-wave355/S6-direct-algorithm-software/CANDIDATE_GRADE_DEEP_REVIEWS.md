# MuPDF display-list producer-union closure

Fixed contract: same PDF page, resources and rendering options; stock MuPDF rendered-page pixels are the oracle. Official upstream: https://github.com/ArtifexSoftware/mupdf.

Required union closure covers document/page interpretation, display-list recording, device/list replay, rendering options and all relevant producer/consumer controls. This bounded review did not pin an immutable current commit plus every default/non-default entry, and therefore could not define a complete native action catalog.

The requested two-list witness would need two stock-render-equivalent legal display lists differing by one named producer action. No such action was frozen independently of cache/replay policy or generic list layout. Without it, a target-specific exact/FPT/approximation/certified-Pareto guarantee cannot be stated honestly. Natural future route: versioned public PDFs; full cost: list build/render CPU/RSS/temp/list bytes and pixel equality; finite killer: beat full current union at identical pixels. Direct-collision closure is likewise deferred, not assumed absent.

Decision: `NOT_ADMITTED_UNFROZEN`; no brief.
