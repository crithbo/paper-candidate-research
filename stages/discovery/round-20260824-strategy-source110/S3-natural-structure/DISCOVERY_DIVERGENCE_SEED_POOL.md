# Source110 S3 seed pool

Pre-lookup denylist checks: S1=`RELATED_ONLY` (llama.cpp CPU `Q4_K` kernel action; distinct from offload); S2=`EXACT_OR_CONTAINS` (BitNet/MXFP/Marlin/AWQ); S3=`EXACT_OR_CONTAINS` (generic backend dispatch). Only S1 is a valid candidate.
