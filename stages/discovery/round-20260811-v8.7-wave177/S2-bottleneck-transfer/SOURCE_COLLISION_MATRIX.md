# Recent first-party artifact N3 breadth — source and collision matrix

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE177-RECENT-FIRST-PARTY-ARTIFACT-N3-BREADTH`  
**Cutoff:** 2026-08-11. Only paper, author-repository, official conference, or author publication-page sources are used.

| Family | Primary paper / artifact anchor | Provenance and collision decision |
|---|---|---|
| RAGPulse | [paper](https://arxiv.org/abs/2511.12979), [author repository](https://github.com/flashserve/RAGPulse) | trace provenance and stable-locality hypothesis are available, but content-aware batching/retrieval caching is already the direct same-object mechanism union; no complete residual action frozen; `DROP` |
| WEAVER | [USENIX paper](https://www.usenix.org/system/files/atc25-gao.pdf) | real-world trace is reported, but no inspectable author artifact with versioned trace/result provenance was verified; published offloading is not a residual; `NOT_ADMITTED_UNFROZEN` |
| Fast ACS | [USENIX paper](https://www.usenix.org/conference/atc25/presentation/gupta) | production deployment reported, but no public author artifact with natural trace/result provenance verified; `NOT_ADMITTED_UNFROZEN` |
| GoFree | [author paper/artifact page](https://homes.cs.washington.edu/~mernst/pubs/explicit-free-cgo2025-abstract.html) | artifact and open programs are reported, but no verified versioned natural trace/result provenance; `NOT_ADMITTED_UNFROZEN` |
| SolFS | [ATC 2025 proceedings index](https://www.usenix.org/sites/default/files/atc25_contents.pdf) | paper is recent/primary; no public author artifact carrying natural backup trace provenance verified; `NOT_ADMITTED_UNFROZEN` |
| PIMANN | [ATC 2025 technical sessions](https://www.usenix.org/conference/atc25/technical-sessions) | implementation repository is named, but no verified natural trace/result provenance; `NOT_ADMITTED_UNFROZEN` |

## Evidence boundary

“Not verified” means the accessible primary pages did not establish the required public artifact contents during this no-download static pass. It is not an absence claim about source code, a claim that an artifact does not exist, or a scientific STOP. The RAGPulse direct collision is stronger: the paper itself identifies caching and content-aware batching as the intended utilization class, and no union-external full action, quality guarantee, or full-cost residual was named.

`PROPOSE_STAGE0: []`.
