# Evidence-qualified question-card audit — Source89 S6

## QC-S89-01 — GNU Diffutils hunk/edit-script construction

**Exact object/oracle.** Fixed file pair, normalization flags and output format under GNU Diffutils 3.12. The output must either be an edit script transforming file A to B, or—if hunk bytes are fixed—be exactly that formatted output. A stock apply/compare oracle checks transformation; a format-sensitive caller may require byte-exact output. Natural carrier: a versioned public source-file revision pair.

**Proposed N2 action.** Jointly choose common-line correspondences, hunk boundaries and performance mode to reduce comparison CPU/RSS/output size while preserving the chosen endpoint.

**Current union and direct generic subtractor.** The current official manual documents near-minimal normal operation, `--minimal` to seek a smaller difference set, `--speed-large-files`, `--horizon-lines`, and hunk boundary shifting. It explicitly identifies multiple valid common-line matches/hunk outputs, names Myers and Ukkonen difference algorithms, and documents a current heuristic tradeoff.

**Action-survival witness.** For reversed lines `a,b,c` versus `c,b,a`, the manual gives distinct valid hunk decompositions based on which common line is selected. If formatted hunk bytes are part of the endpoint, choosing another match changes endpoint. If only transformation correctness/minimality is fixed, the action is exactly a generic longest-common-subsequence/edit-distance construction addressed by the named algorithm family and current `--minimal`. Format/context selection is an emitter policy, not a target-specific algorithm.

**Falsifier/full cost/finite route.** The documented three-line witness is the minimal action-divergence test. A finite StageA route would pin 3.12, compare default/minimal/speed modes on a public revision pair, use apply/recompare oracle, and reject unless a target-specific non-generic guarantee survives. Full cost includes comparison CPU/RSS, output bytes, edit-script/hunk size, formatting and checker/apply time. No run occurred here.

**Disposition.** `EXCLUDED_BEFORE_RAW__MULTIPLE_LEGAL_HUNK_OUTPUTS_CHANGE_FORMAT_ENDPOINT_OR_VALID_TRANSFORMATION_REDUCES_TO_CURRENT_AND_GENERIC_SEQUENCE_DIFFERENCE_KERNEL`. Structural, not resource/readiness/result inference.
