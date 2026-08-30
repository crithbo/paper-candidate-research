# Current-source and collision audit — PATCHYIELD-CALL

## Current vLLM union

The retrieved current `vllm/config/scheduler.py` (`3CF5…98BC`) exposes FCFS and
priority policy, a configurable `scheduler_cls`, async scheduling controls and a
KV watermark. Current official documentation also describes token-budget unified
scheduling, prefix caching and priority/FCFS. This is evidence that a policy
plugin exists; it does **not** prove frozen v0.26.0 CLI compatibility, which
remains a finite Stage A fidelity check.

## Collision posture

VTC, DLPM and Justitia are not optional related work. Justitia is the key
near-direct collision because it schedules task-parallel LLM agent applications
on vLLM while preserving fairness. Available primary material does not establish
identical frozen carrier, public progress observations, arrival-relative sealed
success endpoint, or the candidate's currently unspecified policy guarantee.
Therefore the correct current disposition is `SEARCH_BOUNDED_OPEN`, not either
an absence claim or an automatic direct fatal.

## Required revision separation

The revision must give a full action/guarantee mapping against the above union;
otherwise a progress score passed into `scheduler_cls` is routine emitter/plugin
engineering and the topic stops. No source/transport failure was used to reach
this conclusion.
