# Swift async-context forwarding — independent source closure

## Disposition

`STRUCTURAL_DROP__CURRENT_SWIFT_ASYNC_UNION_OR_GENERIC_COROUTINE_FRAME_LOWERING`.

This is a prebrief source-closure disposition only. It does not authorize Stage 0, Stage A, or Stage B.

## Frozen same-object check

The inspected default-branch pin is `73a9e4a38bbee929938d3644f1153f768e29bfcf`. The object remains one fixed `async throws` Swift caller/callee chain under one Swift async ABI, with unchanged result, error, cancellation, executor, and call-frame semantics.

The exact proposed primitive—async context forwarding or frame-state preservation across call boundaries—is already a current ABI action:

- `AsyncContext` stores `Parent` and `ResumeParent`; `resumeParent()` resumes that parent with `swiftasync` calling convention.
- The ABI documentation/source states that async contexts are generally task-local-stack allocated **but may be allocated in the caller's frame**.
- `ContinuationAsyncContext` and task resume context support suspension/resumption; the same ABI source includes executor preference, enqueue, cancellation-shield, and task-local state surfaces.
- Current `GenConcurrency.cpp` supplies IRGen paths for executor construction/current-executor retrieval, task-local push/pop, and an async suspend continuation.

These are not merely a scheduler configuration or a future interface: they realize the frozen call-chain context-parent/resume/frame-placement action within the same ABI.

## Current-union and generic reduction

The fair current union is therefore: native `AsyncContext` parent/resume linkage; caller-frame-legal context allocation; current coroutine suspension/resume; executor/task-local/cancellation actions; and IRGen lowering. The 2026 current test index supplies public async/throwing/cancellation/task-local/executor carrier families, although no individual test blob was retained because the literal `async.swift` locator returned 404.

Any remaining claim that merely selects caller versus task-local frame placement, forwards `Parent`, preserves the resume function, or orders existing suspend/resume calls is either already embodied in this union or reduces to ordinary coroutine frame/call lowering. To escape the reduction it would need a new same-ABI action or guarantee; none is specified by the frozen action family. Replacing the ABI, scheduler, executor, task-local/error/cancellation semantics, or observable call-chain behavior is forbidden by the assignment.

Accordingly the direct current action and generic-reduction tests both fail the non-generic discriminator. This is a scientific structural drop, not a consequence of the missing literal test filename, lack of implementation, or lack of performance data.

## Evidence limits

No compilation, candidate implementation, execution, benchmark, or hardware action occurred. The six allowed acquisition calls were used; five official responses totaling 619,924 bytes are retained. The 404 is only a locator failure and is not evidence of absence.

## Sources

- Swift current ABI [`Task.h`](https://github.com/swiftlang/swift/blob/73a9e4a38bbee929938d3644f1153f768e29bfcf/include/swift/ABI/Task.h).
- Swift current IRGen [`GenConcurrency.cpp`](https://github.com/swiftlang/swift/blob/73a9e4a38bbee929938d3644f1153f768e29bfcf/lib/IRGen/GenConcurrency.cpp).
- Swift Evolution [SE-0296: Async/Await](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0296-async-await.md).
