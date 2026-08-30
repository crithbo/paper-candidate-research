# SOURCE_COLLISION_MATRIX

| role | primary source | direct finding |
|---|---|---|
| pre-RA config placement | [LLVM X86PreTileConfig source](https://llvm.org/doxygen/X86PreTileConfig_8cpp_source.html) | `ldtilecfg` reachability, multiple insertion points and mandatory post-call reload after AMX clobber are explicit. |
| post-RA config construction | [LLVM X86TileConfig source](https://llvm.org/doxygen/X86TileConfig_8cpp_source.html) | Final physical tile mapping/shapes are used to fill descriptor fields for tile0–tile7 after RA. |
| current tile RA control | [LLVM X86 target-machine source](https://llvm.org/doxygen/X86TargetMachine_8cpp.html) | `x86-tile-ra` is a default-enabled specialized tile-RA path. |
| Intel/LLVM programming model | [LLVM AMX programming-model review](https://reviews.llvm.org/D87981) | Documents tile configuration, physical tile shapes and allocation-stage separation. |
| general algorithm subtractors | [Combinatorial RA/scheduling](https://arxiv.org/abs/1804.02452) and [integrated register optimization](https://arxiv.org/abs/1406.0582) | Generic integrated allocation approaches are known and would not rescue a tile-specific claim lacking a distinct state/guarantee. |

No future-work or missing-source inference is used. The direct collision is current upstream’s two-stage AMX composition itself.
