# Marginal correctness and fallback proof

## Distributional, not bitwise, sampler claim

For branch `a` at token time `t`, let `p_a,t` be the categorical distribution after the full frozen native processor/warper/stopping sequence. With `G_j` i.i.d. standard Gumbels indexed by token and vocabulary,

`X_a,t = argmax_j(log p_a,t(j) + G_j)`

has categorical marginal `p_a,t`. The two branches may share `G` even when `p_0,t != p_1,t`. This does **not** reproduce the bit-level state or trace of `torch.multinomial`; it is only a distributional interposition claim.

Assume the induction invariant in the native transition certificate. Then the token claim followed by the native branch transition preserves the marginal law of each arm. `KEEP_SHARED` is law-preserving only for pre-certified immutable observations; `SPLIT` applies the native transition to each restored branch; `INDEPENDENT_FALLBACK` uses independent native samples. Thus retained valid pairs can estimate the fixed terminal effect without making an invalid same-seed claim.

## Uncomparable cases

If `m` of `n` post-admission pairs cannot be restored to a valid native fallback, they cannot be silently removed. With terminal difference in `[-1,1]`, the population mean has the conservative interval

`[(sum_observed D_i - m)/n, (sum_observed D_i + m)/n]`.

This is an honesty condition, not a positive result. It prevents selection bias, but it neither reduces variance nor supplies a target-specific algorithmic guarantee.

## Why this proof cannot close C5

The proof is exactly the composition of categorical Gumbel-Max marginal preservation, ordinary stock-kernel marginal preservation and independent fallback. It has no target-specific bound on covariance, retained-pair fraction, sample complexity or cost. Therefore it satisfies C3/C4 safety but explicitly fails C5's nonproduct requirement.
