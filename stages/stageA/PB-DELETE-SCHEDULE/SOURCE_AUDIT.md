# First-Party Source and Novelty Audit

Only official/first-party technical sources were used for execution and technical scope:

- IJCAR artifact record and files: https://zenodo.org/records/10630852 (`10.5281/zenodo.10630852`).
- MaxPre upstream repository: https://bitbucket.org/coreo-group/maxpre2.
- MaxSAT Evaluation 2023 official benchmark page: https://maxsat-evaluations.github.io/2023/benchmarks.html.
- VeriPB official repository/releases: https://gitlab.com/MIAOresearch/software/VeriPB and release `3.0.2` commit `c648bac06be995b82bd218e248f005140fc8ce11`.
- CakePB official repository: https://gitlab.com/MIAOresearch/software/cakepb, frozen commit `6edb2f3585f1c3e1b925964c4f33e133f7279d02`.
- Official VeriPB/CakePB SAT Competition documentation: https://satcompetition.github.io/2025/downloads/checkers/veripb.pdf.
- Official Rust and Zig distribution metadata/assets listed in `SOURCE_MANIFEST.yaml`.

The independent Stage 0 novelty confirmation is frozen upstream by report SHA-256 `3D148EC03CCF92355579953650D9371A90C260BEE0A4E40FE091A88F3153AD38` and handoff SHA-256 `B5815F327972566F0916EB11B4001287F103FBDB200DFBB93247E6EF39557654`. Stage A did not substitute a secondary survey for that independent review.

No new positive novelty claim is advanced in this package. The candidate mechanism failed its full-cost test, so a broader latest-collision search cannot raise the evidence ceiling or justify Stage B. The safe result is a same-object mechanism falsification, not a claim that the broader design space lacks novelty.
