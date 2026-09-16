# Source116 S5 frozen RQ candidates

- **RQ01:** Starting from one merged llama.cpp context-checkpoint patch and its changed test, is there a current, same-object long-session scale threshold whose robust action remains outside the patch and current configuration surface?
- **RQ02:** Starting from one merged vLLM prefix-cache or scheduler patch and its changed test, is there a current, same-object continuous-batching long-context residual under a fixed output-validity and full-cost endpoint?
- **RQ03:** Starting from one merged SGLang radix-cache or scheduler patch and its changed test, is there a current, exact online serving sequence-length residual with a robust action beyond a local configuration correction?

For each RQ, the frozen source route is: merged PR/commit → parent source and changed test → current source/test → official documentation and default/non-default flags → same-object residual/contrary check.  No issue-only or local-patch route may enter raw.
