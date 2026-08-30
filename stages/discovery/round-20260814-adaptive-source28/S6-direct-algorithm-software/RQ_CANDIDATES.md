# Source28 RQ Candidates

## RQ01 — x86 AMX tile state

- Seed / identity: `S01` / fixed x86 AMX kernel, tile configuration, code-object ABI and numerical output.
- Contribution hypothesis: `COMPILER_TOOL` / N2.
- RQ-A: For a fixed AMX kernel and ABI, can a bounded tile-state constructor minimize legal configuration/spill/reload transitions with an exact or FPT resource guarantee?
- RQ-B: Under the same AMX semantics, is there a certified Pareto frontier for tile configuration reuse versus register/spill cost that current backend composition cannot express?
- Selected RQ: RQ-A; it is singular and has a falsifiable bounded-state endpoint.
- In scope / out of scope: intra-function AMX codegen and fixed semantics / generic register allocation, target switching, runtime scheduling.
- Minimum carrier/oracle: public AMX kernel/test and stock code-object or instruction-semantics checker.
- Earliest falsifier: official source shows a complete same-object tile-state construction or only a single legal action.
- FINER-lite: feasible `CONDITIONAL`; interesting `CLEAR`; novelty threat `UNKNOWN`; ethics/scope `PASS`; relevant `CONDITIONAL`.
- Precommitted route: current LLVM x86 AMX lowering/source + official Intel AMX semantics + primary collision search.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ02 — GPU asynchronous-copy barrier groups

- Seed / identity: `S02` / fixed GPU kernel, asynchronous-copy and barrier semantics, target ABI and output.
- Contribution hypothesis: `SYSTEM_ARCHITECTURE` / N2.
- RQ-A: Can a target-specific finite construction choose legal async-copy/barrier group boundaries for a fixed kernel while certifying absence of premature consumption?
- RQ-B: Under fixed semantics, can a bounded representation minimize barrier-state footprint without changing memory-order behavior?
- Selected RQ: RQ-A; it has a precise safety endpoint.
- In scope / out of scope: native compiler-visible async copy/barrier actions / pipeline controller, generic schedule search, changed memory model.
- Minimum carrier/oracle: official target kernel test and stock validator/compiler semantics.
- Earliest falsifier: no two native legal actions exist or the candidate changes memory-order semantics.
- FINER-lite: feasible `CONDITIONAL`; interesting `CLEAR`; novelty threat `HIGH`; ethics/scope `PASS`; relevant `CONDITIONAL`.
- Precommitted route: official target async-copy specification/source + current compiler lowering + primary collision search.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ03 — RISC-V Zfa rounding-preserving form construction

- Seed / identity: `S04` / fixed RISC-V Zfa expression graph, ISA/rounding semantics and code object.
- Contribution hypothesis: `COMPILER_TOOL` / N2.
- RQ-A: For a fixed rounding-mode expression graph, can a bounded Zfa-form constructor minimize materialization/code size while preserving IEEE-visible outcomes?
- RQ-B: Can a target-specific certified frontier distinguish legal Zfa form combinations from ordinary peephole selection under identical flags?
- Selected RQ: RQ-A; its endpoint and falsifier are clearer.
- In scope / out of scope: fixed ISA and rounding observable behavior / target-feature flag selection, generic instruction selection.
- Minimum carrier/oracle: public ISA test/correctness suite plus stock assembler/disassembler/ISA semantics.
- Earliest falsifier: current source already composes the identical form action or no non-generic bounded state exists.
- FINER-lite: feasible `CONDITIONAL`; interesting `CLEAR`; novelty threat `MEDIUM`; ethics/scope `PASS`; relevant `CONDITIONAL`.
- Precommitted route: official RISC-V Zfa spec + current compiler source/options + primary collision search.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

The three RQs are same-object variants within each seed and were selected before evidence results. They are not raw or novelty findings.
