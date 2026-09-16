# Wave50 raw screen events

Each row is a fresh `UNIQUE_OPPORTUNITY_FAMILY`, not a repeat of Wave44–49, AIGER, or any registered active/terminal/blocked/hold object.

| raw_id | family | raw decision | reason for/against deep review |
|---|---|---|---|
| R01 | GNU Bison LALR action/goto table construction | `DEEP` | Fixed automaton, native parser semantics, current table emitter, public grammars. |
| R02 | re2c DFA code/table construction | `DROP` | Generated-code representation/encoding family lacks named same-object atomic residual. |
| R03 | flex DFA table compression | `DROP` | Equivalence-preserving table encodings are existing generator choices; no new constructor named. |
| R04 | GNU gettext `.mo` hash-table construction | `DROP` | Hash-table size/ordering reduces to native catalog configuration or a changed catalog contract. |
| R05 | PostgreSQL GiST split construction | `DROP` | Current native opclass split/penalty interface is the complete same-object action surface. |
| R06 | Ghidra SLEIGH decoder-table generation | `DROP` | Candidate changes language-spec/compiler representation, not fixed-decoder construction. |
| R07 | Python `.pyc` marshal/code-object layout | `DROP` | Code-object constants/order are compiler semantics or emitter-local changes. |
| R08 | GNU make dependency-file database construction | `DROP` | Remaining action is a build controller/cache, not a direct same-object constructor. |
| R09 | CMake File API reply-index construction | `DROP` | Generator/reply choice is metadata wrapper rather than a native algorithmic object. |
| R10 | PostgreSQL text-search thesaurus/dictionary index build | `DROP` | Current dictionary/tokenization semantics and configuration absorb proposed ordering action. |
