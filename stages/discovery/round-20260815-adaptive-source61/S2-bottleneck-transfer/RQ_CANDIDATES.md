# RQ candidates — Source61 S2

| ID | Primary same-object RQ | Type hypothesis | Minimum falsifier | Status |
|---|---|---|---|---|
| RQ-S61-01 | Can a target-specific userfaultfd page-materialization plus continuation constructor improve full fault cost while preserving exact post-fault contents and mapping behavior? | `SYSTEM_ARCHITECTURE`, possible N2 | It only selects COPY/ZEROPAGE/CONTINUE or DONTWAKE timing. | ORDINARY_CLOSURE |
| RQ-S61-02 | Can a target-specific THP collapse constructor improve collapse plus access full cost at unchanged virtual-memory semantics? | `SYSTEM_ARCHITECTURE`, possible N2 | It only chooses existing THP policy, `MADV_COLLAPSE` or sysfs threshold. | ORDINARY_CLOSURE |
| RQ-S61-03 | Can a target-specific FUSE backing-registration/open constructor improve passthrough full cost without changing backing-file behavior? | `SYSTEM_ARCHITECTURE`, possible N2 | It only selects existing registration/backing ID/open flag. | ORDINARY_CLOSURE |

No alternative RQs were needed. All questions are pre-evidence scope artifacts, not raw admissions.
