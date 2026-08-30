# Primary RQ

`RQ01`: For a fixed hard-float MIPS program containing explicit FCSR accesses, fixed ABI and fixed observable numerical/exception result, is there a target-specific whole-call-graph FCSR mode placement/restoration algorithm with a nontrivial guarantee over current compiler compositions?

The alternate phrasings (region construction, deferred restoration, and call-boundary placement) are the same object and endpoint, so they were not counted as separate RQs. This is a question only: it does not assume that LLVM/GCC lacks an action or that a residual exists.
