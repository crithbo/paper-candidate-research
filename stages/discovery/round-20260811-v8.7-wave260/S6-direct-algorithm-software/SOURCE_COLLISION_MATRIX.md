# Source and collision matrix

| Family | First-party source anchor | Strongest-union / collision closure |
|---|---|---|
| Xapian Glass | [xapian/xapian](https://github.com/xapian/xapian) | Full build layout controls and B-tree/index construction literature unclosed. |
| GNU gettext `.mo` | [GNU gettext source](https://git.savannah.gnu.org/cgit/gettext.git) | `msgfmt` modes plus hash/string layout literature unclosed. |
| Sphinx Search | [sphinxsearch/sphinx](https://github.com/sphinxsearch/sphinx) | Full builder configuration and compressed inverted-index literature unclosed. |
| Fossil delta | [Fossil source](https://fossil-scm.org/home/dir?ci=trunk) | Excluded near-version-control object. |
| GNU ar | [GNU binutils source](https://sourceware.org/git/binutils-gdb.git) | Archive/linker observability or routine writer ordering. |
| libsolv | [openSUSE libsolv](https://github.com/openSUSE/libsolv) | Source/semantic union not sufficiently frozen. |

The matrix records source anchors only; it deliberately does not convert an incomplete current-union audit into an absence claim.
