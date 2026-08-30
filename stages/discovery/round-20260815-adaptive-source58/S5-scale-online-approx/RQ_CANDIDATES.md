# Source58 S5 RQ convergence

## S58-01 CMake File API

- Exact public anchor: CMake 4.4.1 file API documentation, accessed 2026-08-15.
- Stable object/guarantee: a fixed build tree/query set and the same versioned
  File API index/reply object semantics for stock clients.
- Primary RQ: Can a bounded-recourse reply-state constructor reduce repeated
  generate/publication cost while preserving index-selected reply visibility,
  concurrent-read behavior, and generated build-system semantics?
- Result: ordinary closure reaches native reply generation/index publication;
  remaining timing/retention choices are policy.

## S58-02 Gradle configuration cache

- Exact public anchor: Gradle 9.6.1 configuration-cache official documentation,
  accessed 2026-08-15.
- Stable object/guarantee: fixed Gradle project, tracked inputs, task graph,
  build output, and diagnostics.
- Primary RQ: Can a bounded-recourse constructor retain exact configuration
  cache correctness under input changes while lowering full configuration,
  validation, execution, bytes, and memory cost without weakening input
  tracking?
- Result: current cache/input tracking controls span the named action; ignoring
  inputs weakens the contract.

## S58-03 SCons signature database

- Exact public anchor: SCons 4.5.1 API documentation, accessed 2026-08-15.
- Stable object/guarantee: fixed source/target environment and stock signature
  invalidation/build result.
- Primary RQ: Can an online bounded-recourse signature-state constructor
  improve update cost while preserving SCons invalidation and output semantics
  without becoming signature-cache configuration?
- Result: no target-specific atomic action was frozen beyond signature/cache
  state policy.

