# DB-PLAN-REGRET-REPLAY
- Status: `DROP`; Primary lane: database optimization; Discovery date: 2026-08-02
## Research question
Can replay-driven plan repair beat online probing under a plan-regret ledger?
## Exact object
Adaptive SQL plan choice with bounded probe/replay cost.
## Strongest fair baseline
ECQO/PAO/PARQO-style robust plan selection with the same observations and budget.
## Current collision subtraction
Same object/mechanism as stopped `DB-PLAN-REGRET-WITNESS`; replay only changes diagnostic implementation.
## Decisive falsifier
Already satisfied by the historical collision.
## Dual-axis score
- Academic value: `44/70`; AI executability bonus: `24/30`; Total: `68/100`
