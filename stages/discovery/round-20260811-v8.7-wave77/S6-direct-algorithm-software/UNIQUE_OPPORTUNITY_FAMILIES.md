# Wave77 unique families

| family | fixed reader/object | current union | carrier | result |
|---|---|---|---|---|
| SQUASHFS-BLOCK | fixed tree to SquashFS reader | mksquashfs builder/codec union | source trees | DROP |
| NIX-NAR | fixed store tree to NAR reader | nix nar builder union | Nix packages | DROP |
| RPM-HEADER | fixed package metadata to RPM reader | rpm header/index writer | RPM packages | DROP |
| CARGO-SPARSE | fixed crate registry state to cargo client | sparse index generator/layout union | public crates | DROP |
