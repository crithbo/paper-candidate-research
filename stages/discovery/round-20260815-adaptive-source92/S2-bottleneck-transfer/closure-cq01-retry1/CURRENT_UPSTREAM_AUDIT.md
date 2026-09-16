# Current upstream audit — Ruby YJIT retry1

Pinned `ruby/ruby@d17a0d008310e36d1e16f9614c7ca01fe38cf3d6`. The retained YJIT codegen/core/assembler and test/listing loci define current code block allocation/placement, side exits, invalidation/branch patching and code-GC metadata/action surfaces. The bounded material does not establish one fixed program with two complete native-legal code-block-plus-side-exit plans, a YJIT-specific union-external action, or finite guarantee. Generic code packing/metadata controller and changed side-exit/invalidation semantics are not permitted substitutes.
