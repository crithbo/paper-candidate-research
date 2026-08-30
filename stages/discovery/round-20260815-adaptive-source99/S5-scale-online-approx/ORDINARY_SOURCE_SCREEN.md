# Source99 ordinary R40 source screen

| Role | Official primary source | Finding |
|---|---|---|
| ANCHOR / CURRENT | https://docs.oracle.com/en/java/javase/24/docs/specs/man/java.html | Static/dynamic CDS creation, loading, archive flags, constraints, and startup/footprint endpoint. |
| CURRENT union | https://docs.oracle.com/en/java/javase/23/vm/class-data-sharing.html | Dynamic archive at exit, base/top layer relationship, `jcmd VM.cds`, `Xshare`, and auto-create options. |
| CONTRARY | https://openjdk.org/jeps/350 | Dynamic top-layer archive depends on base archive and checks recorded CRC compatibility. |

Two bounded official documentation routes were used. The source-level union and any true incremental archive transition remain explicitly open; this screen does not claim they are absent.
