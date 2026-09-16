# Source and collision audit — CVC5-ALETHE-SHAREMAP

Cutoff: `2026-08-09`. Sources below are paper originals or official/upstream project materials. No secondary technical claim was used for the decision.

## Decisive sources

| Source | Status checked | Primary fact used | Review finding |
|---|---|---|---|
| [cvc5 current Alethe documentation](https://cvc5.github.io/docs/latest/proofs/output_alethe.html) | official latest docs, accessed 2026-08-09 | Current example emits nested `:named @p_*` definitions and references; old extra `--dag-thresh=0` requirement is absent | Directly contradicts the frozen current-no-sharing premise |
| [cvc5 current `alethe_printer.cpp`](https://github.com/cvc5/cvc5/blob/main/src/proof/alethe/alethe_printer.cpp) | official upstream `main`, accessed 2026-08-09 | `d_lbind` is driven by `dagThresh`; converted conclusions/arguments and scope arguments are processed; `letify` and `convert(...,"@p_")` are invoked | Native same-object named-term constructor exists |
| [cvc5 current Alethe source directory](https://github.com/cvc5/cvc5/tree/main/src/proof/alethe) | official upstream `main`, accessed 2026-08-09 | Dedicated `alethe_let_binding.cpp/.h`, printer, node converter and postprocessor are current source components | Confirms this is native integration, not an external wrapper |
| [cvc5 1.1.2 Alethe documentation](https://cvc5.github.io/docs/cvc5-1.1.2/proofs/output_alethe.html) | historical official docs | Required `--dag-thresh=0` because sharing output was unsupported | Correct historical statement, invalid as a 2026 current baseline |
| [Alethe specification](https://verit.loria.fr/alethe.pdf) | official format specification | Named SMT-LIB annotations provide syntactic term sharing; veriT exposes `--proof-with-sharing`; subproof context is explicit | Subtracts format action and generic sharing; supplies legality contract |
| [Carcara upstream](https://github.com/ufmg-smite/carcara) | official upstream | Checks an Alethe proof against the original problem and also elaborates proofs | Fair checker/oracle and cost consumer, not a constructor baseline |
| [cvc5 NEWS](https://github.com/cvc5/cvc5/blob/main/NEWS.md) | official upstream, current prerelease/release log | CPC is the default proof format; Ethos versions are tied to cvc5 releases; Alethe coverage continues to improve | CPC/Ethos is a current theorem-level cross-format comparator |
| [SMT-COMP 2025](https://smt-comp.github.io/2025/) | official competition site | Public natural SMT benchmark ecosystem | Supports a finite natural corpus route; not evidence of candidate gain |

## Paper originals used for genealogy and shape

- [Barbosa et al., cvc5: A Versatile and Industrial-Strength SMT Solver, TACAS 2022](https://cvc5.github.io/papers/2022/BarbosaBBKLMMMN-TACAS22.pdf).
- [Schurr et al., Alethe: Towards a Generic SMT Proof Format, PXTP 2021](https://verit.loria.fr/papers/pxtp2021.pdf).
- Carcara TACAS 2023 paper linked from the [official Carcara repository](https://github.com/ufmg-smite/carcara).

## Collision classification

### Direct current-source collision

`cvc5 AletheProofPrinter + AletheLetBinding` covers:

- the same cvc5 proof-output deployment path;
- converted proof conclusions and rule arguments;
- repeated-term traversal and selection controlled by `dag-thresh`;
- native named reference generation in Alethe output;
- scope-sensitive handling sufficient for current supported outputs, as evidenced by explicit `SCOPE` processing and the printer's avoidance of ordinary let insertion under binders.

It therefore absorbs the frozen action-gap claim. The review does not claim that it already optimizes the candidate's combined byte/checker-cost objective.

### Methodological and format subtractors

- Alethe named annotations: exact format action, prior.
- veriT proof sharing: external same-format producer, but different proof DAG/rules.
- generic DAG serialization/letification: makes a purely syntactic wrapper non-novel.

### Non-colliding comparator boundaries

- Carcara checks/elaborates; it does not select cvc5 named bindings.
- CPC/Ethos changes proof format/calculus/checker and cannot replace the same-object Alethe baseline.

## Search status

- Frozen missing-constructor claim: `DIRECT_CURRENT_SOURCE_COLLISION`.
- Narrow residual—costed scope selection beyond current native threshold letification: `SEARCH_BOUNDED_OPEN`.
- No firstness claim is permitted.

## Provenance limitations and non-inference

The rendered upstream source and latest official docs were sufficient to establish the Stage 0 collision. This environment's command-line Git/curl access failed with Windows Schannel credential errors, so the review did not independently resolve the `main` branch head SHA or execute the toolchain. This is not a resource-based scientific STOP and is not evidence against candidate performance. The atomic revision must pin an immutable cvc5 commit/release and archive the relevant source blobs before any claim-bearing observation.

## Frozen upstream package verification

Mainline-provided and locally re-read input identities:

- `TOPIC_BRIEF_CVC5-ALETHE-SHAREMAP.md`: `F2A72D38F7A941157A40D5F790B6EA4A955175921B9107757542ADC5312FF50C`
- upstream `handoff.yaml`: `21003FB19312C795FB2510D634C773D3E9E31B82DB327F84632BDA086F374D52`
- upstream manifest self hash: `24989909247799552B26B56645DA8559D346965A34B2C97F1AE5A86B6BC8F91C`
- mainline mechanical acceptance: `4/4`

The scientific finding supersedes the brief's current-source statement; the Discovery files were not modified.
