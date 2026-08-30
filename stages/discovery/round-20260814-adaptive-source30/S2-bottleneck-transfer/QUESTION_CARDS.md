# Source30 question cards

## QC-01 Gaudi TPC host-glue

Exact object: a fixed TPC kernel, tensor values/shapes and stock Gaudi output semantics. Current official TPC documentation says host glue already specifies dynamic partitioning of inputs/outputs among TPC processors, while the programming model exposes tensor accesses and an MME/TPC pipeline mapping. The proposed action is a current glue-code partition/controller rather than a separable target-specific whole algorithm. `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_CONFIGURATION`.

## QC-02 Transformer Engine FP8 metadata/materialization

Exact object: a fixed Transformer Engine layer/model and numerical acceptance contract. Current official TE 2.16 documentation supplies recipes for delayed/current/block scaling, quantizers, row/column forms, transpose handling and distributed training. The candidate reduces to recipe/scale configuration or library-owned fused construction. `EXCLUDED_BEFORE_RAW__CURRENT_UNION_OR_PAPER_OWNED_CONSTRUCTOR`.

No other cooled or unfrozen seed satisfied all raw-required fields.
