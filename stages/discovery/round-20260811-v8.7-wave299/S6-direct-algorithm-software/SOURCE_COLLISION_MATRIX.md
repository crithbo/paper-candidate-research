# Source and collision matrix

| primary source | role | result |
|---|---|---|
| [HTS specifications index](https://samtools.github.io/hts-specs/) | Canonical SAM/BAM/BAI and CSI/tabix specification routes. | Fixed format/oracle boundary. |
| [SAM/BAM specification](https://samtools.github.io/hts-specs/SAMv1.pdf) | Binning, chunk joining, linear index and sorted-coordinate requirements. | Strong algorithmic baseline. |
| [Tabix format specification](https://samtools.github.io/hts-specs/tabix.pdf) | Bins, chunks, 16kb intervals and BGZF virtual offsets. | Same-family executable format baseline. |
| [samtools upstream](https://github.com/samtools/samtools) | Official tool/source entry. | Full current builder/options union remains unpinned. |
| Primary direct BAI/CSI construction/query papers and artifacts | Latest direct collision subtraction. | Not closed; no novelty conclusion. |

Only official specifications/project sources support affirmative claims.
