# Source / collision matrix

| first-party source | pinned/checked fact | complete action-union consequence |
|---|---|---|
| [Tady authors' repository](https://github.com/5c4lar/tady), `main`, observed 2026-08-11 | Repository is public, has 36 commits, and README identifies Tady as USENIX Security 2025. Evaluated artifact snapshot in the official appendix is `014cd1d`. | Current branch/source location is recorded; an exact fresh SHA could not be queried locally because Git Schannel lacked credentials. This operational fact is not a drop predicate. |
| same README: dataset and evaluation sections | Supplies binaries and ground truth; provides Pangine, Assemblage, x86 SoK, rw, Quarks, and obfuscation datasets; evaluates Tady, ddisasm, DeepDi, Ghidra, IDA, XDA. | Natural binary carriers and strongest named implementation union are available. |
| same README: train/infer/prune | Attention (`lite`,`sliding`), connection (`all`,`none`), datasets, sample/process counts, section name, model choice, and prune `models` list are configuration/action entrances. | A claim that current Tady has no scoring/pruning action cannot be made. |
| [USENIX Security 2025 official artifact appendix](https://www.usenix.org/sites/default/files/sec25_full_artifact_proceedings.pdf) | Describes neural model plus PDT error-detection/pruning and author artifact/Zenodo availability. | Paper limitation is lead-only; it does not establish an absence gap. |

The strongest union is the executable Tady/TadyA inference-and-PDT path plus the listed disassembler baselines and their supplied result paths. It is fairer than a weak single-model comparator, but it cannot make label accuracy a native semantic equivalence oracle.
