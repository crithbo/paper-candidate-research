# Same-object RQs

For a fixed Python source module, CPython version/build, inputs and observable Python results, can a target-specific N2 constructor jointly select legal inline-cache slot/layout placement and specialization/deoptimization state representation to certify bytecode/cache footprint plus dispatch/deopt full-cost frontier? The stock interpreter must remain the reader/executor. Cache flags, changing bytecode semantics, generic compression and a policy controller fail. The alternate RQ is the same family under a bounded opcode-cache interference parameter.
