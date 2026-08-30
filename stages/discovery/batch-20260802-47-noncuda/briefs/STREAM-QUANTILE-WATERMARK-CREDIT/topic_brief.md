# STREAM-QUANTILE-WATERMARK-CREDIT
- Status: `DROP`; Primary lane: streaming algorithms; Discovery date: 2026-08-02
## Research question
Can watermark credits improve rank sketches with late data?
## Exact object
Out-of-order event-time quantile synopsis and rank certificate.
## Strongest fair baseline
Cormode-Korn-Tirthapura / KLL-GK / FiBA-style late-window summaries.
## Current collision subtraction
Same failure core as `STREAM-QUANTILE-LATE-CERT`: credits add no non-replayable action.
## Decisive falsifier
Existing summaries reproduce the proposed split/merge policy.
## Dual-axis score
- Academic value: `44/70`; AI executability bonus: `24/30`; Total: `68/100`
