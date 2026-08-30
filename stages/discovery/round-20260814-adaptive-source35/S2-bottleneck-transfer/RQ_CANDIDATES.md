# RQ candidates — Source35 S2

All three selected questions held their fixed semantics before current-source lookup.

1. **CUDA VMM:** for a fixed multi-GPU CUDA program, does a mapping/access constructor with a bounded guarantee exist outside reserve/create/map/access composition? Cheapest contrary: the current VMM API union.
2. **TensorRT dynamic output:** for a fixed engine and shapes, does an output-materialization constructor with a bounded guarantee exist outside `IOutputAllocator`, preallocation, growth/recycling and pool behavior? Cheapest contrary: current dynamic-shape documentation.
3. **CUDA Unified Memory:** for a fixed program and memory-consistency contract, does a placement constructor exist beyond advice/runtime policy? Cheapest contrary: current Unified Memory documentation.

Each failed before raw without reformulation or outcome-driven replacement.
