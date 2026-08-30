# Source and collision matrix

| gate | primary source | result |
|---|---|---|
| current architecture | [CBMC architecture](https://diffblue.github.io/cbmc/group__cbmc.html), [goto-symex](https://diffblue.github.io/cbmc/group__goto-symex.html) | front end → GOTO → symex SSA equation → solver/trace source chain confirmed |
| current flags/actions | [BMC option source](https://diffblue.github.io/cbmc/bmc__util_8h.html), [CBMC man page](https://diffblue.github.io/cbmc/man/cbmc.html) | slicing, unwinding, incremental/path and complexity actions are part of current union |
| concrete current slice behavior | [current bmc_util source](https://diffblue.github.io/cbmc/bmc__util_8cpp_source.html), [slice source](https://diffblue.github.io/cbmc/slice_8cpp.html) | formula/simple slicing are native actions; thread condition is explicit |
| direct theoretical subtractor | [CProver partial-order BMC paper](https://www.cprover.org/etaps/tacas.pdf) | mature SSA/equation construction theory is a contrary same-object family |

No claim relies on a missing feature. The current-source evidence supports absorption of the stated order/selector construction.

