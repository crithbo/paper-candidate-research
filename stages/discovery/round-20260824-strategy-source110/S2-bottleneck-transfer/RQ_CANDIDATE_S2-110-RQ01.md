# Frozen RQ

`denylist_check=RELATED_ONLY`: ExecuTorch XNNPACK fallback has a distinct edge-CPU object, but the RQ requires a target-native fallback action beyond current partition/delegation controls. Primary source: current ExecuTorch XNNPACK backend overview and partitioner API; full cost is lowering/partitioning, portable fallback, workspace/memory copies, host runtime and CPU execution.
