# Source98 S5 RQ candidate

## S5-98-RQ01

- Exact anchor candidate: official Erlang/OTP Mnesia API `transform_table` and table-copy/fragmentation documentation.
- Immutable boundary: fixed Mnesia logical table, transaction semantics, reader-visible record values, and stock recovery semantics.
- Primary RQ: Can a Mnesia-native schema/table transformation maintain the exact table and transaction contract with a target-specific bounded-recourse constructor beyond the stock table-transform/copy/fragment union?
- In scope: atomic data/layout transition and a complexity/recourse guarantee. Out: migration timing, retries, generic planners, rebalancers, or changed record/transaction semantics.
- Counterfactual: a large table could change schema/state with bounded disruption and complete cost accounting without semantic downgrade.
- Contribution hypothesis: METHOD_ALGORITHM/N2.
- Null hypothesis: current Mnesia transform and copy actions already form the complete legal transition; residual is only scheduling/policy.
- Precommitted primary source: official current Mnesia reference manual. Fallback only for transport failure: official OTP Mnesia user guide.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
