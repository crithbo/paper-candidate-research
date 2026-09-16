# Source110 S2 seed pool

`S2-110-01`: ExecuTorch XNNPACK delegation fallback may shift an operator gain to host conversion, partitioning or memory-copy cost. Base/addendum denylist check: `RELATED_ONLY` to prior ExecuTorch repartition only if exact object is a current XNNPACK fallback boundary and action/endpoint are distinct; otherwise exclude. Selected RQ `S2-110-RQ01`: does current ExecuTorch expose a distinct target-native fallback action with fixed full-cost endpoint beyond existing partition/delegation controls?
