# Current union matrix

Current LLVM strictfp/constrained FP represents dynamic rounding and exception behavior. LoongArch lowering explicitly maps LLVM rounding to FCSR reads/writes. These are primitive/semantic facts, not novelty or performance claims. The candidate did not add a target-specific N1/N2/N3 guarantee.
