# Source and collision matrix

| primary/official source | frozen fact | consequence |
|---|---|---|
| IETF, [draft-ietf-opsawg-pcapng-05](https://datatracker.ietf.org/doc/draft-ietf-opsawg-pcapng/) | Active 2026 pcapng specification; records packet captures, is extensible, and its complex layout contains multiple IDBs, EPBs, NRBs and ISBs. | Establishes same-object legal grammar and a multi-interface witness, not a residual. |
| Wireshark, [current `wiretap/pcapng.c`](https://gitlab.com/wireshark/wireshark/-/raw/master/wiretap/pcapng.c) | Current reader has pcapng block/option handler machinery, interface state, EPB, NRB and custom-block representations, and writer callbacks. | Confirms current upstream is nontrivial; prevents using an old issue or spec freedom as absence evidence. |
| Wireshark, [current `dumpcap.c`](https://gitlab.com/wireshark/wireshark/-/blob/master/dumpcap.c) | Current capture program includes pcapng modules and writer support. | Source locus for later full config enumeration. |
| Wireshark, [User's Guide—Files and Folders](https://www.wireshark.org/docs/wsug_html_chunked/_files_and_folders.html) | Wireshark uses pcapng as its default saved-capture format. | Supports native carrier/tool relevance only. |

**Latest direct-collision result.** No direct paper collision was needed or claimed.  The admission fails earlier: a complete source-pinned native writer union and a union-external complete N2 action are both unclosed.  Old issues, future work, and the existence of alternative legal blocks were not used as gap evidence.
