# Source / collision matrix — Source35 S2

| base family | exact proposed endpoint | strongest current same-object union | canonical result |
|---|---|---|---|
| CUDA VMM fabric mapping | target-specific mapping/access constructor with guarantee | current low-level reserve/create/map/unmap/access/fabric-handle API composition | pre-raw exclusion |
| TensorRT dynamic output | target-specific output-materialization constructor with guarantee | `IOutputAllocator`, preallocate/defer/grow/recycle and memory-pool behavior | pre-raw exclusion |
| CUDA Unified Memory | placement constructor with guarantee | placement/access advice and runtime policy | pre-raw exclusion |

No global novelty or absence assertion is made. No primary-paper collision sweep was required because each base locator fails the target-specific action discriminator before raw.
