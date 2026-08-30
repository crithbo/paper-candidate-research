# Source and collision matrix

| Family | Official/current source | Action-union result |
|---|---|---|
| re2c | [upstream source](https://github.com/skvadrik/re2c); [official manual](https://re2c.org/manual/manual.html) | automaton/state/transition/code-model actions are current native union |
| Ragel | [upstream source](https://github.com/adrian-thurston/ragel); [official site](https://www.colm.net/open-source/ragel/) | FSM/code-generation representations are native union |
| GNU as | [official GNU as manual](https://sourceware.org/binutils/docs/as/); [binutils source](https://sourceware.org/git/binutils-gdb.git) | object/relocation/layout actions are native union |
| libyaml | [upstream source](https://github.com/yaml/libyaml) | initial same-object whole action not frozen |
| RapidJSON | [upstream source](https://github.com/Tencent/rapidjson) | generic serialization/no nontrivial whole action frozen |
| cmark-gfm | [upstream source](https://github.com/github/cmark-gfm) | extension/output-policy semantics not closed |

All conclusions use affirmative source/action facts. No future-work or absence claim supplies a gap.
