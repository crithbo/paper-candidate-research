# Wave268 FITS tiled-image/heap bounded-recourse closure

Frozen hashes matched the assignment. No experiment, benchmark, download, Stage/shared write or automation occurred.

## Fixed object/current union

Object is a fixed FITS HDU/header/data logical object, exact decoded integer-pixel/table values, and stock CFITSIO reader plus CHECKSUM acceptance. For floating images, lossy quantization is excluded. Current CFITSIO union includes tiled-image compression stored in variable-length binary-table rows, transparent stock IMAGE reads, supported codecs and tile directives, external compression, `fits_img_compress/decompress`, variable-array heap extension, row addition heap shifting, overwrite-on-vector update, `fits_compress_heap`, and automatic PCOUNT/checksum maintenance.

## Witness and result

Minimal two-output state: same integer image with two compressed tiles. N0 stores each tile in `COMPRESSED_DATA` heap rows under native tile convention. N1 proposes jointly moving/repacking the two variable-length heap vectors while retaining headers, tile coordinate mapping, decoded pixels and checksum. This is syntactically an exact decoded object, but not a new action witness: CFITSIO already permits heap growth/compression and tile-compressed rewrites; moving vectors is a heap maintenance/rewrite decision. Cross-HDU sharing would change the FITS HDU/header/heap object and is excluded.

`COMPLETE_ZERO_PROPOSALS__CURRENT_UNION_ABSORBED`. There is no source-supported bounded-recourse online joint constructor outside current heap/tile rewrite union. Source pin/current runtime commit and a versioned natural astronomy mutation trace were not closed because no candidate survived; this is not a scientific negative.

## Fidelity and killer

A future route must pin CFITSIO commit, exact natural FITS exposure/update trace and HDU schema. Oracles: CFITSIO pixel/table reads, header keyword equality where required, checksum verification and stock file acceptance. Charge rewritten bytes, heap movement/compression, temporary file/RSS, read/write CPU/I/O, index/tile access and checksum work. Within 72h reject on any decoded/checksum difference, header/HDU change, union-equivalent action, recourse-bound failure or no full-cost gain.

Sources: [tile format](https://heasarc.gsfc.nasa.gov/docs/software/fitsio/c/c_user/node122.html), [variable heaps](https://heasarc.gsfc.nasa.gov/docs/software/fitsio/c/c_user/node29.html), [CFITSIO compression](https://heasarc.gsfc.nasa.gov/docs/software/fitsio/compression.html), [image compression API](https://heasarc.gsfc.nasa.gov/docs/software/fitsio/c/c_user/node41.html), [fpack](https://heasarc.gsfc.nasa.gov/docs/software/fitsio/fpack/fpack.html).
