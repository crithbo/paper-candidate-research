# Research-question candidate

## Primary RQ — fixed PostgreSQL notification endpoint

For a fixed PostgreSQL database state, transaction sequence, `NOTIFY(channel,payload)` calls, listener transaction states, and stock listener-visible notification endpoint, can a PostgreSQL-specific constructor reduce notification queue or server cost by changing publication grouping while preserving: (1) no notification from an aborted transaction, (2) delivery only at the documented transaction boundaries, (3) transaction-local duplicate folding, and (4) documented delivery order?

Alternative wording was unnecessary: the object, endpoint, estimand, and counterfactual are identical.

## Consequence and discriminator

An affirmative answer needs a non-generic, same-information transaction-publication algorithm. A mechanism that releases before commit, during a listener transaction, reorders notifications, or substitutes polling changes the fixed observable contract. A mechanism that merely batches the already legal publication events is generic dispatch/control rather than N2.
