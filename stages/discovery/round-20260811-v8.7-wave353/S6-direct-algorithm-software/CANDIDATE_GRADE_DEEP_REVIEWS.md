# Depth reviews

## libjpeg-turbo Huffman tables

Fixed contract: same input samples/metadata and decoded-pixel semantics under stock JPEG reader. Official source: https://github.com/libjpeg-turbo/libjpeg-turbo. A legal JPEG can use different Huffman tables, but construction is canonical Huffman coding plus existing encoder configuration; a purported bounded-state or joint table algorithm is generic Huffman/layout or a knob, which is excluded. Natural route would be public image suites; full cost is encode/decode CPU/RSS/temp/bytes and pixel equality; killer would require a non-generic guarantee over current encoder union. No such residual exists. `STRUCTURAL_DROP` for this exact mechanism.

## MuPDF display lists

Fixed contract: same PDF/page/options and stock rendered-page pixels. Official source: https://github.com/ArtifexSoftware/mupdf. Display-list building, interpretation and rendering may be phased, but current producer options/action union and a stock-equivalent two-list native witness were not closed. A candidate is otherwise rendering cache policy or generic layout. Natural corpus would be public PDFs; ledger is list build/render CPU/RSS/temp/bytes and pixel equality; killer compares complete current construction/render union. `NOT_ADMITTED_UNFROZEN`.
