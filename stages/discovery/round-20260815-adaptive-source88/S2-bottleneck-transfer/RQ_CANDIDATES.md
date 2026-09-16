# Same-object RQs

Official WebKit documentation describes JSC’s LLInt, Baseline, DFG and FTL tiers, a two-way baseline/DFG OSR relation, and bytecode as the source of truth that remains resident. Primary RQ: for a fixed ECMAScript program, engine/target configuration and observable ECMAScript results, can a target-specific **bytecode encoding plus OSR-state-map constructor** jointly choose legal bytecode operand/metadata placement and baseline↔DFG reconstruction maps to certify a bytecode-residency / OSR / tier-transition full-cost frontier?

The alternate asks if the same joint representation gives a certified bound under a fixed bytecode CFG/OSR interface. Both are one family. Bytecode flag choices, changed language semantics, generic compression, a controller or JIT disabling are excluded.
