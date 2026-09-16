# Raw screen row events

| event | result | evidence |
|---|---|---|
| current format/index union | pass | Current HDF5 FMT3 identifies five latest-format chunk-index families based on dataspace and extension behavior; old-format uses v1 B-tree. |
| allocation/filter/cache union | pass at public interface | Official public enum documents early/late/incremental allocation and chunk-index kinds; chunking docs fix logical chunk boundaries and filter dependency. |
| natural carrier route | pass | NASA LAADS official VIIRS versioned HDF5/netCDF4 products provide time-stamped/versioned HDF5 natural data route. |
| complete maintenance/rewrite union | NOT_ADMITTED_UNFROZEN | Current HDF5 `develop` source is pinned as official repository, but source-level proof of every legal in-place index conversion/rewrite action was not completed. No absence claim is made. |
| decision | NOT_ADMITTED_UNFROZEN | EA is already purpose-built for single-unlimited-dimension append; a migration residual needs exact current conversion-path proof and a natural update trace before a same-object action gap can be named. |
