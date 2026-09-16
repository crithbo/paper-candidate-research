# Source and collision matrix

| family | first-party source | current-union / collision record | result |
|---|---|---|---|
| FDT/DTB | [Linux FDT documentation](https://www.kernel.org/doc/html/v5.9/devicetree/booting-without-of.html) and [current DTS style](https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html) | format exposes strings offsets; document identifies `dtc`, but source pin/flags/current writer frontier unclosed | UNFROZEN |
| kmod index | [kmod official project](https://github.com/kmod-project/kmod) | libkmod resolves dependencies/aliases; official repo link exists but exact current depmod/index source/config/artifact pairs unclosed | UNFROZEN |
| jimage | [OpenJDK jimage investigation](https://cr.openjdk.org/~sgehwolf/leyden/jimage_file_format_investigation_leyden.pdf) | image header/index/resources and reader purpose documented; not a current builder-union closure | UNFROZEN |
| ORC | [Linux source repository](https://github.com/torvalds/linux) | no union-external complete construction witness under ordered IP lookup identified | DROP |
| build-id | [GNU ld documentation](https://sourceware.org/binutils/docs-2.26/ld/Options.html) | build-id derives from final output/identifies the linked file; layout rewrite changes an observable identity | DROP |
| delta baseline | [RFC 3284](https://www.rfc-editor.org/rfc/rfc3284.html) | standard same-information source→target differencing is required in every retained comparison | baseline, not contribution |

No direct literature novelty conclusion is made.  The three retained deep reviews have `SEARCH_BOUNDED_OPEN` collision status because their current builder unions are not fully source-pinned.
