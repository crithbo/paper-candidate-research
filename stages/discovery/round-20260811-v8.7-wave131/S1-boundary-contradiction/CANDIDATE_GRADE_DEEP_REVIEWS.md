# CANDIDATE_GRADE_DEEP_REVIEWS

## D01 OSS-Fuzz failure recurrence

**Corpus:** official OSS-Fuzz project histories, reproducer classes and coverage/build metadata. **Current explanation/baseline:** per-bug triage and fuzzing coverage/reproducer classification. **Candidate N3 claim needed:** a regularity must persist across project, language, sanitizer and time strata, and support a same-object fuzzing/reproducer allocation mechanism rather than a dashboard wrapper. **Confounds:** project size, fuzzer CPU budget, sanitizer, code churn and duplicate reports. **72h killer:** hold out projects/time windows; if the proposed cluster vanishes after stratification or does not beat current per-project baseline under full triage cost, it fails. No stable regularity or complete utilization mechanism was frozen. `NOT_ADMITTED_UNFROZEN`.

## D02 Mozilla crash telemetry

**Corpus:** official telemetry/crash signature cohorts by release/channel/platform. **Baseline:** current crash signature/rate and release-health interpretation. **Candidate N3 requirement:** a signature transition must remain across release, hardware/OS and channel controls, and yield a same-product mitigation/characterization mechanism—not a report wrapper. **Confounds:** population denominator, rollout, symbolication, release channel and hardware mix. **72h killer:** pre-registered temporal holdout with denominator-normalized rate and signature oracle. No mechanism or stable rule is frozen. `NOT_ADMITTED_UNFROZEN`.

## D03 Kubernetes TestGrid histories

**Corpus:** official TestGrid job/build/commit failures. **Baseline:** job-level failure status and existing test triage. **Candidate N3 requirement:** a reproducible failure-transition regularity across independent jobs/configurations with a same-object test/diagnostic mechanism. **Confounds:** commit batching, infrastructure outage, test shard, configuration and retry behavior. **72h killer:** commit-time split and independent job family; if association is explained by retry/infrastructure grouping or does not generalize, fail. No complete mechanism/stable rule frozen. `NOT_ADMITTED_UNFROZEN`.

Three deep reviews completed. These are not drops for missing evidence/resources; they lack a frozen stable N3 law and same-object utilization/characterization contribution.
