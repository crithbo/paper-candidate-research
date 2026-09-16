# Source / collision matrix

| assertion under test | first-party evidence | current result |
|---|---|---|
| export trie is a compressed prefix representation | LLVM pinned `ExportTrie.cpp` | confirmed current LLVM constructor action |
| node serialization requires ULEB offset sizing convergence | LLVM pinned `ExportTrie.cpp` | confirmed; fixed-point layout is already native work |
| all free factoring/order actions are missing from the fair union | Apple ld64 pin + LLVM pin would be required | unclosed: no absence claim |
| reader/oracle can inspect final object | stock LLVM `llvm-objdump` documentation and Mach-O support | available fidelity oracle, subject to future macOS closure |
| direct algorithmic collision | lld radix/trie/fixed-point construction | overlaps the default proposed N2 mechanism |

No legacy release note, review discussion, issue, or future-work text is used to prove a current gap.

