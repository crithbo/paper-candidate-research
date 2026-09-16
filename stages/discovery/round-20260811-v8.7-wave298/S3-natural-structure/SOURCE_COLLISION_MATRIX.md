# SOURCE / COLLISION MATRIX

| Family | Official first-party evidence | Direct/contrary evidence | Status |
|---|---|---|---|
| IANA TZif | [IANA tz link](https://data.iana.org/time-zones/tz-link.html), [tzdb index](https://data.iana.org/time-zones/tzdb/?version=published), [how-to](https://data.iana.org/time-zones/tz-how-to.html), [RFC 9636](https://www.rfc-editor.org/rfc/rfc9636) | `zic` already compiles source and TZif specifies reader contract; writer flags/witness unclosed | Unfrozen |
| TeX fmt | [TeX Users Group](https://tug.org/texlive/), [Web2C sources](https://tug.org/texlive/svn/) | exact public artifact/hash trace and engine action union unclosed | Unfrozen |
| Emacs eln | [native compilation](https://www.gnu.org/software/emacs/manual/html_node/elisp/Native-Compilation.html), [functions](https://www.gnu.org/software/emacs/manual/html_node/elisp/Native_002dCompilation-Functions.html) | explicit ABI/version dependence defeats assumed cross-version same-reader trace | Unfrozen |
| GHC hi | [GHC separate compilation](https://downloads.haskell.org/ghc/5.04.1/docs/html/users_guide/separate-compilation.html), [current user guide](https://downloads.haskell.org/ghc/latest/docs/users_guide.pdf) | same-run object/interface relation and existing unchanged-interface retention | Unfrozen |
| OCaml cmi | [OCaml reference manual](https://ocaml.org/releases/3.12/ocaml-3.12-refman.pdf) | exact current union/version contract not frozen | Unfrozen |
| PostgreSQL catalogs | [PostgreSQL source](https://github.com/postgres/postgres), [server docs](https://www.postgresql.org/docs/current/) | exact generated artifact route/current union not frozen | Unfrozen |

No row relies on a future-work/issue absence claim. The only explicit stable public release carrier is IANA; it has no measured recurrence claim in this Discovery packet.
