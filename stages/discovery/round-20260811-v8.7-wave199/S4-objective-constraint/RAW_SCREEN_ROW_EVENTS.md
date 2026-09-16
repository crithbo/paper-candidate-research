# Checked certificate raw screen

| id | exact theorem/checker guarantee | current producer/checker action union | smallest alleged whole producer witness | disposition |
|---|---|---|---|---|
| R01 Lean | trusted challenge theorem, exported proof term, official kernel and optional external checker acceptance | parser/elaborator/tactics, kernel, serialized proof, comparator/external check | a proof DAG/term constructor reducing bytes and dual-check cost without changing environment/theorem | `DEEP_DIVE_REQUIRED` |
| R02 Rocq | CIC theorem statement and kernel well-typed proof term | tactics/elaboration, proof term, `Qed` kernel registration/type check | a producer constructor outside current proof-term/elaboration union | `DEEP_DIVE_REQUIRED` |
| R03 Isabelle | fixed Pure/HOL theorem and primitive-inference kernel replay | implicit/full proof reconstruction, expansion, proof checker replay | a certificate producer outside reconstruction/expansion/proof-body union | `DEEP_DIVE_REQUIRED` |
| R04 Metamath | fixed database statement and verifier acceptance | explicit proof steps/database references, verifier proof replay | a step/DAG certificate constructor outside current proof language/verifier | `DEEP_DIVE_REQUIRED` |
| R05 HOL Light | theorem semantics plus kernel acceptance | current complete producer/checker union not frozen from first-party material | no legal action witness | `NOT_ADMITTED_UNFROZEN__CONTRACT_INCOMPLETE` |
| R06 Agda | theorem/type semantics plus type-checker acceptance | current complete producer/checker union not frozen from first-party material | no legal action witness | `NOT_ADMITTED_UNFROZEN__CONTRACT_INCOMPLETE` |

Postprocessing, checker flags, switching checker, or altering theorem/environment are excluded by contract.
