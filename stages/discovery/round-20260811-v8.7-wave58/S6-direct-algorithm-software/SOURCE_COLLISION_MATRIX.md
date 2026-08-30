# Source and collision matrix — Wave58

| Family | First-party / primary source | Current complete action | Result |
|---|---|---|---|
| Cuckoo filter | [Cuckoo Filter paper](https://www.cs.cmu.edu/~dga/papers/cuckoo-conext2014.pdf) | Bucket assignment/relocation | Direct construction family. |
| XOR/fuse filter | [xorfilter](https://github.com/FastFilter/xorfilter) | Static peel/fingerprint construction | Direct construction family. |
| Quotient filter | [Quotient Filter paper](https://www.cs.cmu.edu/~dga/papers/cuckoo-conext2014.pdf) | Cluster/quotient construction | Direct construction family. |
| BBHash | [BBHash upstream](https://github.com/rizkg/BBHash) | MPHF build | Direct MPHF family. |
| MARISA | [MARISA trie](https://github.com/s-yata/marisa-trie) | Static trie builder | Native builder/encoding union. |
| Cedar | [Cedar](http://www.tkl.iis.u-tokyo.ac.jp/~ynaga/cedar/) | Double-array trie construction | Direct trie family. |
| Aho–Corasick | [original paper record](https://dl.acm.org/doi/10.1145/360825.360855) | Failure-link automaton construction | Complete direct automaton construction. |
| Bloom filter | [Bloom 1970](https://dl.acm.org/doi/10.1145/362686.362692) | Bit-set/hash construction | Fixed FPR/build union. |

No retained candidate relies on an absence claim. Existing actions are treated as strong baselines, and the deep DROP follows only because the named assignment is already a direct static-filter family or a prohibited generic oracle.
